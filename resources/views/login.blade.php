@extends('layouts.public')

@section('title', 'Login')

@section('content')
<div class="flex min-h-screen items-center justify-center bg-gradient-to-br from-sky-900 via-sky-700 to-sky-500 px-4">
    <div class="w-full max-w-md">
        <div class="text-center mb-8">
            <!-- Gradasi biru -->
            <div class="mx-auto mb-3 flex h-14 w-14 overflow-hidden rounded-full shadow-lg">
                <span class="flex-1 bg-sky-400"></span>
                <span class="flex-1 bg-sky-500"></span>
                <span class="flex-1 bg-sky-700"></span>
            </div>
            <h1 class="text-2xl font-bold text-white">SIPEMAKAMAN</h1>
            <p class="text-sky-200">Silakan masuk ke sistem</p>
        </div>

        <div class="rounded-2xl bg-white p-8 shadow-xl">
            <!-- Login via NIP: role dideteksi otomatis dari tabel -->
            <p class="mb-4 rounded-lg bg-sky-50 px-3 py-2 text-xs text-sky-700">
                Login memakai <b>NIP</b> yang diberikan pusat. Sistem otomatis mengenali jabatan Anda.
            </p>

            <form id="loginForm" class="space-y-4">
                <div>
                    <label for="nip" class="mb-1 block text-sm font-medium text-gray-700">NIP</label>
                    <input type="text" id="nip" name="nip" required autocomplete="off"
                        class="w-full rounded-lg border border-gray-300 px-3 py-2 focus:border-sky-500 focus:outline-none focus:ring-1 focus:ring-sky-500">
                </div>
                <div>
                    <label for="password" class="mb-1 block text-sm font-medium text-gray-700">Password</label>
                    <input type="password" id="password" name="password" required autocomplete="current-password"
                        class="w-full rounded-lg border border-gray-300 px-3 py-2 focus:border-sky-500 focus:outline-none focus:ring-1 focus:ring-sky-500">
                </div>

                <button type="submit"
                    class="w-full rounded-lg bg-sky-600 px-4 py-2.5 font-semibold text-white hover:bg-sky-700 focus:outline-none focus:ring-2 focus:ring-sky-500 focus:ring-offset-2">
                    Masuk
                </button>
            </form>

            <div id="loginError" class="mt-4 hidden rounded-lg bg-red-50 px-4 py-3 text-sm text-red-700"></div>

            <div class="mt-6 border-t border-gray-200 pt-4 text-center">
                <p class="text-sm text-gray-500">
                    Pemohon? <a href="/" class="font-semibold text-sky-600 hover:text-sky-800">Lihat beranda & peta</a>
                </p>
            </div>
        </div>
        <p class="mt-8 text-center text-sm text-sky-200">© {{ date('Y') }} SIPEMAKAMAN — UPTD I Kota Bandung</p>
    </div>
</div>

<div id="toastContainer" class="fixed bottom-4 right-4 z-[100] flex flex-col items-end gap-2"></div>

<style>
    .toast-item {
        opacity: 0;
        transform: translateY(10px);
        transition: opacity .25s ease, transform .25s ease;
        color: #fff;
        box-shadow: 0 4px 14px rgba(0,0,0,.15);
    }
    .toast-item.show { opacity: 1; transform: translateY(0); }
</style>

<script>
    function toast(msg, type) {
        const colors = { success: 'bg-sky-600', error: 'bg-red-600', warning: 'bg-amber-500' };
        const el = document.createElement('div');
        el.className = 'toast-item rounded-lg px-4 py-3 text-sm font-medium ' + (colors[type] || colors.success);
        el.textContent = msg;
        document.getElementById('toastContainer').appendChild(el);
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

    const errorBox = document.getElementById('loginError');
    showPendingToast();

    document.getElementById('loginForm').addEventListener('submit', async (e) => {
        e.preventDefault();
        errorBox.classList.add('hidden');

        const nip = document.getElementById('nip').value.trim();
        const password = document.getElementById('password').value;

        try {
            const res = await fetch('/api/login', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' },
                body: JSON.stringify({ nip, password }),
            });

            const data = await res.json();

            if (!res.ok) {
                errorBox.textContent = data.message || 'Login gagal';
                errorBox.classList.remove('hidden');
                return;
            }

            localStorage.setItem('sipem_token', data.token);
            localStorage.setItem('sipem_role', data.role || data.tipe_akun);
            localStorage.setItem('sipem_user', JSON.stringify(data.user));
            sessionStorage.setItem('sipem_toast', JSON.stringify({ type: 'success', msg: 'Login berhasil sebagai ' + (data.role === 'SuperAdmin' ? 'Super Admin' : data.role === 'Uptd' ? 'Admin UPTD' : 'Admin TPU') }));
            window.location.href = '/app';
        } catch (err) {
            errorBox.textContent = 'Terjadi kesalahan jaringan';
            errorBox.classList.remove('hidden');
        }
    });
</script>
@endsection