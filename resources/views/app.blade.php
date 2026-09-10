@extends('layouts.public')

@section('title', 'Aplikasi')

@section('content')
<div id="app" class="min-h-screen bg-gray-100"></div>
<div id="toastContainer" class="fixed bottom-4 right-4 z-[100] flex flex-col items-end gap-2"></div>

<style>
    .toast-item {
        opacity: 0;
        transform: translateY(10px);
        transition: opacity .25s ease, transform .25s ease;
        color: #fff;
        box-shadow: 0 4px 14px rgba(0,0,0,.15);
        max-width: 90vw;
    }
    .toast-item.show { opacity: 1; transform: translateY(0); }
</style>

<script>
    // ============================================================
    // SIPEMAKAMAN — Frontend Cadangan (SPA-lite dengan Blade)
    // Mengonsumsi API Laravel dengan Sanctum token di localStorage
    // ============================================================
    (function () {
        'use strict';

        const TOKEN_KEY = 'sipem_token';
        const ROLE_KEY = 'sipem_role';
        const USER_KEY = 'sipem_user';

        const token = localStorage.getItem(TOKEN_KEY);
        const role = localStorage.getItem(ROLE_KEY);
        const user = JSON.parse(localStorage.getItem(USER_KEY) || 'null');

        // ---- Jika tidak login, kembali ke halaman login ----
        if (!token || !role) {
            window.location.href = '/login';
            return;
        }

        // ==================== API HELPER ====================
        async function api(path, options = {}) {
            const headers = {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                'Authorization': 'Bearer ' + token,
                ...(options.headers || {}),
            };
            const res = await fetch('/api' + path, { ...options, headers });

            if (res.status === 401) {
                localStorage.clear();
                window.location.href = '/login';
                throw new Error('Sesi berakhir');
            }

            const text = await res.text();
            let data = {};
            try { data = text ? JSON.parse(text) : {}; } catch (e) { data = { raw: text }; }

            if (!res.ok) {
                const msg = data.message || data.error || 'Terjadi kesalahan (HTTP ' + res.status + ')';
                const err = new Error(msg);
                err.data = data;
                err.status = res.status;
                throw err;
            }
            return data;
        }

        function esc(str) {
            if (str === null || str === undefined) return '';
            return String(str)
                .replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
                .replace(/"/g, '&quot;').replace(/'/g, '&#39;');
        }

        function toast(msg, type) {
            const colors = { success: 'bg-sky-600', error: 'bg-red-600', warning: 'bg-amber-500' };
            const container = document.getElementById('toastContainer');
            if (!container) return;
            const el = document.createElement('div');
            el.className = 'toast-item rounded-lg px-4 py-3 text-sm font-medium ' + (colors[type] || colors.success);
            el.textContent = msg;
            container.appendChild(el);
            requestAnimationFrame(() => el.classList.add('show'));
            setTimeout(() => {
                el.classList.remove('show');
                setTimeout(() => el.remove(), 300);
            }, 3200);
        }

        function showPendingToast() {
            const t = sessionStorage.getItem('sipem_toast');
            if (!t) return;
            sessionStorage.removeItem('sipem_toast');
            try {
                const d = JSON.parse(t);
                toast(d.msg, d.type);
            } catch (e) { /* abaikan */ }
        }

        function fmtDate(d) {
            if (!d) return '-';
            // Pastikan date string dianggap sebagai tanggal lokal
            const date = new Date(d.length === 10 ? d + 'T00:00:00' : d);
            if (isNaN(date)) return '-';
            return date.toLocaleDateString('id-ID', { day: 'numeric', month: 'short', year: 'numeric' });
        }

        function badge(status) {
            const map = {
                'disetujui': 'bg-sky-100 text-sky-700',
                'menunggu': 'bg-amber-100 text-amber-700',
                'menunggu_verifikasi': 'bg-amber-100 text-amber-700',
                'ditolak': 'bg-red-100 text-red-700',
                'terisi': 'bg-sky-100 text-sky-700',
                'kosong': 'bg-gray-100 text-gray-600',
                'aktif': 'bg-sky-100 text-sky-700',
                'tidak_aktif': 'bg-red-100 text-red-700',
            };
            const cls = map[status] || 'bg-gray-100 text-gray-600';
            return '<span class="inline-flex rounded-full px-2.5 py-0.5 text-xs font-medium ' + cls + '">' + esc(status) + '</span>';
        }

        // ==================== ROLE & AKSES ====================
        // Hak akses baru:
        //  - SuperAdmin : CRUD semua + ubah koordinat peta + approve permintaan hapus
        //  - AdminUptd  : seperti SuperAdmin tapi fokus wilayah UPTD-nya, tanpa CRUD master
        //  - AdminTPU   : Create, Read, Delete(request) — TANPA edit & TANPA ubah koordinat peta
        const isSuperAdmin = role === 'SuperAdmin';
        const isAdminTpu = role === 'AdminTpu';
        const isUptd = role === 'Uptd';
        // Boleh buat data baru (Create)
        const canCreate = isSuperAdmin || isUptd || isAdminTpu;
        // Boleh edit / ubah data (Update) — AdminTPU TIDAK
        const canEdit = isSuperAdmin || isUptd;
        // Boleh update koordinat makam di peta — AdminTPU TIDAK
        const canManageKoordinat = isSuperAdmin || isUptd;
        // Boleh hapus langsung (SuperAdmin/AdminUptd). AdminTPU via permintaan
        const canDelete = isSuperAdmin || isUptd;
        // Upload Excel data almarhum & unduh template: hanya SuperAdmin & AdminUptd
        const canImportExport = isSuperAdmin || isUptd;

        // ==================== MENU DEFINISI ====================
        const menus = [
            { id: 'dashboard', icon: '📊', label: 'Dashboard' },
            { id: 'almarhum', icon: '🪦', label: 'Almarhum' },
            { id: 'makam', icon: '⬛', label: 'Makam' },
            { id: 'ahliwaris', icon: '👥', label: 'Ahli Waris' },
            { id: 'peta', icon: '🗺️', label: 'Peta' },
        ];
        if (isSuperAdmin) {
            menus.push({ id: 'master', icon: '🏛️', label: 'Master' });
        }
        // Log Aktivitas & Permintaan Hapus: SuperAdmin & AdminUptd
        if (isSuperAdmin || isUptd) {
            menus.push({ id: 'aktivitas', icon: '📜', label: 'Log Aktivitas' });
            menus.push({ id: 'permintaan', icon: '🗑️', label: 'Permintaan Hapus' });
        }

        const userLabel = user ? (user.nama_lengkap || user.username || user.nama_uptd || role) : role;
        const roleLabel = {
            SuperAdmin: 'Super Admin',
            Uptd: 'Admin UPTD',
            AdminTpu: 'Admin TPU',
        }[role] || role;

        const appRoot = document.getElementById('app');
        let currentMenu = 'dashboard';

        // ==================== LAYOUT ====================
        function renderLayout() {
            appRoot.innerHTML = `
                <div class="flex min-h-screen overflow-hidden">
                    <!-- Sidebar -->
                    <aside class="hidden w-64 shrink-0 flex-col bg-sky-800 text-white md:flex">
                        <div class="border-b border-sky-700">
                            <div class="flex h-1.5">
                                <span class="flex-1 bg-sky-400"></span>
                                <span class="flex-1 bg-sky-500"></span>
                                <span class="flex-1 bg-sky-700"></span>
                            </div>
                            <div class="flex h-16 items-center gap-2 px-5">
                                <span class="text-2xl">🏛️</span>
                                <span class="text-lg font-bold">SIPEMAKAMAN</span>
                            </div>
                        </div>
                        <nav class="flex-1 space-y-1 p-4" id="sidebarNav">
                            ${menus.map(m => `
                                <a href="#" data-menu="${m.id}"
                                   class="flex items-center gap-3 rounded-lg px-3 py-2.5 text-sm font-medium hover:bg-sky-700 ${m.id === currentMenu ? 'bg-sky-700' : ''}"
                                   id="menu-${m.id}">
                                    <span>${m.icon}</span> ${m.label}
                                </a>
                            `).join('')}
                        </nav>
                        <div class="border-t border-sky-700 p-4">
                            <div class="flex items-center gap-3">
                                <div class="flex h-9 w-9 items-center justify-center rounded-full bg-sky-600 font-bold">${esc((userLabel||'?')[0].toUpperCase())}</div>
                                <div class="min-w-0">
                                    <p class="truncate text-sm font-semibold">${esc(userLabel)}</p>
                                    <p class="truncate text-xs text-sky-300">${esc(roleLabel)}</p>
                                </div>
                            </div>
                            <button id="logoutBtn" class="mt-3 w-full rounded-lg bg-red-600/20 px-3 py-2 text-sm font-medium text-red-200 hover:bg-red-600/40">Keluar</button>
                        </div>
                    </aside>

                    <!-- Konten -->
                    <div class="flex min-w-0 flex-1 flex-col">
                        <!-- Topbar (mobile) -->
                        <header class="flex h-16 items-center justify-between border-b border-gray-200 bg-white px-4 md:hidden">
                            <span class="text-lg font-bold text-sky-700">🏛️ SIPEMAKAMAN</span>
                            <button id="mobileMenuBtn" class="rounded-lg border border-gray-300 p-2">☰</button>
                        </header>

                        <main class="min-w-0 flex-1 overflow-x-hidden p-6">
                            <div id="content"><!-- konten halaman --></div>
                        </main>
                    </div>
                </div>
                <!-- Mobile drawer -->
                <div id="mobileDrawer" class="fixed inset-0 z-40 hidden">
                    <div class="absolute inset-0 bg-black/50" id="drawerOverlay"></div>
                    <div class="absolute inset-y-0 left-0 w-64 bg-sky-800 p-4">
                        <div class="absolute inset-x-0 top-0 flex h-1.5">
                            <span class="flex-1 bg-sky-400"></span>
                            <span class="flex-1 bg-sky-500"></span>
                            <span class="flex-1 bg-sky-700"></span>
                        </div>
                        <nav class="mt-4 space-y-1">
                            ${menus.map(m => `
                                <a href="#" data-menu="${m.id}"
                                   class="flex items-center gap-3 rounded-lg px-3 py-2.5 text-sm font-medium text-white hover:bg-sky-700">
                                    <span>${m.icon}</span> ${m.label}
                                </a>`).join('')}
                        </nav>
                    </div>
                </div>`;

            // Sidebar nav listener
            appRoot.querySelectorAll('[data-menu]').forEach(link => {
                link.addEventListener('click', (e) => {
                    e.preventDefault();
                    go(link.dataset.menu);
                });
            });

            // Logout
            document.getElementById('logoutBtn').addEventListener('click', async () => {
                const ok = await confirmDialog({
                    title: 'Keluar dari Sistem',
                    message: 'Anda yakin ingin keluar? Anda harus login kembali untuk mengakses aplikasi.',
                    confirmLabel: 'Keluar',
                    danger: false,
                });
                if (!ok) return;
                await api('/logout', { method: 'POST' }).catch(() => {});
                sessionStorage.setItem('sipem_toast', JSON.stringify({ type: 'success', msg: 'Anda berhasil keluar dari sistem' }));
                localStorage.clear();
                window.location.href = '/login';
            });

            // Mobile drawer
            const drawer = document.getElementById('mobileDrawer');
            document.getElementById('mobileMenuBtn').addEventListener('click', () => drawer.classList.remove('hidden'));
            document.getElementById('drawerOverlay').addEventListener('click', () => drawer.classList.add('hidden'));
        }

        function go(menu) {
            if (menu === 'peta') {
                window.open('/peta', '_blank');
                return;
            }
            currentMenu = menu;
            // update sidebar highlight
            appRoot.querySelectorAll('#sidebarNav [data-menu]').forEach(a => {
                a.className = 'flex items-center gap-3 rounded-lg px-3 py-2.5 text-sm font-medium hover:bg-sky-700' +
                    (a.dataset.menu === menu ? ' bg-sky-700' : '');
            });
            document.getElementById('mobileDrawer').classList.add('hidden');
            render();
        }

        // ==================== ROUTER / RENDER ====================
        async function render() {
            const content = document.getElementById('content');
            content.innerHTML = '<div class="py-20 text-center text-gray-500">Memuat...</div>';

            try {
                switch (currentMenu) {
                    case 'dashboard': await renderDashboard(content); break;
                    case 'almarhum': await renderAlmarhum(content); break;
                    case 'makam': await renderMakam(content); break;
                    case 'ahliwaris': await renderAhliWaris(content); break;
                    case 'master': await renderMaster(content); break;
                    case 'aktivitas': await renderAktivitas(content); break;
                    case 'permintaan': await renderPermintaan(content); break;
                    default: renderDashboard(content);
                }
            } catch (err) {
                content.innerHTML = '<div class="rounded-lg bg-red-50 p-4 text-red-700">' + esc(err.message) + '</div>';
            }
        }

        // ==================== DASHBOARD ====================
        async function renderDashboard(el) {
            // Ringkasan: ambil data dari beberapa endpoint (jumlah via pagination .total)
            const [makamAll, makamTerisi, makamKosong, almarhumData] = await Promise.all([
                api('/makam?per_page=1'),
                api('/makam?status=terisi&per_page=1'),
                api('/makam?status=kosong&per_page=1'),
                api('/almarhum?per_page=1'),
            ]);

            const totalMakam = makamAll.total || 0;
            const terisi = makamTerisi.total || 0;
            const kosong = makamKosong.total || 0;
            const totalAlmarhum = almarhumData.total || 0;

            const stat = [
                { label: 'Total Makam', value: totalMakam, icon: '⬛', color: 'border-blue-500' },
                { label: 'Makam Terisi', value: terisi, icon: '🪦', color: 'border-sky-500' },
                { label: 'Makam Kosong', value: kosong, icon: '▢', color: 'border-amber-500' },
                { label: 'Total Almarhum', value: totalAlmarhum, icon: '👤', color: 'border-indigo-500' },
            ];

            el.innerHTML = `
                <div class="mb-6">
                    <h1 class="text-2xl font-bold text-gray-900">Dashboard</h1>
                    <p class="mt-1 text-sm text-gray-500">Selamat datang, ${esc(userLabel)}. Berikut ringkasan sistem.</p>
                </div>
                <div class="grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
                    ${stat.map(s => `
                        <div class="rounded-xl border-t-4 ${s.color} bg-white p-5 shadow-sm">
                            <div class="text-2xl">${s.icon}</div>
                            <p class="mt-2 text-3xl font-bold text-gray-900">${esc(s.value)}</p>
                            <p class="mt-1 text-sm text-gray-500">${esc(s.label)}</p>
                        </div>`).join('')}
                </div>

                <div class="mt-8 rounded-xl bg-white p-6 shadow-sm">
                    <h2 class="text-lg font-semibold text-gray-900">Distribusi Makam</h2>
                    <div class="mt-4 flex flex-col gap-4 sm:flex-row">
                        <div class="flex-1">
                            <div class="mb-1 flex justify-between text-sm"><span>Terisi</span><span class="font-semibold">${terisi}</span></div>
                            <div class="h-2.5 w-full rounded bg-gray-200"><div class="h-2.5 rounded bg-sky-500" style="width:${totalMakam ? (terisi/totalMakam*100).toFixed(1) : 0}%"></div></div>
                        </div>
                        <div class="flex-1">
                            <div class="mb-1 flex justify-between text-sm"><span>Kosong</span><span class="font-semibold">${kosong}</span></div>
                            <div class="h-2.5 w-full rounded bg-gray-200"><div class="h-2.5 rounded bg-amber-500" style="width:${totalMakam ? (kosong/totalMakam*100).toFixed(1) : 0}%"></div></div>
                        </div>
                    </div>
                </div>

                <div id="dashAlmarhum" class="mt-8 rounded-xl bg-white p-6 shadow-sm"></div>`;

            await renderDashAlmarhum();
        }

        // ============ DASHBOARD: DATA ALMARHUM LENGKAP (pagination 10/20/50) ============
        const dashAlm = { page: 1, perPage: 10, search: '', sortBy: 'tanggal_wafat', sortDir: 'desc' };
        async function renderDashAlmarhum() {
            const box = document.getElementById('dashAlmarhum');
            if (!box) return;

            const qs = new URLSearchParams({ per_page: dashAlm.perPage, page: dashAlm.page });
            if (dashAlm.search) qs.set('q', dashAlm.search);
            qs.set('sort_by', dashAlm.sortBy);
            qs.set('sort_dir', dashAlm.sortDir);
            const data = await api('/almarhum?' + qs);

            const rows = (data.data || []).map((a, idx) => {
                const m = a.makam;
                const aw = (a.ahli_waris || [])[0] || {};
                const koor = m?.koordinat;
                return `
                <tr class="border-b border-gray-100 hover:bg-gray-50">
                    <td class="px-3 py-3">${(data.current_page - 1) * dashAlm.perPage + idx + 1}</td>
                    <td class="px-3 py-3">${esc(a.no_registrasi || '-')}</td>
                    <td class="px-3 py-3">${esc(m?.kode_makam || m?.nomor_makam || '-')}</td>
                    <td class="px-3 py-3 font-medium">${esc(a.nama_lengkap)}</td>
                    <td class="px-3 py-3">${esc(a.bin_binti || '-')}</td>
                    <td class="px-3 py-3">${esc(a.nik || '-')}</td>
                    <td class="px-3 py-3">${esc(a.jenis_kelamin || '-')}</td>
                    <td class="px-3 py-3">${esc(a.alamat_jalan || '-')}</td>
                    <td class="px-3 py-3">${esc(a.alamat || '-')}</td>
                    <td class="px-3 py-3">${esc(a.no_rumah || '-')}</td>
                    <td class="px-3 py-3">${esc(a.rt || '-')}</td>
                    <td class="px-3 py-3">${esc(a.rw || '-')}</td>
                    <td class="px-3 py-3">${esc(a.provinsi || '-')}</td>
                    <td class="px-3 py-3">${esc(a.kota_kabupaten || '-')}</td>
                    <td class="px-3 py-3">${esc(a.kecamatan || '-')}</td>
                    <td class="px-3 py-3">${esc(a.kelurahan || '-')}</td>
                    <td class="px-3 py-3">${fmtDate(a.tanggal_lahir)}</td>
                    <td class="px-3 py-3">${fmtDate(a.tanggal_wafat)}</td>
                    <td class="px-3 py-3">${fmtDate(a.tanggal_dimakamkan)}</td>
                    <td class="px-3 py-3">${esc(m?.blok?.nama_blok || m?.blok?.kode_blok || '-')}</td>
                    <td class="px-3 py-3">${esc(aw.nama_lengkap || '-')}</td>
                    <td class="px-3 py-3">${esc(aw.nik || '-')}</td>
                    <td class="px-3 py-3">${esc(aw.alamat_jalan || '-')}</td>
                    <td class="px-3 py-3">${esc(aw.alamat || '-')}</td>
                    <td class="px-3 py-3">${esc(aw.no_rumah || '-')}</td>
                    <td class="px-3 py-3">${esc(aw.rt || '-')}</td>
                    <td class="px-3 py-3">${esc(aw.rw || '-')}</td>
                    <td class="px-3 py-3">${esc(aw.provinsi || '-')}</td>
                    <td class="px-3 py-3">${esc(aw.kota_kabupaten || '-')}</td>
                    <td class="px-3 py-3">${esc(aw.kecamatan || '-')}</td>
                    <td class="px-3 py-3">${esc(aw.kelurahan || '-')}</td>
                    <td class="px-3 py-3">${esc(aw.no_telepon || '-')}</td>
                    <td class="px-3 py-3">${koor ? esc(koor.latitude) : '-'}</td>
                    <td class="px-3 py-3">${koor ? esc(koor.longitude) : '-'}</td>
                    <td class="px-3 py-3">${esc(m?.keterangan || '-')}</td>
                </tr>`;
            }).join('');

            box.innerHTML = `
                <div class="flex flex-wrap items-center justify-between gap-3">
                    <div><h2 class="text-lg font-semibold text-gray-900">Data Almarhum</h2>
                        <p class="mt-1 text-sm text-gray-500">Daftar lengkap almarhum (${data.total} data).</p></div>
                    <div class="flex items-center gap-2 text-sm text-gray-500">
                        <span>Tampilkan</span>
                        <select id="dashPerPage" class="rounded-lg border border-gray-300 px-2 py-1">
                            <option value="10" ${dashAlm.perPage === 10 ? 'selected' : ''}>10</option>
                            <option value="20" ${dashAlm.perPage === 20 ? 'selected' : ''}>20</option>
                            <option value="50" ${dashAlm.perPage === 50 ? 'selected' : ''}>50</option>
                        </select>
                        <span>baris</span>
                    </div>
                </div>
                <div class="mt-4 flex flex-wrap items-center gap-2">
                    <input id="dashSearch" placeholder="Cari nama / NIK / no registrasi..." value="${esc(dashAlm.search)}"
                           class="w-full max-w-xs rounded-lg border border-gray-300 px-3 py-2 focus:border-sky-500 focus:outline-none">
                    <button id="dashSearchBtn" class="rounded-lg bg-gray-800 px-4 py-2 text-sm text-white">Cari</button>
                    <select id="dashSort" class="rounded-lg border border-gray-300 px-3 py-2 text-sm">
                        <option value="id" ${dashAlm.sortBy === 'id' ? 'selected' : ''}>Urutkan</option>
                        <option value="no_registrasi" ${dashAlm.sortBy === 'no_registrasi' ? 'selected' : ''}>No. Registrasi</option>
                        <option value="nama_lengkap" ${dashAlm.sortBy === 'nama_lengkap' ? 'selected' : ''}>Nama</option>
                        <option value="nik" ${dashAlm.sortBy === 'nik' ? 'selected' : ''}>NIK</option>
                        <option value="jenis_kelamin" ${dashAlm.sortBy === 'jenis_kelamin' ? 'selected' : ''}>Jenis Kelamin</option>
                        <option value="tanggal_lahir" ${dashAlm.sortBy === 'tanggal_lahir' ? 'selected' : ''}>Tgl Lahir</option>
                        <option value="tanggal_wafat" ${dashAlm.sortBy === 'tanggal_wafat' ? 'selected' : ''}>Tgl Wafat</option>
                        <option value="tanggal_dimakamkan" ${dashAlm.sortBy === 'tanggal_dimakamkan' ? 'selected' : ''}>Tgl Dimakamkan</option>
                    </select>
                    <button id="dashSortDir" class="rounded-lg border border-gray-300 px-3 py-2 text-sm" title="Arah urutan">${dashAlm.sortDir === 'asc' ? '↑ Naik' : '↓ Turun'}</button>
                </div>
                <div class="mt-2 overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200 text-xs">
                        <thead class="bg-gray-50 text-left text-[10px] uppercase text-gray-500">
                            <tr>
                                <th class="px-3 py-3">No.</th>
                                <th class="px-3 py-3">Nomor Registrasi</th>
                                <th class="px-3 py-3">Nomor Makam</th>
                                <th class="px-3 py-3">Nama Almarhum</th>
                                <th class="px-3 py-3">Binti</th>
                                <th class="px-3 py-3">NIK Almarhum</th>
                                <th class="px-3 py-3">Jenis Kelamin</th>
                                <th class="px-3 py-3">Nama Jalan</th>
                                <th class="px-3 py-3">Detail Jalan</th>
                                <th class="px-3 py-3">No. Rumah</th>
                                <th class="px-3 py-3">RT</th>
                                <th class="px-3 py-3">RW</th>
                                <th class="px-3 py-3">Provinsi</th>
                                <th class="px-3 py-3">Kota/Kabupaten</th>
                                <th class="px-3 py-3">Kecamatan</th>
                                <th class="px-3 py-3">Kelurahan</th>
                                <th class="px-3 py-3">Tgl Lahir</th>
                                <th class="px-3 py-3">Tgl Meninggal</th>
                                <th class="px-3 py-3">Tgl Dimakamkan</th>
                                <th class="px-3 py-3">Blok</th>
                                <th class="px-3 py-3">Nama Ahli Waris</th>
                                <th class="px-3 py-3">NIK Ahli Waris</th>
                                <th class="px-3 py-3">Jalan Ahli Waris</th>
                                <th class="px-3 py-3">Detail Jalan</th>
                                <th class="px-3 py-3">No. Rumah</th>
                                <th class="px-3 py-3">RT</th>
                                <th class="px-3 py-3">RW</th>
                                <th class="px-3 py-3">Provinsi</th>
                                <th class="px-3 py-3">Kota/Kabupaten</th>
                                <th class="px-3 py-3">Kecamatan</th>
                                <th class="px-3 py-3">Kelurahan</th>
                                <th class="px-3 py-3">Nomor Telepon</th>
                                <th class="px-3 py-3">Koordinat x</th>
                                <th class="px-3 py-3">Koordinat y</th>
                                <th class="px-3 py-3">Catatan Lokasi</th>
                            </tr>
                        </thead>
                        <tbody>
                            ${rows || '<tr><td colspan="35" class="px-4 py-6 text-center text-gray-400">Tidak ada data almarhum</td></tr>'}
                        </tbody>
                    </table>
                </div>
                <div class="mt-3 flex flex-wrap items-center justify-between gap-3 text-sm text-gray-500">
                    <span>${data.total} data &middot; halaman ${data.current_page}/${data.last_page}</span>
                    <div class="flex gap-2">
                        <button id="dashPrev" class="rounded-lg border border-gray-300 px-3 py-1 ${data.current_page <= 1 ? 'opacity-40' : ''}" ${data.current_page <= 1 ? 'disabled' : ''}>←</button>
                        <button id="dashNext" class="rounded-lg border border-gray-300 px-3 py-1 ${data.current_page >= data.last_page ? 'opacity-40' : ''}" ${data.current_page >= data.last_page ? 'disabled' : ''}>→</button>
                    </div>
                </div>`;

            box.querySelector('#dashPerPage').addEventListener('change', (e) => { dashAlm.perPage = Number(e.target.value); dashAlm.page = 1; renderDashAlmarhum(); });
            box.querySelector('#dashPrev').addEventListener('click', () => { if (dashAlm.page > 1) { dashAlm.page--; renderDashAlmarhum(); } });
            box.querySelector('#dashNext').addEventListener('click', () => { if (dashAlm.page < data.last_page) { dashAlm.page++; renderDashAlmarhum(); } });
            box.querySelector('#dashSearchBtn').addEventListener('click', () => { dashAlm.search = box.querySelector('#dashSearch').value.trim(); dashAlm.page = 1; renderDashAlmarhum(); });
            box.querySelector('#dashSearch').addEventListener('keydown', (e) => { if (e.key === 'Enter') { dashAlm.search = e.target.value.trim(); dashAlm.page = 1; renderDashAlmarhum(); } });
            box.querySelector('#dashSort').addEventListener('change', (e) => { dashAlm.sortBy = e.target.value; dashAlm.page = 1; renderDashAlmarhum(); });
            box.querySelector('#dashSortDir').addEventListener('click', () => { dashAlm.sortDir = dashAlm.sortDir === 'asc' ? 'desc' : 'asc'; dashAlm.page = 1; renderDashAlmarhum(); });
        }

        // ==================== ALMARHUM ====================
        async function renderAlmarhum(el) {
            let page = 1, perPage = 10, search = '', sortBy = 'nama_lengkap', sortDir = 'asc';
            el.innerHTML = '';

            async function load() {
                const qs = new URLSearchParams({ per_page: perPage, page });
                if (search) qs.set('q', search);
                qs.set('sort_by', sortBy);
                qs.set('sort_dir', sortDir);
                const data = await api('/almarhum?' + qs);

                const rows = (data.data || []).map((a, i) => `
                    <tr class="border-b border-gray-100 hover:bg-gray-50">
                        <td class="px-4 py-3 text-gray-400">${(data.current_page - 1) * perPage + i + 1}</td>
                        <td class="px-4 py-3">${esc(a.no_registrasi || '-')}</td>
                        <td class="px-4 py-3 font-medium whitespace-nowrap">${a.makam ? esc(a.makam.kode_makam) : '-'}</td>
                        <td class="px-4 py-3 font-medium">${esc(a.nama_lengkap)}</td>
                        <td class="px-4 py-3">${esc(a.bin_binti || '-')}</td>
                        <td class="px-4 py-3">${esc(a.nik || '-')}</td>
                        <td class="px-4 py-3">${esc(a.jenis_kelamin || '-')}</td>
                        <td class="px-4 py-3">${fmtDate(a.tanggal_lahir)}</td>
                        <td class="px-4 py-3">${fmtDate(a.tanggal_wafat)}</td>
                        <td class="px-4 py-3">${fmtDate(a.tanggal_dimakamkan)}</td>
                        <td class="px-4 py-3">${a.makam?.blok ? esc(a.makam.blok.nama_blok || a.makam.blok.kode_blok || '-') : '-'}</td>
                        <td class="px-4 py-3">${esc((a.ahli_waris || [])[0]?.nama_lengkap || '-')}</td>
                        <td class="px-4 py-3">${esc((a.ahli_waris || [])[0]?.no_telepon || '-')}</td>
                        <td class="px-4 py-3">${a.makam ? badge(a.makam.status) : '-'}</td>
                        <td class="px-4 py-3 text-right">
                            <button class="btn-view text-blue-600 hover:text-blue-800 mr-2" data-id="${a.id}">👁</button>
                            ${canEdit ? `<button class="btn-edit text-sky-600 hover:text-sky-800 mr-2" data-id="${a.id}">✏️</button>` : ''}
                            ${canDelete ? `<button class="btn-del text-red-600 hover:text-red-800" data-id="${a.id}">🗑</button>`
                                        : (isAdminTpu ? `<button class="btn-del-request text-sky-600 hover:text-sky-800" data-id="${a.id}" data-nama="${esc(a.nama_lengkap)}">🗑</button>` : '')}
                        </td>
                    </tr>`).join('');

                el.innerHTML = `
                    <div class="mb-6 flex flex-wrap items-center justify-between gap-4">
                        <h1 class="text-2xl font-bold text-gray-900">Data Almarhum</h1>
                        <div class="flex gap-2">
                            ${canImportExport ? `<button id="btnImportAlmarhum" class="rounded-lg bg-sky-600 px-4 py-2 font-semibold text-white hover:bg-sky-700">📥 Upload Excel</button>` : ''}
                            ${canCreate ? `<button id="btnAddAlmarhum" class="rounded-lg bg-sky-600 px-4 py-2 font-semibold text-white hover:bg-sky-700">+ Tambah Almarhum</button>` : ''}
                        </div>
                    </div>
                    <div class="mb-4 flex flex-wrap items-center gap-2">
                        <input id="searchAlmarhum" placeholder="Cari nama / NIK / no registrasi..." value="${esc(search)}"
                               class="w-full max-w-md rounded-lg border border-gray-300 px-3 py-2 focus:border-sky-500 focus:outline-none">
                        <button id="searchBtn" class="rounded-lg bg-gray-800 px-4 py-2 text-white">Cari</button>
                        <select id="sortAlmarhum" class="rounded-lg border border-gray-300 px-3 py-2 text-sm">
                            <option value="id" ${sortBy === 'id' ? 'selected' : ''}>Urutkan</option>
                            <option value="no_registrasi" ${sortBy === 'no_registrasi' ? 'selected' : ''}>No. Registrasi</option>
                            <option value="nama_lengkap" ${sortBy === 'nama_lengkap' ? 'selected' : ''}>Nama</option>
                            <option value="nik" ${sortBy === 'nik' ? 'selected' : ''}>NIK</option>
                            <option value="jenis_kelamin" ${sortBy === 'jenis_kelamin' ? 'selected' : ''}>Jenis Kelamin</option>
                            <option value="tanggal_lahir" ${sortBy === 'tanggal_lahir' ? 'selected' : ''}>Tgl Lahir</option>
                            <option value="tanggal_wafat" ${sortBy === 'tanggal_wafat' ? 'selected' : ''}>Tgl Wafat</option>
                            <option value="tanggal_dimakamkan" ${sortBy === 'tanggal_dimakamkan' ? 'selected' : ''}>Tgl Dimakamkan</option>
                        </select>
                        <button id="sortAlmarhumDir" class="rounded-lg border border-gray-300 px-3 py-2 text-sm" title="Arah urutan">${sortDir === 'asc' ? '↑ Naik' : '↓ Turun'}</button>
                    </div>
                    <div class="overflow-x-auto rounded-xl bg-white shadow-sm">
                        <table class="min-w-full divide-y divide-gray-200 text-sm">
                            <thead class="bg-gray-50 text-left text-xs uppercase text-gray-500">
                                <tr>
                                    <th class="px-4 py-3">No</th><th class="px-4 py-3">No. Registrasi</th><th class="px-4 py-3">Nomor Makam</th>
                                    <th class="px-4 py-3">Nama Almarhum</th><th class="px-4 py-3">Bin/Binti</th><th class="px-4 py-3">NIK</th>
                                    <th class="px-4 py-3">JK</th><th class="px-4 py-3">Tgl Lahir</th><th class="px-4 py-3">Tgl Meninggal</th><th class="px-4 py-3">Tgl Dimakamkan</th>
                                    <th class="px-4 py-3">Blok</th><th class="px-4 py-3">Ahli Waris</th><th class="px-4 py-3">No. Telepon</th>
                                    <th class="px-4 py-3">Status</th><th class="px-4 py-3 text-right">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>${rows || '<tr><td colspan="15" class="px-4 py-6 text-center text-gray-400">Tidak ada data</td></tr>'}</tbody>
                        </table>
                        <div class="flex flex-wrap items-center justify-between border-t border-gray-200 px-4 py-3 gap-3">
                            <div class="flex items-center gap-2 text-sm text-gray-500">
                                <span>Tampilkan</span>
                                <select id="perPageAlmarhum" class="rounded-lg border border-gray-300 px-2 py-1">
                                    <option value="10" ${perPage === 10 ? 'selected' : ''}>10</option>
                                    <option value="20" ${perPage === 20 ? 'selected' : ''}>20</option>
                                    <option value="50" ${perPage === 50 ? 'selected' : ''}>50</option>
                                </select>
                                <span>baris &middot; ${data.total} data (halaman ${data.current_page}/${data.last_page})</span>
                            </div>
                            <div class="flex gap-2">
                                <button class="page-prev rounded-lg border border-gray-300 px-3 py-1 ${data.current_page <= 1 ? 'opacity-40' : ''}" ${data.current_page <= 1 ? 'disabled' : ''}>←</button>
                                <button class="page-next rounded-lg border border-gray-300 px-3 py-1 ${data.current_page >= data.last_page ? 'opacity-40' : ''}" ${data.current_page >= data.last_page ? 'disabled' : ''}>→</button>
                            </div>
                        </div>
                    </div>`;

                // Bind events
                el.querySelector('#searchBtn').addEventListener('click', () => { search = el.querySelector('#searchAlmarhum').value.trim(); page = 1; load(); });
                el.querySelector('#searchAlmarhum').addEventListener('keydown', (e) => { if (e.key === 'Enter') { search = e.target.value.trim(); page = 1; load(); } });
                el.querySelector('#sortAlmarhum').addEventListener('change', (e) => { sortBy = e.target.value; page = 1; load(); });
                el.querySelector('#sortAlmarhumDir').addEventListener('click', () => { sortDir = sortDir === 'asc' ? 'desc' : 'asc'; page = 1; load(); });
                el.querySelector('#perPageAlmarhum').addEventListener('change', (e) => { perPage = Number(e.target.value); page = 1; load(); });
                el.querySelector('.page-prev').addEventListener('click', () => { if (page > 1) { page--; load(); } });
                el.querySelector('.page-next').addEventListener('click', () => { if (page < data.last_page) { page++; load(); } });

                el.querySelectorAll('.btn-view').forEach(b => b.addEventListener('click', () => viewAlmarhum(b.dataset.id)));
                if (canEdit) {
                    el.querySelectorAll('.btn-edit').forEach(b => b.addEventListener('click', () => editAlmarhum(b.dataset.id)));
                    document.getElementById('btnAddAlmarhum').addEventListener('click', () => addAlmarhum());
                }
                if (canDelete) {
                    el.querySelector('#btnAddAlmarhum').addEventListener('click', () => addAlmarhum());
                    el.querySelectorAll('.btn-del').forEach(b => b.addEventListener('click', () => delAlmarhum(b.dataset.id)));
                }
                if (isAdminTpu) {
                    el.querySelector('#btnAddAlmarhum').addEventListener('click', () => addAlmarhum());
                    el.querySelectorAll('.btn-del-request').forEach(b => b.addEventListener('click', () => requestDelete('almarhum', b.dataset.id, b.dataset.nama)));
                }
                if (canImportExport) {
                    el.querySelector('#btnImportAlmarhum')?.addEventListener('click', () => importAlmarhumExcel());
                }
            }
            load();
        }

        // ==================== IMPORT EXCEL (khusus AdminTPU) ====================
        async function importAlmarhumExcel() {
            modal(`
                <h2 class="mb-3 text-lg font-bold">Upload Data Almarhum (Excel)</h2>
                <p class="mb-4 text-sm text-gray-600">Format kolom harus mengikuti template kantor (kolom diawali <b>NO</b>, diakhiri <b>catatan lokasi makam</b>). Baris yang Nomor Registrasinya sudah ada akan <b>diperbarui</b>, sisanya <b>ditambahkan baru</b>. <a id="downloadTemplate" href="#" class="font-semibold text-sky-600 underline">Unduh template</a></p>
                <input id="importFile" type="file" accept=".xlsx,.xls,.csv"
                       class="w-full rounded-lg border border-gray-300 px-3 py-2">
                <div id="importMsg" class="hidden mt-4 rounded-lg bg-sky-50 px-4 py-3 text-sm text-sky-800 whitespace-pre-line"></div>
                <div id="importErr" class="hidden mt-4 rounded-lg bg-red-50 px-4 py-3 text-sm text-red-700 whitespace-pre-line"></div>
                <div class="mt-6 flex justify-end gap-2">
                    <button class="modal-close rounded-lg bg-gray-200 px-4 py-2">Batal</button>
                    <button id="doImport" class="rounded-lg bg-sky-600 px-4 py-2 font-semibold text-white hover:bg-sky-700">📥 Upload & Proses</button>
                </div>
            `);

            document.getElementById('downloadTemplate').addEventListener('click', async (e) => {
                e.preventDefault();
                try {
                    const res = await fetch('/api/almarhum/import/template', {
                        headers: { 'Authorization': 'Bearer ' + token, 'Accept': 'text/csv' },
                    });
                    if (!res.ok) throw new Error('Gagal mengunduh template');
                    const blob = await res.blob();
                    const url = URL.createObjectURL(blob);
                    const a = document.createElement('a');
                    a.href = url;
                    a.download = 'template_almarhum.csv';
                    document.body.appendChild(a);
                    a.click();
                    a.remove();
                    URL.revokeObjectURL(url);
                } catch (err) {
                    importErr.classList.remove('hidden');
                    importErr.textContent = err.message;
                }
            });

            const doImport = document.getElementById('doImport');
            const importMsg = document.getElementById('importMsg');
            const importErr = document.getElementById('importErr');

            doImport.addEventListener('click', async () => {
                const file = document.getElementById('importFile').files[0];
                if (!file) {
                    importErr.classList.remove('hidden');
                    importErr.textContent = 'Pilih file Excel/CSV terlebih dahulu.';
                    return;
                }

                importErr.classList.add('hidden');
                importMsg.classList.add('hidden');
                doImport.disabled = true;
                doImport.textContent = 'Memproses...';

                try {
                    const fd = new FormData();
                    fd.append('file', file);

                    const res = await fetch('/api/almarhum/import', {
                        method: 'POST',
                        headers: { 'Authorization': 'Bearer ' + token, 'Accept': 'application/json' },
                        body: fd,
                    });

                    const text = await res.text();
                    let data = {};
                    try { data = text ? JSON.parse(text) : {}; } catch (e) { data = { raw: text }; }

                    if (!res.ok) {
                        throw new Error(data.message || 'Upload gagal (HTTP ' + res.status + ')');
                    }

                    importMsg.classList.remove('hidden');
                    importMsg.textContent = '✅ ' + data.message + '\n\nData yang sudah memiliki Blok & Nomor Makam akan otomatis tampil di Peta (menu Peta / beranda). Jika bloknya belum ada, Super Admin / Admin UPTD bisa membuat area bloknya lewat menu Peta.';
                    toast('Import data almarhum selesai');

                    const r = data.result;
                    if (r && r.errors && r.errors.length) {
                        importErr.classList.remove('hidden');
                        importErr.textContent = 'Terdapat ' + r.errors.length + ' baris bermasalah:\n- ' + r.errors.slice(0, 12).join('\n- ') + (r.errors.length > 12 ? '\n... (sisa dilewati)' : '');
                    }

                    renderAlmarhum(document.getElementById('content'));
                } catch (e) {
                    importErr.classList.remove('hidden');
                    importErr.textContent = e.message;
                } finally {
                    doImport.disabled = false;
                    doImport.textContent = '📥 Upload & Proses';
                }
            });
        }

        async function viewAlmarhum(id) {
            const a = await api('/almarhum/' + id);
            modal(`
                <h2 class="mb-4 text-lg font-bold">Detail Almarhum</h2>
                <dl class="grid grid-cols-2 gap-3 text-sm">
                    <div><dt class="text-gray-500">Nama</dt><dd class="font-medium">${esc(a.nama_lengkap)}</dd></div>
                    <div><dt class="text-gray-500">Bin/Binti</dt><dd>${esc(a.bin_binti || '-')}</dd></div>
                    <div><dt class="text-gray-500">No. Registrasi</dt><dd>${esc(a.no_registrasi || '-')}</dd></div>
                    <div><dt class="text-gray-500">NIK</dt><dd>${esc(a.nik || '-')}</dd></div>
                    <div><dt class="text-gray-500">Jenis Kelamin</dt><dd>${esc(a.jenis_kelamin || '-')}</dd></div>
                    <div><dt class="text-gray-500">Agama</dt><dd>${esc(a.agama || '-')}</dd></div>
                    <div><dt class="text-gray-500">Lahir</dt><dd>${fmtDate(a.tanggal_lahir)}</dd></div>
                    <div><dt class="text-gray-500">Wafat</dt><dd>${fmtDate(a.tanggal_wafat)}</dd></div>
                    <div><dt class="text-gray-500">Dimakamkan</dt><dd>${fmtDate(a.tanggal_dimakamkan)}</dd></div>
                    <div><dt class="text-gray-500">Lokasi</dt><dd>${a.makam ? esc(a.makam.blok?.nama_blok + ' / ' + a.makam.kode_makam) : '-'}</dd></div>
                </dl>
                ${(a.ahli_waris || []).length ? `
                <div class="mt-4">
                    <h3 class="text-sm font-semibold text-gray-700">Ahli Waris</h3>
                    ${(a.ahli_waris || []).map(aw => `
                        <div class="mt-2 rounded-lg bg-gray-50 p-3 text-sm">
                            <p class="font-medium">${esc(aw.nama_lengkap)} <span class="text-gray-500">(${esc(aw.hubungan || '-')})</span></p>
                            <p class="mt-1 text-gray-600">NIK: ${esc(aw.nik || '-')} | Telp: ${esc(aw.no_telepon || '-')}</p>
                            <p class="text-gray-600">${esc(aw.alamat || aw.alamat_jalan || '-')}</p>
                        </div>`).join('')}
                </div>` : ''}
                <div class="mt-4"><dt class="text-gray-500 text-sm">Alamat</dt><dd class="text-sm">${esc(a.alamat || '-')}</dd></div>
                <div class="mt-6 flex justify-end"><button class="modal-close rounded-lg bg-gray-200 px-4 py-2">Tutup</button></div>
            `);
        }

        async function addAlmarhum() {
            // Ambil daftar makam kosong untuk pilihan
            const makamData = await api('/makam?status=kosong&per_page=100');
            const form = formAlmarhum(null, makamData.data || []);
            modal(`
                <h2 class="mb-4 text-lg font-bold">Tambah Almarhum</h2>
                ${form}
                <div id="formErr" class="hidden mt-3 rounded-lg bg-red-50 px-4 py-2 text-sm text-red-700"></div>
                <div class="mt-6 flex justify-end gap-2">
                    <button class="modal-close rounded-lg bg-gray-200 px-4 py-2">Batal</button>
                    <button id="saveAlmarhum" class="rounded-lg bg-sky-600 px-4 py-2 font-semibold text-white">Simpan</button>
                </div>`);
            document.getElementById('saveAlmarhum').addEventListener('click', () => submitAlmarhum(null));
        }

        async function editAlmarhum(id) {
            const [a, makamData] = await Promise.all([api('/almarhum/' + id), api('/makam?per_page=100')]);
            const form = formAlmarhum(a, makamData.data || []);
            modal(`
                <h2 class="mb-4 text-lg font-bold">Edit Almarhum</h2>
                ${form}
                <div id="formErr" class="hidden mt-3 rounded-lg bg-red-50 px-4 py-2 text-sm text-red-700"></div>
                <div class="mt-6 flex justify-end gap-2">
                    <button class="modal-close rounded-lg bg-gray-200 px-4 py-2">Batal</button>
                    <button id="saveAlmarhum" class="rounded-lg bg-sky-600 px-4 py-2 font-semibold text-white">Simpan</button>
                </div>`);
            document.getElementById('saveAlmarhum').addEventListener('click', () => submitAlmarhum(id));
        }

        function formAlmarhum(a, makams) {
            a = a || {};
            return `
                <div class="space-y-3">
                    <div><label class="text-sm text-gray-600">Nama Lengkap *</label>
                        <input id="f-nama" value="${esc(a.nama_lengkap || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    <div class="grid grid-cols-2 gap-3">
                        <div><label class="text-sm text-gray-600">Makam *</label>
                            <select id="f-makam" class="w-full rounded-lg border border-gray-300 px-3 py-2">
                                <option value="">Pilih makam</option>
                                ${makams.map(m => `<option value="${m.id}" ${String(a.makam?.id) === String(m.id) ? 'selected' : ''}>${esc(m.kode_makam)} (${esc(m.blok?.nama_blok || '')})</option>`).join('')}
                            </select></div>
                        <div><label class="text-sm text-gray-600">No. Registrasi</label>
                            <input id="f-noreg" value="${esc(a.no_registrasi || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    </div>
                    <div class="grid grid-cols-2 gap-3">
                        <div><label class="text-sm text-gray-600">NIK</label>
                            <input id="f-nik" value="${esc(a.nik || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                        <div><label class="text-sm text-gray-600">Bin/Binti</label>
                            <input id="f-bin" value="${esc(a.bin_binti || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    </div>
                    <div class="grid grid-cols-3 gap-3">
                        <div><label class="text-sm text-gray-600">Jenis Kelamin *</label>
                            <select id="f-jk" class="w-full rounded-lg border border-gray-300 px-3 py-2">
                                <option value="L" ${a.jenis_kelamin === 'L' ? 'selected' : ''}>Laki-laki</option>
                                <option value="P" ${a.jenis_kelamin === 'P' ? 'selected' : ''}>Perempuan</option>
                            </select></div>
                        <div><label class="text-sm text-gray-600">Agama</label>
                            <input id="f-agama" value="${esc(a.agama || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                        <div><label class="text-sm text-gray-600">Wafat *</label>
                            <input id="f-wafat" type="date" value="${esc(a.tanggal_wafat || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    </div>
                    <div class="grid grid-cols-2 gap-3">
                        <div><label class="text-sm text-gray-600">Lahir</label>
                            <input id="f-lahir" type="date" value="${esc(a.tanggal_lahir || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                        <div><label class="text-sm text-gray-600">Dimakamkan</label>
                            <input id="f-dimakamkan" type="date" value="${esc(a.tanggal_dimakamkan || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    </div>
                    <div><label class="text-sm text-gray-600">Alamat (Detail Jalan)</label>
                        <textarea id="f-alamat" class="w-full rounded-lg border border-gray-300 px-3 py-2">${esc(a.alamat || '')}</textarea></div>
                    <div class="grid grid-cols-2 gap-3">
                        <div><label class="text-sm text-gray-600">Nama Jalan</label>
                            <input id="f-jalan" value="${esc(a.alamat_jalan || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                        <div><label class="text-sm text-gray-600">No. Rumah</label>
                            <input id="f-norumah" value="${esc(a.no_rumah || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    </div>
                    <div class="grid grid-cols-2 gap-3">
                        <div><label class="text-sm text-gray-600">RT</label>
                            <input id="f-rt" value="${esc(a.rt || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                        <div><label class="text-sm text-gray-600">RW</label>
                            <input id="f-rw" value="${esc(a.rw || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    </div>
                    <div class="grid grid-cols-2 gap-3">
                        <div><label class="text-sm text-gray-600">Kelurahan</label>
                            <input id="f-kelurahan" value="${esc(a.kelurahan || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                        <div><label class="text-sm text-gray-600">Kecamatan</label>
                            <input id="f-kecamatan" value="${esc(a.kecamatan || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    </div>
                    <div class="grid grid-cols-2 gap-3">
                        <div><label class="text-sm text-gray-600">Kota/Kabupaten</label>
                            <input id="f-kota" value="${esc(a.kota_kabupaten || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                        <div><label class="text-sm text-gray-600">Provinsi</label>
                            <input id="f-provinsi" value="${esc(a.provinsi || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    </div>
                    ${canManageKoordinat ? `
                    <div class="mt-1 border-t border-gray-200 pt-3">
                        <p class="mb-2 text-sm font-semibold text-gray-700">Lokasi Makam (sesuai format kantor)</p>
                        <div class="grid grid-cols-2 gap-3">
                            <div><label class="text-sm text-gray-600">Koordinat X (latitude)</label>
                                <input id="f-lat" type="number" step="any" value="${esc(a.makam?.koordinat?.latitude ?? '')}" placeholder="-6.8988000" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                            <div><label class="text-sm text-gray-600">Koordinat Y (longitude)</label>
                                <input id="f-lng" type="number" step="any" value="${esc(a.makam?.koordinat?.longitude ?? '')}" placeholder="107.5925000" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                        </div>
                        <div class="mt-3"><label class="text-sm text-gray-600">Catatan Lokasi Makam</label>
                            <input id="f-catatan" value="${esc(a.makam?.keterangan ?? '')}" placeholder="mis. Blok A1 petak 001" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    </div>` : ''}
                </div>`;
        }

        async function submitAlmarhum(id) {
            const payload = {
                makam_id: document.getElementById('f-makam').value,
                nama_lengkap: document.getElementById('f-nama').value,
                nik: document.getElementById('f-nik').value,
                bin_binti: document.getElementById('f-bin').value,
                jenis_kelamin: document.getElementById('f-jk').value,
                agama: document.getElementById('f-agama').value,
                tanggal_wafat: document.getElementById('f-wafat').value,
                tanggal_lahir: document.getElementById('f-lahir').value || null,
                tanggal_dimakamkan: document.getElementById('f-dimakamkan').value || null,
                alamat: document.getElementById('f-alamat').value,
                alamat_jalan: document.getElementById('f-jalan').value || null,
                no_rumah: document.getElementById('f-norumah').value || null,
                rt: document.getElementById('f-rt').value || null,
                rw: document.getElementById('f-rw').value || null,
                kelurahan: document.getElementById('f-kelurahan').value || null,
                kecamatan: document.getElementById('f-kecamatan').value || null,
                kota_kabupaten: document.getElementById('f-kota').value || null,
                provinsi: document.getElementById('f-provinsi').value || null,
                no_registrasi: document.getElementById('f-noreg').value || null,
            };
            if (canManageKoordinat) {
                payload.latitude = document.getElementById('f-lat').value || null;
                payload.longitude = document.getElementById('f-lng').value || null;
                payload.catatan_makam = document.getElementById('f-catatan').value || null;
            }
            const err = document.getElementById('formErr');
            try {
                if (id) { await api('/almarhum/' + id, { method: 'PUT', body: JSON.stringify(payload) }); }
                else { await api('/almarhum', { method: 'POST', body: JSON.stringify(payload) }); }
                closeModal();
                toast(id ? 'Data almarhum berhasil diperbarui' : 'Data almarhum berhasil ditambahkan');
                render();
            } catch (e) {
                err.textContent = e.message;
                err.classList.remove('hidden');
            }
        }

        async function delAlmarhum(id) {
            const ok = await confirmDialog({
                title: 'Hapus Almarhum',
                message: 'Hapus data almarhum ini? Tindakan tidak dapat dibatalkan.',
                confirmLabel: 'Hapus',
            });
            if (!ok) return;
            try {
                await api('/almarhum/' + id, { method: 'DELETE' });
                toast('Data almarhum berhasil dihapus');
                render();
            } catch (e) { toast(e.message, 'error'); }
        }

        // ==================== MAKAM ====================
        async function renderMakam(el) {
            let page = 1, perPage = 10, statusFilter = '', search = '', sortBy = 'kode_makam', sortDir = 'asc';
            el.innerHTML = '';

            async function load() {
                const qs = new URLSearchParams({ per_page: perPage, page });
                if (statusFilter) qs.set('status', statusFilter);
                if (search) qs.set('q', search);
                qs.set('sort_by', sortBy);
                qs.set('sort_dir', sortDir);
                const data = await api('/makam?' + qs);

                const rows = (data.data || []).map(m => `
                    <tr class="border-b border-gray-100 hover:bg-gray-50">
                        <td class="px-4 py-3">${esc(m.kode_makam)}</td>
                        <td class="px-4 py-3">${esc(m.nomor_makam || '-')}</td>
                        <td class="px-4 py-3">${m.blok ? esc(m.blok.nama_blok) : '-'}</td>
                        <td class="px-4 py-3">${esc(m.status_petak || m.status || '-')}</td>
                        <td class="px-4 py-3">${badge(m.status)}</td>
                        <td class="px-4 py-3">${m.almarhum ? esc(m.almarhum.nama_lengkap) : '-'}</td>
                        <td class="px-4 py-3 text-right">
                            ${canEdit ? `<button class="btn-edit text-sky-600 hover:text-sky-800 mr-2" data-id="${m.id}">✏️</button>` : ''}
                            ${canDelete ? `<button class="btn-del text-red-600 hover:text-red-800" data-id="${m.id}">🗑</button>`
                                        : (isAdminTpu ? `<button class="btn-del-request text-sky-600 hover:text-sky-800" data-id="${m.id}" data-nama="${esc(m.kode_makam)}">🗑</button>` : '')}
                        </td>
                    </tr>`).join('');

                el.innerHTML = `
                    <div class="mb-6 flex flex-wrap items-center justify-between gap-4">
                        <h1 class="text-2xl font-bold text-gray-900">Data Makam</h1>
                        ${canCreate ? `<button id="btnAddMakam" class="rounded-lg bg-sky-600 px-4 py-2 font-semibold text-white hover:bg-sky-700">+ Tambah Makam</button>` : ''}
                    </div>
                    <div class="mb-4 flex flex-wrap items-center gap-2">
                        <select id="filterStatus" class="rounded-lg border border-gray-300 px-3 py-2">
                            <option value="">Semua Status</option>
                            <option value="terisi" ${statusFilter === 'terisi' ? 'selected' : ''}>Terisi</option>
                            <option value="kosong" ${statusFilter === 'kosong' ? 'selected' : ''}>Kosong</option>
                        </select>
                        <input id="searchMakam" placeholder="Cari kode / nomor / blok / almarhum..." value="${esc(search)}"
                               class="w-full max-w-xs rounded-lg border border-gray-300 px-3 py-2 focus:border-sky-500 focus:outline-none">
                        <button id="searchMakamBtn" class="rounded-lg bg-gray-800 px-4 py-2 text-sm text-white">Cari</button>
                        <select id="sortMakam" class="rounded-lg border border-gray-300 px-3 py-2 text-sm">
                            <option value="id" ${sortBy === 'id' ? 'selected' : ''}>Urutkan</option>
                            <option value="kode_makam" ${sortBy === 'kode_makam' ? 'selected' : ''}>Kode</option>
                            <option value="nomor_makam" ${sortBy === 'nomor_makam' ? 'selected' : ''}>Nomor</option>
                            <option value="status" ${sortBy === 'status' ? 'selected' : ''}>Status</option>
                        </select>
                        <button id="sortMakamDir" class="rounded-lg border border-gray-300 px-3 py-2 text-sm" title="Arah urutan">${sortDir === 'asc' ? '↑ Naik' : '↓ Turun'}</button>
                    </div>
                    <div class="overflow-x-auto rounded-xl bg-white shadow-sm">
                        <table class="min-w-full divide-y divide-gray-200 text-sm">
                            <thead class="bg-gray-50 text-left text-xs uppercase text-gray-500">
                                <tr>
                                    <th class="px-4 py-3">Kode</th><th class="px-4 py-3">Nomor</th><th class="px-4 py-3">Blok</th>
                                    <th class="px-4 py-3">Status Petak</th><th class="px-4 py-3">Status</th><th class="px-4 py-3">Almarhum</th>
                                    <th class="px-4 py-3 text-right">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>${rows || '<tr><td colspan="7" class="px-4 py-6 text-center text-gray-400">Tidak ada data</td></tr>'}</tbody>
                        </table>
                        <div class="flex flex-wrap items-center justify-between border-t border-gray-200 px-4 py-3 gap-3">
                            <div class="flex items-center gap-2 text-sm text-gray-500">
                                <span>Tampilkan</span>
                                <select id="perPageMakam" class="rounded-lg border border-gray-300 px-2 py-1">
                                    <option value="10" ${perPage === 10 ? 'selected' : ''}>10</option>
                                    <option value="20" ${perPage === 20 ? 'selected' : ''}>20</option>
                                    <option value="50" ${perPage === 50 ? 'selected' : ''}>50</option>
                                </select>
                                <span>baris &middot; ${data.total} data (halaman ${data.current_page}/${data.last_page})</span>
                            </div>
                            <div class="flex gap-2">
                                <button class="page-prev rounded-lg border border-gray-300 px-3 py-1 ${data.current_page <= 1 ? 'opacity-40' : ''}" ${data.current_page <= 1 ? 'disabled' : ''}>←</button>
                                <button class="page-next rounded-lg border border-gray-300 px-3 py-1 ${data.current_page >= data.last_page ? 'opacity-40' : ''}" ${data.current_page >= data.last_page ? 'disabled' : ''}>→</button>
                            </div>
                        </div>
                    </div>`;

                el.querySelector('#filterStatus').addEventListener('change', (e) => { statusFilter = e.target.value; page = 1; load(); });
                el.querySelector('#searchMakamBtn').addEventListener('click', () => { search = el.querySelector('#searchMakam').value.trim(); page = 1; load(); });
                el.querySelector('#searchMakam').addEventListener('keydown', (e) => { if (e.key === 'Enter') { search = e.target.value.trim(); page = 1; load(); } });
                el.querySelector('#sortMakam').addEventListener('change', (e) => { sortBy = e.target.value; page = 1; load(); });
                el.querySelector('#sortMakamDir').addEventListener('click', () => { sortDir = sortDir === 'asc' ? 'desc' : 'asc'; page = 1; load(); });
                el.querySelector('#perPageMakam').addEventListener('change', (e) => { perPage = Number(e.target.value); page = 1; load(); });
                el.querySelector('.page-prev').addEventListener('click', () => { if (page > 1) { page--; load(); } });
                el.querySelector('.page-next').addEventListener('click', () => { if (page < data.last_page) { page++; load(); } });

                if (canEdit) {
                    el.querySelector('#btnAddMakam').addEventListener('click', () => addMakam());
                    el.querySelectorAll('.btn-edit').forEach(b => b.addEventListener('click', () => editMakam(b.dataset.id)));
                }
                if (canDelete) {
                    el.querySelector('#btnAddMakam').addEventListener('click', () => addMakam());
                    el.querySelectorAll('.btn-del').forEach(b => b.addEventListener('click', () => delMakam(b.dataset.id)));
                }
                if (isAdminTpu) {
                    el.querySelector('#btnAddMakam').addEventListener('click', () => addMakam());
                    el.querySelectorAll('.btn-del-request').forEach(b => b.addEventListener('click', () => requestDelete('makam', b.dataset.id, b.dataset.nama)));
                }
            }
            load();
        }

        async function addMakam() {
            const blokData = await api('/blok?per_page=100');
            const form = formMakam(null, blokData.data || []);
            modal(`
                <h2 class="mb-4 text-lg font-bold">Tambah Makam</h2>
                ${form}
                <div id="formErr" class="hidden mt-3 rounded-lg bg-red-50 px-4 py-2 text-sm text-red-700"></div>
                <div class="mt-6 flex justify-end gap-2">
                    <button class="modal-close rounded-lg bg-gray-200 px-4 py-2">Batal</button>
                    <button id="saveMakam" class="rounded-lg bg-sky-600 px-4 py-2 font-semibold text-white">Simpan</button>
                </div>`);
            document.getElementById('saveMakam').addEventListener('click', () => submitMakam(null));
        }

        async function editMakam(id) {
            const [m, blokData] = await Promise.all([api('/makam/' + id), api('/blok?per_page=100')]);
            const form = formMakam(m, blokData.data || []);
            modal(`
                <h2 class="mb-4 text-lg font-bold">Edit Makam</h2>
                ${form}
                <div id="formErr" class="hidden mt-3 rounded-lg bg-red-50 px-4 py-2 text-sm text-red-700"></div>
                <div class="mt-6 flex justify-end gap-2">
                    <button class="modal-close rounded-lg bg-gray-200 px-4 py-2">Batal</button>
                    <button id="saveMakam" class="rounded-lg bg-sky-600 px-4 py-2 font-semibold text-white">Simpan</button>
                </div>`);
            document.getElementById('saveMakam').addEventListener('click', () => submitMakam(id));
        }

        function formMakam(m, bloks, isEdit) {
            m = m || {};
            return `
                <div class="space-y-3">
                    <div><label class="text-sm text-gray-600">Blok *</label>
                        <select id="f-blok" class="w-full rounded-lg border border-gray-300 px-3 py-2">
                            <option value="">Pilih blok</option>
                            ${bloks.map(b => `<option value="${b.id}" ${String(m.blok_id) === String(b.id) ? 'selected' : ''}>${esc(b.kode_blok)} - ${esc(b.nama_blok)}</option>`).join('')}
                        </select></div>
                    <div class="grid grid-cols-2 gap-3">
                        <div><label class="text-sm text-gray-600">Kode Makam *</label>
                            <input id="f-kode" value="${esc(m.kode_makam || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                        <div><label class="text-sm text-gray-600">Nomor Makam *</label>
                            <input id="f-nomor" value="${esc(m.nomor_makam || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    </div>
                    <div><label class="text-sm text-gray-600">Keterangan</label>
                        <textarea id="f-ket" class="w-full rounded-lg border border-gray-300 px-3 py-2">${esc(m.keterangan || '')}</textarea></div>
                </div>`;
        }

        async function submitMakam(id) {
            const payload = {
                blok_id: document.getElementById('f-blok').value,
                kode_makam: document.getElementById('f-kode').value,
                nomor_makam: document.getElementById('f-nomor').value,
                keterangan: document.getElementById('f-ket').value || null,
            };
            const err = document.getElementById('formErr');
            try {
                if (id) { await api('/makam/' + id, { method: 'PUT', body: JSON.stringify(payload) }); }
                else { await api('/makam', { method: 'POST', body: JSON.stringify(payload) }); }
                closeModal();
                toast(id ? 'Data makam berhasil diperbarui' : 'Data makam berhasil ditambahkan');
                render();
            } catch (e) { err.textContent = e.message; err.classList.remove('hidden'); }
        }

        async function delMakam(id) {
            const ok = await confirmDialog({
                title: 'Hapus Makam',
                message: 'Hapus makam ini? Tindakan tidak dapat dibatalkan.',
                confirmLabel: 'Hapus',
            });
            if (!ok) return;
            try {
                await api('/makam/' + id, { method: 'DELETE' });
                toast('Data makam berhasil dihapus');
                render();
            } catch (e) { toast(e.message, 'error'); }
        }

        // ==================== AHLI WARIS ====================
        async function renderAhliWaris(el) {
            let page = 1, perPage = 10, search = '', sortBy = 'nama_lengkap', sortDir = 'asc';
            el.innerHTML = '';

            async function load() {
                const qs = new URLSearchParams({ per_page: perPage, page });
                if (search) qs.set('q', search);
                qs.set('sort_by', sortBy);
                qs.set('sort_dir', sortDir);
                const data = await api('/ahli-waris?' + qs);
                const rows = (data.data || []).map(h => `
                    <tr class="border-b border-gray-100 hover:bg-gray-50">
                        <td class="px-4 py-3">${esc(h.nama_lengkap)}</td>
                        <td class="px-4 py-3">${esc(h.hubungan || '-')}</td>
                        <td class="px-4 py-3">${esc(h.no_telepon || '-')}</td>
                        <td class="px-4 py-3">${esc(h.alamat || '-')}</td>
                        <td class="px-4 py-3">${h.almarhum ? esc(h.almarhum.nama_lengkap) : '-'}</td>
                        <td class="px-4 py-3 text-right">
                            ${canEdit ? `<button class="btn-edit text-sky-600 hover:text-sky-800 mr-2" data-id="${h.id}">✏️</button>` : ''}
                            ${canDelete ? `<button class="btn-del text-red-600 hover:text-red-800" data-id="${h.id}">🗑</button>`
                                        : (isAdminTpu ? `<button class="btn-del-request text-sky-600 hover:text-sky-800" data-id="${h.id}" data-nama="${esc(h.nama_lengkap)}">🗑</button>` : '')}
                        </td>
                    </tr>`).join('');

                el.innerHTML = `
                    <div class="mb-6 flex flex-wrap items-center justify-between gap-4">
                        <div><h1 class="text-2xl font-bold text-gray-900">Data Ahli Waris</h1>
                            <p class="mt-1 text-sm text-gray-500">Daftar ahli waris dari almarhum yang terdaftar.</p></div>
                        ${canCreate ? `<button id="btnAddAhliWaris" class="rounded-lg bg-sky-600 px-4 py-2 font-semibold text-white hover:bg-sky-700">+ Tambah Ahli Waris</button>` : ''}
                    </div>
                    <div class="mb-4 flex flex-wrap items-center gap-2">
                        <input id="searchWarris" placeholder="Cari nama / NIK / hubungan / almarhum..." value="${esc(search)}"
                               class="w-full max-w-xs rounded-lg border border-gray-300 px-3 py-2 focus:border-sky-500 focus:outline-none">
                        <button id="searchWarrisBtn" class="rounded-lg bg-gray-800 px-4 py-2 text-sm text-white">Cari</button>
                        <select id="sortWarris" class="rounded-lg border border-gray-300 px-3 py-2 text-sm">
                            <option value="id" ${sortBy === 'id' ? 'selected' : ''}>Urutkan</option>
                            <option value="nama_lengkap" ${sortBy === 'nama_lengkap' ? 'selected' : ''}>Nama</option>
                            <option value="nik" ${sortBy === 'nik' ? 'selected' : ''}>NIK</option>
                            <option value="hubungan" ${sortBy === 'hubungan' ? 'selected' : ''}>Hubungan</option>
                            <option value="no_telepon" ${sortBy === 'no_telepon' ? 'selected' : ''}>No. Telepon</option>
                        </select>
                        <button id="sortWarrisDir" class="rounded-lg border border-gray-300 px-3 py-2 text-sm" title="Arah urutan">${sortDir === 'asc' ? '↑ Naik' : '↓ Turun'}</button>
                    </div>
                    <div class="overflow-x-auto rounded-xl bg-white shadow-sm">
                        <table class="min-w-full divide-y divide-gray-200 text-sm">
                            <thead class="bg-gray-50 text-left text-xs uppercase text-gray-500">
                                <tr>
                                    <th class="px-4 py-3">Nama</th><th class="px-4 py-3">Hubungan</th><th class="px-4 py-3">No. Telepon</th>
                                    <th class="px-4 py-3">Alamat</th><th class="px-4 py-3">Almarhum</th><th class="px-4 py-3 text-right">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>${rows || '<tr><td colspan="6" class="px-4 py-6 text-center text-gray-400">Tidak ada data</td></tr>'}</tbody>
                        </table>
                        <div class="flex flex-wrap items-center justify-between border-t border-gray-200 px-4 py-3 gap-3">
                            <div class="flex items-center gap-2 text-sm text-gray-500">
                                <span>Tampilkan</span>
                                <select id="perPageAhliWaris" class="rounded-lg border border-gray-300 px-2 py-1">
                                    <option value="10" ${perPage === 10 ? 'selected' : ''}>10</option>
                                    <option value="20" ${perPage === 20 ? 'selected' : ''}>20</option>
                                    <option value="50" ${perPage === 50 ? 'selected' : ''}>50</option>
                                </select>
                                <span>baris &middot; ${data.total} data (halaman ${data.current_page}/${data.last_page})</span>
                            </div>
                            <div class="flex gap-2">
                                <button class="page-prev rounded-lg border border-gray-300 px-3 py-1 ${data.current_page <= 1 ? 'opacity-40' : ''}" ${data.current_page <= 1 ? 'disabled' : ''}>←</button>
                                <button class="page-next rounded-lg border border-gray-300 px-3 py-1 ${data.current_page >= data.last_page ? 'opacity-40' : ''}" ${data.current_page >= data.last_page ? 'disabled' : ''}>→</button>
                            </div>
                        </div>
                    </div>`;

                el.querySelector('#perPageAhliWaris')?.addEventListener('change', (e) => { perPage = Number(e.target.value); page = 1; load(); });
                el.querySelector('#searchWarrisBtn')?.addEventListener('click', () => { search = el.querySelector('#searchWarris').value.trim(); page = 1; load(); });
                el.querySelector('#searchWarris')?.addEventListener('keydown', (e) => { if (e.key === 'Enter') { search = e.target.value.trim(); page = 1; load(); } });
                el.querySelector('#sortWarris')?.addEventListener('change', (e) => { sortBy = e.target.value; page = 1; load(); });
                el.querySelector('#sortWarrisDir')?.addEventListener('click', () => { sortDir = sortDir === 'asc' ? 'desc' : 'asc'; page = 1; load(); });
                el.querySelector('.page-prev')?.addEventListener('click', () => { if (page > 1) { page--; load(); } });
                el.querySelector('.page-next')?.addEventListener('click', () => { if (page < data.last_page) { page++; load(); } });

                if (canEdit) {
                    el.querySelector('#btnAddAhliWaris').addEventListener('click', () => addAhliWaris());
                    el.querySelectorAll('.btn-edit').forEach(b => b.addEventListener('click', () => editAhliWaris(b.dataset.id)));
                }
                if (canDelete) {
                    el.querySelector('#btnAddAhliWaris').addEventListener('click', () => addAhliWaris());
                    el.querySelectorAll('.btn-del').forEach(b => b.addEventListener('click', () => delAhliWaris(b.dataset.id)));
                }
                if (isAdminTpu) {
                    el.querySelector('#btnAddAhliWaris').addEventListener('click', () => addAhliWaris());
                    el.querySelectorAll('.btn-del-request').forEach(b => b.addEventListener('click', () => requestDelete('ahli-waris', b.dataset.id, b.dataset.nama)));
                }
            }
            load();
        }

        function formAhliWaris(h, almarhums) {
            h = h || {};
            return `
                <div class="space-y-3">
                    <div><label class="text-sm text-gray-600">Almarhum *</label>
                        <select id="w-almarhum" class="w-full rounded-lg border border-gray-300 px-3 py-2">
                            <option value="">Pilih almarhum</option>
                            ${almarhums.map(a => `<option value="${a.id}" ${String(h.almarhum_id) === String(a.id) ? 'selected' : ''}>${esc(a.nama_lengkap)}${a.no_registrasi ? ' (' + esc(a.no_registrasi) + ')' : ''}</option>`).join('')}
                        </select></div>
                    <div class="grid grid-cols-2 gap-3">
                        <div><label class="text-sm text-gray-600">Nama Lengkap *</label>
                            <input id="w-nama" value="${esc(h.nama_lengkap || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                        <div><label class="text-sm text-gray-600">Hubungan *</label>
                            <input id="w-hubungan" value="${esc(h.hubungan || '')}" placeholder="anak / istri / suami / dll" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    </div>
                    <div class="grid grid-cols-2 gap-3">
                        <div><label class="text-sm text-gray-600">NIK</label>
                            <input id="w-nik" value="${esc(h.nik || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                        <div><label class="text-sm text-gray-600">No. Telepon</label>
                            <input id="w-telepon" value="${esc(h.no_telepon || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    </div>
                    <div><label class="text-sm text-gray-600">Alamat (Detail Jalan)</label>
                        <textarea id="w-alamat" class="w-full rounded-lg border border-gray-300 px-3 py-2">${esc(h.alamat || '')}</textarea></div>
                    <div class="grid grid-cols-2 gap-3">
                        <div><label class="text-sm text-gray-600">Nama Jalan</label>
                            <input id="w-jalan" value="${esc(h.alamat_jalan || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                        <div><label class="text-sm text-gray-600">No. Rumah</label>
                            <input id="w-norumah" value="${esc(h.no_rumah || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    </div>
                    <div class="grid grid-cols-2 gap-3">
                        <div><label class="text-sm text-gray-600">RT</label>
                            <input id="w-rt" value="${esc(h.rt || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                        <div><label class="text-sm text-gray-600">RW</label>
                            <input id="w-rw" value="${esc(h.rw || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    </div>
                    <div class="grid grid-cols-2 gap-3">
                        <div><label class="text-sm text-gray-600">Kelurahan</label>
                            <input id="w-kelurahan" value="${esc(h.kelurahan || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                        <div><label class="text-sm text-gray-600">Kecamatan</label>
                            <input id="w-kecamatan" value="${esc(h.kecamatan || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    </div>
                    <div class="grid grid-cols-2 gap-3">
                        <div><label class="text-sm text-gray-600">Kota/Kabupaten</label>
                            <input id="w-kota" value="${esc(h.kota_kabupaten || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                        <div><label class="text-sm text-gray-600">Provinsi</label>
                            <input id="w-provinsi" value="${esc(h.provinsi || '')}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    </div>
                </div>`;
        }

        async function addAhliWaris() {
            const almarhumData = await api('/almarhum?per_page=100');
            const form = formAhliWaris(null, almarhumData.data || []);
            modal(`
                <h2 class="mb-4 text-lg font-bold">Tambah Ahli Waris</h2>
                ${form}
                <div id="formErr" class="hidden mt-3 rounded-lg bg-red-50 px-4 py-2 text-sm text-red-700"></div>
                <div class="mt-6 flex justify-end gap-2">
                    <button class="modal-close rounded-lg bg-gray-200 px-4 py-2">Batal</button>
                    <button id="saveAhliWaris" class="rounded-lg bg-sky-600 px-4 py-2 font-semibold text-white">Simpan</button>
                </div>`);
            document.getElementById('saveAhliWaris').addEventListener('click', () => submitAhliWaris(null));
        }

        async function editAhliWaris(id) {
            const [h, almarhumData] = await Promise.all([api('/ahli-waris/' + id), api('/almarhum?per_page=100')]);
            const form = formAhliWaris(h, almarhumData.data || []);
            modal(`
                <h2 class="mb-4 text-lg font-bold">Edit Ahli Waris</h2>
                ${form}
                <div id="formErr" class="hidden mt-3 rounded-lg bg-red-50 px-4 py-2 text-sm text-red-700"></div>
                <div class="mt-6 flex justify-end gap-2">
                    <button class="modal-close rounded-lg bg-gray-200 px-4 py-2">Batal</button>
                    <button id="saveAhliWaris" class="rounded-lg bg-sky-600 px-4 py-2 font-semibold text-white">Simpan</button>
                </div>`);
            document.getElementById('saveAhliWaris').addEventListener('click', () => submitAhliWaris(id));
        }

        async function submitAhliWaris(id) {
            const payload = {
                almarhum_id: document.getElementById('w-almarhum').value,
                nama_lengkap: document.getElementById('w-nama').value,
                hubungan: document.getElementById('w-hubungan').value,
                nik: document.getElementById('w-nik').value || null,
                no_telepon: document.getElementById('w-telepon').value || null,
                alamat: document.getElementById('w-alamat').value || null,
                alamat_jalan: document.getElementById('w-jalan').value || null,
                no_rumah: document.getElementById('w-norumah').value || null,
                rt: document.getElementById('w-rt').value || null,
                rw: document.getElementById('w-rw').value || null,
                kelurahan: document.getElementById('w-kelurahan').value || null,
                kecamatan: document.getElementById('w-kecamatan').value || null,
                kota_kabupaten: document.getElementById('w-kota').value || null,
                provinsi: document.getElementById('w-provinsi').value || null,
            };
            const err = document.getElementById('formErr');
            if (!payload.almarhum_id) { err.textContent = 'Pilih almarhum dulu'; err.classList.remove('hidden'); return; }
            try {
                if (id) { await api('/ahli-waris/' + id, { method: 'PUT', body: JSON.stringify(payload) }); }
                else { await api('/ahli-waris', { method: 'POST', body: JSON.stringify(payload) }); }
                closeModal();
                toast(id ? 'Data ahli waris berhasil diperbarui' : 'Data ahli waris berhasil ditambahkan');
                render();
            } catch (e) { err.textContent = e.message; err.classList.remove('hidden'); }
        }

        async function delAhliWaris(id) {
            const ok = await confirmDialog({
                title: 'Hapus Ahli Waris',
                message: 'Hapus data ahli waris ini? Tindakan tidak dapat dibatalkan.',
                confirmLabel: 'Hapus',
            });
            if (!ok) return;
            try {
                await api('/ahli-waris/' + id, { method: 'DELETE' });
                toast('Data ahli waris berhasil dihapus');
                render();
            } catch (e) { toast(e.message, 'error'); }
        }

        // ==================== MASTER (SuperAdmin) ====================
        async function renderMaster(el) {
            const [uptdData, tpuData, adminData] = await Promise.all([
                api('/uptd?per_page=100'),
                api('/tpu?per_page=100'),
                api('/admin-tpu?per_page=100'),
            ]);

            el.innerHTML = `
                <div class="mb-6"><h1 class="text-2xl font-bold text-gray-900">Data Master</h1>
                    <p class="mt-1 text-sm text-gray-500">Kelola UPTD, TPU, dan Admin TPU (khusus Super Admin).</p></div>

                <div class="grid gap-6 lg:grid-cols-3">
                    <!-- UPTD -->
                    <div class="rounded-xl bg-white p-5 shadow-sm">
                        <div class="mb-3 flex items-center justify-between">
                            <h2 class="text-lg font-semibold text-gray-900">UPTD</h2>
                            <button id="btnUptd" class="rounded-lg bg-sky-600 px-3 py-1 text-sm text-white">+</button>
                        </div>
                        <input data-list="#uptdList" placeholder="Cari UPTD..." class="master-filter mb-3 w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-sky-500 focus:outline-none">
                        <ul id="uptdList" class="space-y-2 text-sm">
                            ${(uptdData.data || []).map(u => `
                                <li data-text="${esc((u.nama_uptd || '').toLowerCase())}" class="flex items-center justify-between rounded-lg border border-gray-100 px-3 py-2">
                                    <div>
                                        <span>${esc(u.nama_uptd)}</span>
                                        <span class="ml-2 text-xs text-gray-400">${u.tpus_count ?? 0} TPU</span>
                                    </div>
                                    <div class="flex gap-1">
                                        <button class="edu text-blue-600 hover:text-blue-800" data-kind="uptd" data-id="${u.id}">✏️</button>
                                        <button class="edd text-red-600 hover:text-red-800" data-kind="uptd" data-id="${u.id}">🗑</button>
                                    </div>
                                </li>`).join('') || '<li class="text-gray-400">Kosong</li>'}
                        </ul>
                    </div>

                    <!-- TPU -->
                    <div class="rounded-xl bg-white p-5 shadow-sm">
                        <div class="mb-3 flex items-center justify-between">
                            <h2 class="text-lg font-semibold text-gray-900">TPU</h2>
                            <button id="btnTpu" class="rounded-lg bg-sky-600 px-3 py-1 text-sm text-white">+</button>
                        </div>
                        <input data-list="#tpuList" placeholder="Cari TPU..." class="master-filter mb-3 w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-sky-500 focus:outline-none">
                        <ul id="tpuList" class="space-y-2 text-sm">
                            ${(tpuData.data || []).map(t => `
                                <li data-text="${esc((t.nama_tpu || '').toLowerCase())}" class="flex items-center justify-between rounded-lg border border-gray-100 px-3 py-2">
                                    <div>
                                        <span>${esc(t.nama_tpu)}</span>
                                        <div class="mt-0.5">${badge(t.status)}</div>
                                    </div>
                                    <div class="flex gap-1">
                                        <button class="edu text-blue-600 hover:text-blue-800" data-kind="tpu" data-id="${t.id}">✏️</button>
                                        <button class="edd text-red-600 hover:text-red-800" data-kind="tpu" data-id="${t.id}">🗑</button>
                                    </div>
                                </li>`).join('') || '<li class="text-gray-400">Kosong</li>'}
                        </ul>
                    </div>

                    <!-- Admin TPU -->
                    <div class="rounded-xl bg-white p-5 shadow-sm">
                        <div class="mb-3 flex items-center justify-between">
                            <h2 class="text-lg font-semibold text-gray-900">Admin TPU</h2>
                            <button id="btnAdmin" class="rounded-lg bg-sky-600 px-3 py-1 text-sm text-white">+</button>
                        </div>
                        <input data-list="#adminList" placeholder="Cari nama Admin TPU..." class="master-filter mb-3 w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-sky-500 focus:outline-none">
                        <ul id="adminList" class="space-y-2 text-sm">
                            ${(adminData.data || []).map(a => `
                                <li data-text="${esc(((a.nama_lengkap || '') + ' ' + (a.tpu?.nama_tpu || '')).toLowerCase())}" class="flex items-center justify-between rounded-lg border border-gray-100 px-3 py-2">
                                    <div>
                                        <span>${esc(a.nama_lengkap)}</span>
                                        <div class="text-xs text-gray-400">${a.tpu ? esc(a.tpu.nama_tpu) : '-'}</div>
                                    </div>
                                    <div class="flex gap-1">
                                        <button class="edu text-blue-600 hover:text-blue-800" data-kind="admin" data-id="${a.id}">✏️</button>
                                        <button class="edd text-red-600 hover:text-red-800" data-kind="admin" data-id="${a.id}">🗑</button>
                                    </div>
                                </li>`).join('') || '<li class="text-gray-400">Kosong</li>'}
                        </ul>
                    </div>
                </div>`;

            el.querySelector('#btnUptd').addEventListener('click', () => masterForm('uptd', null, null));
            el.querySelector('#btnTpu').addEventListener('click', async () => {
                const uptds = (await api('/uptd?per_page=100')).data || [];
                masterForm('tpu', uptds, null);
            });
            el.querySelector('#btnAdmin').addEventListener('click', async () => {
                const tpus = (await api('/tpu?per_page=100')).data || [];
                masterForm('admin', tpus, null);
            });

            // Edit & delete
            el.querySelectorAll('.edu').forEach(b => b.addEventListener('click', () => masterEdit(b.dataset.kind, b.dataset.id)));
            el.querySelectorAll('.edd').forEach(b => b.addEventListener('click', () => masterDelete(b.dataset.kind, b.dataset.id)));

            // Pencarian cepat klien
            el.querySelectorAll('.master-filter').forEach(inp => {
                inp.addEventListener('input', () => {
                    const q = inp.value.trim().toLowerCase();
                    el.querySelectorAll(inp.dataset.list + ' li').forEach(li => {
                        li.style.display = (!q || li.dataset.text.includes(q)) ? '' : 'none';
                    });
                });
            });
        }

        async function masterEdit(kind, id) {
            if (kind === 'uptd') {
                const u = await api('/uptd/' + id);
                masterForm('uptd', null, u);
            } else if (kind === 'tpu') {
                const [t, uptds] = await Promise.all([api('/tpu/' + id), api('/uptd?per_page=100')]);
                masterForm('tpu', uptds.data || [], t);
            } else {
                const [a, tpus] = await Promise.all([api('/admin-tpu/' + id), api('/tpu?per_page=100')]);
                masterForm('admin', tpus.data || [], a);
            }
        }

        async function masterDelete(kind, id) {
            const label = { uptd: 'UPTD', tpu: 'TPU', admin: 'Admin TPU' }[kind];
            const ok = await confirmDialog({
                title: 'Hapus ' + label,
                message: 'Hapus ' + label + ' ini? Tindakan tidak dapat dibatalkan.',
                confirmLabel: 'Hapus',
            });
            if (!ok) return;
            const path = { uptd: '/uptd', tpu: '/tpu', admin: '/admin-tpu' }[kind];
            try {
                await api(path + '/' + id, { method: 'DELETE' });
                toast(label + ' berhasil dihapus');
                render();
            } catch (e) { toast(e.message, 'error'); }
        }

        function masterForm(type, opts, existing) {
            const isEdit = !!existing; // kalau ada data existing -> mode edit
            const ids = ['m1','m2','m3','m4','m5','m6','m7'];
            const val = (idx) => existing ? (existing[mapField(type, idx)] ?? '') : '';

            function mapField(t, idx) {
                if (t === 'uptd') return ['nama_uptd','nip','username','email','password','alamat','no_telepon'][Number(idx.slice(1))-1];
                if (t === 'tpu')  return ['nama_tpu','kode_tpu','uptd_id','alamat','kota','center_lat','center_lng','zoom_level'][Number(idx.slice(1))-1];
                return ['nama_lengkap','nip','tpu_id','username','email','password'][Number(idx.slice(1))-1];
            }

            let fields = '';
            if (type === 'uptd') {
                fields = `
                    <div><label class="text-sm text-gray-600">Nama UPTD *</label><input id="m1" value="${esc(val('m1'))}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    <div><label class="text-sm text-gray-600">NIP *</label><input id="m2" value="${esc(val('m2'))}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    <div><label class="text-sm text-gray-600">Username *</label><input id="m3" value="${esc(val('m3'))}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    <div><label class="text-sm text-gray-600">Email *</label><input id="m4" value="${esc(val('m4'))}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    <div><label class="text-sm text-gray-600">Password ${isEdit ? '(kosongkan jika tidak diubah)' : '*'}</label><input id="m5" type="password" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    <div><label class="text-sm text-gray-600">Alamat</label><input id="m6" value="${esc(val('m6'))}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    <div><label class="text-sm text-gray-600">No. Telepon</label><input id="m7" value="${esc(val('m7'))}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>`;
            } else if (type === 'tpu') {
                fields = `
                    <div><label class="text-sm text-gray-600">Nama TPU *</label><input id="m1" value="${esc(val('m1'))}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    <div><label class="text-sm text-gray-600">Kode TPU *</label><input id="m2" value="${esc(val('m2'))}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    <div><label class="text-sm text-gray-600">UPTD</label>
                        <select id="m3" class="w-full rounded-lg border border-gray-300 px-3 py-2">
                            <option value="">Tanpa UPTD</option>
                            ${(opts || []).map(u => `<option value="${u.id}" ${String(existing?.uptd_id) === String(u.id) ? 'selected' : ''}>${esc(u.nama_uptd)}</option>`).join('')}
                        </select></div>
                    <div><label class="text-sm text-gray-600">Alamat</label><input id="m4" value="${esc(val('m4'))}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    <div><label class="text-sm text-gray-600">Kota</label><input id="m5" value="${esc(val('m5'))}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    <div class="grid grid-cols-3 gap-3">
                        <div><label class="text-sm text-gray-600">Latitude</label><input id="m6" value="${esc(val('m6'))}" placeholder="-6.8988" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                        <div><label class="text-sm text-gray-600">Longitude</label><input id="m7" value="${esc(val('m7'))}" placeholder="107.5925" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                        <div><label class="text-sm text-gray-600">Zoom</label><input id="m8" value="${esc(val('m8') || 17)}" placeholder="17" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    </div>
                    <p class="text-xs text-gray-400">Titik tengah peta TPU ini (cari lewat Google Maps: klik kanan lokasi &rarr; salin koordinat).</p>`;
            } else { // admin
                fields = `
                    <div><label class="text-sm text-gray-600">Nama Lengkap *</label><input id="m1" value="${esc(val('m1'))}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    <div><label class="text-sm text-gray-600">NIP *</label><input id="m2" value="${esc(val('m2'))}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    <div><label class="text-sm text-gray-600">TPU *</label>
                        <select id="m3" class="w-full rounded-lg border border-gray-300 px-3 py-2">
                            <option value="">Pilih TPU</option>
                            ${(opts || []).map(t => `<option value="${t.id}" ${String(existing?.tpu_id) === String(t.id) ? 'selected' : ''}>${esc(t.nama_tpu)}</option>`).join('')}
                        </select></div>
                    <div><label class="text-sm text-gray-600">Username *</label><input id="m4" value="${esc(val('m4'))}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    <div><label class="text-sm text-gray-600">Email *</label><input id="m5" value="${esc(val('m5'))}" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>
                    <div><label class="text-sm text-gray-600">Password ${isEdit ? '(kosongkan jika tidak diubah)' : '*'}</label><input id="m6" type="password" class="w-full rounded-lg border border-gray-300 px-3 py-2"></div>`;
            }

            const action = isEdit ? 'Edit' : 'Tambah';
            const title = { uptd: action + ' UPTD', tpu: action + ' TPU', admin: action + ' Admin TPU' }[type];
            modal(`
                <h2 class="mb-4 text-lg font-bold">${title}</h2>
                <div class="space-y-3">${fields}</div>
                <div id="formErr" class="hidden mt-3 rounded-lg bg-red-50 px-4 py-2 text-sm text-red-700"></div>
                <div class="mt-6 flex justify-end gap-2">
                    <button class="modal-close rounded-lg bg-gray-200 px-4 py-2">Batal</button>
                    <button id="saveMaster" class="rounded-lg bg-sky-600 px-4 py-2 font-semibold text-white">Simpan</button>
                </div>`);

            document.getElementById('saveMaster').addEventListener('click', async () => {
                const v = idx => document.getElementById(idx).value;
                let payload = {};
                if (type === 'uptd') payload = { nama_uptd: v('m1'), nip: v('m2'), username: v('m3'), email: v('m4'), password: v('m5') || undefined, alamat: v('m6'), no_telepon: v('m7') };
                else if (type === 'tpu') payload = {
                    nama_tpu: v('m1'), kode_tpu: v('m2'), uptd_id: v('m3') || null, alamat: v('m4'), kota: v('m5'),
                    center_lat: v('m6') ? Number(v('m6')) : null,
                    center_lng: v('m7') ? Number(v('m7')) : null,
                    zoom_level: v('m8') ? Number(v('m8')) : 17,
                };
                else payload = { nama_lengkap: v('m1'), nip: v('m2'), tpu_id: v('m3'), username: v('m4'), email: v('m5'), password: v('m6') || undefined };

                const base = { uptd: '/uptd', tpu: '/tpu', admin: '/admin-tpu' }[type];
                const path = isEdit ? base + '/' + existing.id : base;
                const err = document.getElementById('formErr');
                try {
                    await api(path, { method: isEdit ? 'PUT' : 'POST', body: JSON.stringify(payload) });
                    closeModal();
                    toast(title + (isEdit ? ' berhasil diperbarui' : ' berhasil ditambahkan'));
                    render();
                } catch (e) { err.textContent = e.message; err.classList.remove('hidden'); }
            });

            // Hapus field password kosong pada edit agar tidak di-overwrite
        }

        // ==================== LOG AKTIVITAS ====================
        async function renderAktivitas(el) {
            let page = 1, actionFilter = '', search = '', sortBy = 'created_at', sortDir = 'desc';
            el.innerHTML = '';

            async function load() {
                const qs = new URLSearchParams({ per_page: 10, page });
                if (actionFilter) qs.set('action', actionFilter);
                if (search) qs.set('q', search);
                qs.set('sort_by', sortBy);
                qs.set('sort_dir', sortDir);
                const data = await api('/activity-logs?' + qs);

                const roleBadge = {
                    SuperAdmin: 'bg-sky-100 text-sky-700',
                    Uptd: 'bg-sky-100 text-sky-700',
                    AdminTpu: 'bg-amber-100 text-amber-700',
                };
                const rows = (data.data || []).map(l => `
                    <tr class="border-b border-gray-100 hover:bg-gray-50">
                        <td class="px-4 py-3">${fmtDateTime(l.created_at)}</td>
                        <td class="px-4 py-3">
                            <span class="inline-flex rounded-full px-2 py-0.5 text-xs font-medium ${roleBadge[l.user_type] || 'bg-gray-100 text-gray-600'}">${esc(l.user_type || '-')}</span>
                        </td>
                        <td class="px-4 py-3 font-medium">${esc(l.user_name || '-')}</td>
                        <td class="px-4 py-3">${esc(actLabel(l.action))}</td>
                        <td class="px-4 py-3">${esc(l.description || '-')}</td>
                    </tr>`).join('');

                el.innerHTML = `
                    <div class="mb-6">
                        <h1 class="text-2xl font-bold text-gray-900">Log Aktivitas</h1>
                        <p class="mt-1 text-sm text-gray-500">${isSuperAdmin ? 'Seluruh aktivitas admin di sistem (Super Admin, Admin UPTD, Admin TPU).' : 'Aktivitas Admin UPTD & Admin TPU di wilayah Anda.'}</p>
                    </div>
                    <div class="mb-4 flex flex-wrap items-center gap-2">
                        <select id="filterAction" class="rounded-lg border border-gray-300 px-3 py-2">
                            <option value="">Semua Aksi</option>
                            <option value="create" ${actionFilter === 'create' ? 'selected' : ''}>Tambah</option>
                            <option value="update" ${actionFilter === 'update' ? 'selected' : ''}>Ubah</option>
                            <option value="delete" ${actionFilter === 'delete' ? 'selected' : ''}>Hapus</option>
                            <option value="import" ${actionFilter === 'import' ? 'selected' : ''}>Import</option>
                            <option value="approve" ${actionFilter === 'approve' ? 'selected' : ''}>Approve</option>
                            <option value="reject" ${actionFilter === 'reject' ? 'selected' : ''}>Tolak</option>
                            <option value="login" ${actionFilter === 'login' ? 'selected' : ''}>Login</option>
                        </select>
                        <input id="searchAktivitas" placeholder="Cari nama / keterangan..." value="${esc(search)}"
                               class="w-full max-w-xs rounded-lg border border-gray-300 px-3 py-2 focus:border-sky-500 focus:outline-none">
                        <button id="searchAktivitasBtn" class="rounded-lg bg-gray-800 px-4 py-2 text-sm text-white">Cari</button>
                        <select id="sortAktivitas" class="rounded-lg border border-gray-300 px-3 py-2 text-sm">
                            <option value="created_at" ${sortBy === 'created_at' ? 'selected' : ''}>Waktu</option>
                            <option value="user_name" ${sortBy === 'user_name' ? 'selected' : ''}>Nama</option>
                            <option value="action" ${sortBy === 'action' ? 'selected' : ''}>Aksi</option>
                        </select>
                        <button id="sortAktivitasDir" class="rounded-lg border border-gray-300 px-3 py-2 text-sm" title="Arah urutan">${sortDir === 'asc' ? '↑ Naik' : '↓ Turun'}</button>
                    </div>
                    <div class="overflow-x-auto rounded-xl bg-white shadow-sm">
                        <table class="min-w-full divide-y divide-gray-200 text-sm">
                            <thead class="bg-gray-50 text-left text-xs uppercase text-gray-500">
                                <tr>
                                    <th class="px-4 py-3">Waktu</th><th class="px-4 py-3">Role</th><th class="px-4 py-3">Nama</th>
                                    <th class="px-4 py-3">Aksi</th><th class="px-4 py-3">Keterangan</th>
                                </tr>
                            </thead>
                            <tbody>${rows || '<tr><td colspan="5" class="px-4 py-6 text-center text-gray-400">Tidak ada aktivitas</td></tr>'}</tbody>
                        </table>
                        <div class="flex items-center justify-between border-t border-gray-200 px-4 py-3">
                            <span class="text-sm text-gray-500">Halaman ${data.current_page} dari ${data.last_page}</span>
                            <div class="flex gap-2">
                                <button class="page-prev rounded-lg border border-gray-300 px-3 py-1 ${data.current_page <= 1 ? 'opacity-40' : ''}" ${data.current_page <= 1 ? 'disabled' : ''}>←</button>
                                <button class="page-next rounded-lg border border-gray-300 px-3 py-1 ${data.current_page >= data.last_page ? 'opacity-40' : ''}" ${data.current_page >= data.last_page ? 'disabled' : ''}>→</button>
                            </div>
                        </div>
                    </div>`;

                el.querySelector('#filterAction')?.addEventListener('change', (e) => { actionFilter = e.target.value; page = 1; load(); });
                el.querySelector('#searchAktivitasBtn')?.addEventListener('click', () => { search = el.querySelector('#searchAktivitas').value.trim(); page = 1; load(); });
                el.querySelector('#searchAktivitas')?.addEventListener('keydown', (e) => { if (e.key === 'Enter') { search = e.target.value.trim(); page = 1; load(); } });
                el.querySelector('#sortAktivitas')?.addEventListener('change', (e) => { sortBy = e.target.value; page = 1; load(); });
                el.querySelector('#sortAktivitasDir')?.addEventListener('click', () => { sortDir = sortDir === 'asc' ? 'desc' : 'asc'; page = 1; load(); });
                el.querySelector('.page-prev')?.addEventListener('click', () => { if (page > 1) { page--; load(); } });
                el.querySelector('.page-next')?.addEventListener('click', () => { if (page < data.last_page) { page++; load(); } });
            }
            load();
        }

        // ==================== PERMINTAAN HAPUS ====================
        async function renderPermintaan(el) {
            let page = 1, statusFilter = '', search = '', sortBy = 'created_at', sortDir = 'desc';
            el.innerHTML = '';

            async function load() {
                const qs = new URLSearchParams({ per_page: 10, page });
                if (statusFilter) qs.set('status', statusFilter);
                if (search) qs.set('q', search);
                qs.set('sort_by', sortBy);
                qs.set('sort_dir', sortDir);
                const data = await api('/delete-request?' + qs);

                const rows = (data.data || []).map(r => {
                    const t = r.requestable || {};
                    const nama = t.nama_lengkap || t.kode_makam || t.kode_blok || t.nama_fasilitas || ('#' + r.requestable_id);
                    return `
                    <tr class="border-b border-gray-100 hover:bg-gray-50">
                        <td class="px-4 py-3">${esc(typeLabel(r.requestable_type))}</td>
                        <td class="px-4 py-3 font-medium">${esc(nama)}</td>
                        <td class="px-4 py-3">${esc(r.requested_by?.nama_lengkap || r.requested_by?.nama_uptd || r.requested_by?.username || '-')}</td>
                        <td class="px-4 py-3">${esc(r.reason || '-')}</td>
                        <td class="px-4 py-3">${badge(r.status)}</td>
                        <td class="px-4 py-3 text-right">
                            ${r.status === 'menunggu' ? `
                                <button class="btn-app text-sky-600 hover:text-sky-800 mr-2" data-id="${r.id}">✓ Setujui</button>
                                <button class="btn-rej text-red-600 hover:text-red-800" data-id="${r.id}">✕ Tolak</button>` : ''}
                        </td>
                    </tr>`;
                }).join('');

                el.innerHTML = `
                    <div class="mb-6">
                        <h1 class="text-2xl font-bold text-gray-900">Permintaan Hapus</h1>
                        <p class="mt-1 text-sm text-gray-500">Persetujuan penghapusan data yang diajukan ${isSuperAdmin ? 'Admin UPTD / ' : ''}Admin TPU.</p>
                    </div>
                    <div class="mb-4 flex flex-wrap items-center gap-2">
                        <select id="filterStatus" class="rounded-lg border border-gray-300 px-3 py-2">
                            <option value="">Semua Status</option>
                            <option value="menunggu" ${statusFilter === 'menunggu' ? 'selected' : ''}>Menunggu</option>
                            <option value="disetujui" ${statusFilter === 'disetujui' ? 'selected' : ''}>Disetujui</option>
                            <option value="ditolak" ${statusFilter === 'ditolak' ? 'selected' : ''}>Ditolak</option>
                        </select>
                        <input id="searchPermintaan" placeholder="Cari alasan / pengaju..." value="${esc(search)}"
                               class="w-full max-w-xs rounded-lg border border-gray-300 px-3 py-2 focus:border-sky-500 focus:outline-none">
                        <button id="searchPermintaanBtn" class="rounded-lg bg-gray-800 px-4 py-2 text-sm text-white">Cari</button>
                        <select id="sortPermintaan" class="rounded-lg border border-gray-300 px-3 py-2 text-sm">
                            <option value="created_at" ${sortBy === 'created_at' ? 'selected' : ''}>Waktu</option>
                            <option value="status" ${sortBy === 'status' ? 'selected' : ''}>Status</option>
                            <option value="reason" ${sortBy === 'reason' ? 'selected' : ''}>Alasan</option>
                        </select>
                        <button id="sortPermintaanDir" class="rounded-lg border border-gray-300 px-3 py-2 text-sm" title="Arah urutan">${sortDir === 'asc' ? '↑ Naik' : '↓ Turun'}</button>
                    </div>
                    <div class="overflow-x-auto rounded-xl bg-white shadow-sm">
                        <table class="min-w-full divide-y divide-gray-200 text-sm">
                            <thead class="bg-gray-50 text-left text-xs uppercase text-gray-500">
                                <tr>
                                    <th class="px-4 py-3">Tipe</th><th class="px-4 py-3">Data</th><th class="px-4 py-3">Diajukan oleh</th>
                                    <th class="px-4 py-3">Alasan</th><th class="px-4 py-3">Status</th><th class="px-4 py-3 text-right">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>${rows || '<tr><td colspan="6" class="px-4 py-6 text-center text-gray-400">Tidak ada permintaan</td></tr>'}</tbody>
                        </table>
                        <div class="flex items-center justify-between border-t border-gray-200 px-4 py-3">
                            <span class="text-sm text-gray-500">Halaman ${data.current_page} dari ${data.last_page}</span>
                            <div class="flex gap-2">
                                <button class="page-prev rounded-lg border border-gray-300 px-3 py-1 ${data.current_page <= 1 ? 'opacity-40' : ''}" ${data.current_page <= 1 ? 'disabled' : ''}>←</button>
                                <button class="page-next rounded-lg border border-gray-300 px-3 py-1 ${data.current_page >= data.last_page ? 'opacity-40' : ''}" ${data.current_page >= data.last_page ? 'disabled' : ''}>→</button>
                            </div>
                        </div>
                    </div>`;

                el.querySelector('#filterStatus')?.addEventListener('change', (e) => { statusFilter = e.target.value; page = 1; load(); });
                el.querySelector('#searchPermintaanBtn')?.addEventListener('click', () => { search = el.querySelector('#searchPermintaan').value.trim(); page = 1; load(); });
                el.querySelector('#searchPermintaan')?.addEventListener('keydown', (e) => { if (e.key === 'Enter') { search = e.target.value.trim(); page = 1; load(); } });
                el.querySelector('#sortPermintaan')?.addEventListener('change', (e) => { sortBy = e.target.value; page = 1; load(); });
                el.querySelector('#sortPermintaanDir')?.addEventListener('click', () => { sortDir = sortDir === 'asc' ? 'desc' : 'asc'; page = 1; load(); });
                el.querySelector('.page-prev')?.addEventListener('click', () => { if (page > 1) { page--; load(); } });
                el.querySelector('.page-next')?.addEventListener('click', () => { if (page < data.last_page) { page++; load(); } });
                el.querySelectorAll('.btn-app').forEach(b => b.addEventListener('click', () => reviewDelete(b.dataset.id, 'approve')));
                el.querySelectorAll('.btn-rej').forEach(b => b.addEventListener('click', () => reviewDelete(b.dataset.id, 'reject')));
            }
            load();
        }

        // ---------- Almarhum: AdminTPU minta hapus ----------
        function requestDelete(type, id, nama) {
            modal(`
                <h2 class="mb-4 text-lg font-bold">Permintaan Hapus</h2>
                <p class="text-sm text-gray-600">Anda mengajukan penghapusan data <b>${esc(nama)}</b>. Permintaan ini harus disetujui atasan (Admin UPTD / Super Admin) sebelum data benar-benar dihapus.</p>
                <div class="mt-3">
                    <label class="text-sm text-gray-600">Alasan *</label>
                    <textarea id="reqReason" class="w-full rounded-lg border border-gray-300 px-3 py-2" rows="3"></textarea>
                </div>
                <div id="formErr" class="hidden mt-3 rounded-lg bg-red-50 px-4 py-2 text-sm text-red-700"></div>
                <div class="mt-6 flex justify-end gap-2">
                    <button class="modal-close rounded-lg bg-gray-200 px-4 py-2">Batal</button>
                    <button id="sendReq" class="rounded-lg bg-sky-600 px-4 py-2 font-semibold text-white hover:bg-sky-700">Kirim Permintaan</button>
                </div>`);
            document.getElementById('sendReq').addEventListener('click', async () => {
                const reason = document.getElementById('reqReason').value.trim();
                const err = document.getElementById('formErr');
                if (!reason) { err.textContent = 'Alasan wajib diisi'; err.classList.remove('hidden'); return; }
                try {
                    const res = await api('/delete-request', {
                        method: 'POST',
                        body: JSON.stringify({ type, id: Number(id), reason })
                    });
                    closeModal();
                    toast(res.message || 'Permintaan hapus dikirim untuk disetujui');
                    render();
                } catch (e) { err.textContent = e.message; err.classList.remove('hidden'); }
            });
        }

        async function reviewDelete(id, action) {
            let note = '';
            if (action === 'reject') {
                note = await promptDialog({
                    title: 'Tolak Permintaan',
                    label: 'Catatan penolakan:',
                    placeholder: 'Alasan menolak permintaan ini...',
                });
                if (note === null) return;
            }
            try {
                await api('/delete-request/' + id + '/' + action, {
                    method: 'POST',
                    body: JSON.stringify({ note: action === 'reject' ? note : '' })
                });
                toast(action === 'approve' ? 'Permintaan disetujui, data dihapus' : 'Permintaan ditolak');
                render();
            } catch (e) { toast(e.message, 'error'); }
        }

        // ---------- Helper kecil ----------
        function fmtDateTime(d) {
            if (!d) return '-';
            const date = new Date(d);
            if (isNaN(date)) return '-';
            return date.toLocaleString('id-ID', { day: 'numeric', month: 'short', year: 'numeric', hour: '2-digit', minute: '2-digit' });
        }
        function actLabel(a) {
            return { create: 'Tambah', update: 'Ubah', delete: 'Hapus', import: 'Import', approve: 'Approve', reject: 'Tolak', login: 'Login' }[a] || a;
        }
        function typeLabel(t) {
            const short = (t || '').split('\\').pop();
            return { Almarhum: 'Almarhum', Makam: 'Makam', Blok: 'Blok', Fasilitas: 'Fasilitas', AhliWaris: 'Ahli Waris' }[short] || short || '-';
        }

        // ==================== MODAL ====================
        function modal(inner) {
            const overlay = document.createElement('div');
            overlay.className = 'fixed inset-0 z-50 flex items-center justify-center p-4';
            overlay.innerHTML = `
                <div class="absolute inset-0 bg-black/50" data-close></div>
                <div class="relative z-10 w-full max-w-lg max-h-[90vh] overflow-y-auto rounded-2xl bg-white p-6 shadow-xl">
                    ${inner}
                </div>`;
            overlay.querySelectorAll('[data-close], .modal-close').forEach(b => b.addEventListener('click', () => overlay.remove()));
            document.body.appendChild(overlay);
            return overlay;
        }

        // ---------- Popup dialog seragam (pengganti confirm/alert/prompt) ----------
        function confirmDialog(opts) {
            opts = opts || {};
            const title = opts.title || 'Konfirmasi';
            const message = opts.message || 'Yakin melanjutkan?';
            const confirmLabel = opts.confirmLabel || 'Hapus';
            const cancelLabel = opts.cancelLabel || 'Batal';
            const danger = opts.danger !== false;
            return new Promise((resolve) => {
                const overlay = modal(`
                    <div>
                        <div class="mb-3 flex h-12 w-12 items-center justify-center rounded-full ${danger ? 'bg-red-100' : 'bg-sky-100'} text-2xl">${danger ? '🗑️' : 'ℹ️'}</div>
                        <h2 class="mb-2 text-lg font-bold text-gray-900">${esc(title)}</h2>
                        <p class="whitespace-pre-line text-sm text-gray-600">${esc(message)}</p>
                        <div class="mt-6 flex justify-end gap-2">
                            <button id="dlgCancel" class="rounded-lg bg-gray-200 px-4 py-2 font-medium text-gray-700">${esc(cancelLabel)}</button>
                            <button id="dlgOk" class="rounded-lg px-4 py-2 font-semibold text-white ${danger ? 'bg-red-600 hover:bg-red-700' : 'bg-sky-600 hover:bg-sky-700'}">${esc(confirmLabel)}</button>
                        </div>
                    </div>`);
                document.getElementById('dlgCancel').addEventListener('click', () => { overlay.remove(); resolve(false); });
                document.getElementById('dlgOk').addEventListener('click', () => { overlay.remove(); resolve(true); });
                overlay.querySelectorAll('[data-close]').forEach(b => b.addEventListener('click', () => resolve(false)));
            });
        }

        function alertDialog(opts) {
            opts = opts || {};
            const title = opts.title || 'Perhatian';
            const message = opts.message || '';
            const type = opts.type || 'warning';
            const icons = { warning: '⚠️', error: '⛔', success: '✅', info: 'ℹ️' };
            return new Promise((resolve) => {
                const overlay = modal(`
                    <div class="text-center">
                        <div class="mx-auto mb-3 flex h-14 w-14 items-center justify-center rounded-full bg-amber-100 text-2xl">${icons[type] || icons.warning}</div>
                        <h2 class="mb-2 text-lg font-bold text-gray-900">${esc(title)}</h2>
                        <p class="whitespace-pre-line text-sm text-gray-600">${esc(message)}</p>
                        <div class="mt-6 flex justify-center">
                            <button class="modal-close rounded-lg ${type === 'error' ? 'bg-red-600' : 'bg-sky-600'} px-6 py-2 font-semibold text-white">OK</button>
                        </div>
                    </div>`);
                overlay.querySelector('.modal-close').addEventListener('click', () => resolve());
                overlay.querySelectorAll('[data-close]').forEach(b => b.addEventListener('click', () => resolve()));
            });
        }

        function promptDialog(opts) {
            opts = opts || {};
            const title = opts.title || 'Input';
            const label = opts.label || '';
            const placeholder = opts.placeholder || '';
            const value = opts.value || '';
            return new Promise((resolve) => {
                const overlay = modal(`
                    <div>
                        <h2 class="mb-3 text-lg font-bold text-gray-900">${esc(title)}</h2>
                        ${label ? `<p class="mb-2 text-sm text-gray-600">${esc(label)}</p>` : ''}
                        <textarea id="promptVal" rows="3" placeholder="${esc(placeholder)}" class="w-full rounded-lg border border-gray-300 px-3 py-2 focus:border-sky-500 focus:outline-none">${esc(value)}</textarea>
                        <div class="mt-6 flex justify-end gap-2">
                            <button id="prmCancel" class="modal-close rounded-lg bg-gray-200 px-4 py-2 font-medium text-gray-700">Batal</button>
                            <button id="prmOk" class="rounded-lg bg-sky-600 px-4 py-2 font-semibold text-white">OK</button>
                        </div>
                    </div>`);
                document.getElementById('prmCancel').addEventListener('click', () => resolve(null));
                document.getElementById('prmOk').addEventListener('click', () => { overlay.remove(); resolve(document.getElementById('promptVal').value); });
                overlay.querySelectorAll('[data-close]').forEach(b => b.addEventListener('click', () => resolve(null)));
            });
        }

        function closeModal() {
            document.querySelectorAll('.fixed.inset-0.z-50').forEach(m => m.remove());
        }

        // ==================== INIT ====================
        showPendingToast();
        renderLayout();
        render();
    })();
</script>
@endsection
