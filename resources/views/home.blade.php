@extends('layouts.public')

@section('title', 'Beranda')

@section('content')
<!-- Navbar -->
<header class="bg-sky-700 text-white border-b-2 border-sky-800">
    <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div class="flex h-16 items-center justify-between">
            <div class="flex items-center gap-2">
                <span class="text-2xl">🏛️</span>
                <span class="text-xl font-bold">SIPEMAKAMAN</span>
            </div>
            <nav class="flex items-center gap-4">
                <a href="#tentang" class="hover:text-sky-200">Tentang</a>
                <a href="#tpu" class="hover:text-sky-200">TPU</a>
            </nav>
        </div>
    </div>
</header>

<main>
    <!-- Hero -->
    <section class="bg-sky-700 text-white">
        <div class="mx-auto max-w-7xl px-4 py-16 sm:px-6 lg:px-8">
            <div class="max-w-2xl">
                <h1 class="text-4xl font-bold tracking-tight sm:text-5xl">
                    Sistem Informasi Pemetaan & Data Pemakaman Umum
                </h1>
                <p class="mt-4 text-lg text-sky-100">
                    Cari lokasi makam keluarga Anda dengan mudah melalui peta digital
                    TPU di Kota Bandung. Data lengkap almarhum, blok, dan fasilitas
                    tersaji di satu tempat.
                </p>
                <div class="mt-8 flex flex-wrap gap-4">
                    <a href="/peta"
                       class="rounded-lg bg-white px-6 py-3 font-semibold text-sky-700 shadow hover:bg-sky-50">
                        Buka Peta TPU →
                    </a>
                    <a href="#tpu"
                       class="rounded-lg border border-sky-300 px-6 py-3 font-semibold text-sky-100 hover:bg-sky-600">
                        Daftar TPU
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Tentang -->
    <section id="tentang" class="py-16">
        <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
            <h2 class="text-2xl font-bold text-gray-900">Apa yang bisa Anda lakukan?</h2>
            <div class="mt-8 grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
                <div class="rounded-xl border border-gray-200 bg-white p-6 shadow-sm">
                    <div class="text-3xl">🗺️</div>
                    <h3 class="mt-4 text-lg font-semibold">Cari lokasi makam</h3>
                    <p class="mt-2 text-sm text-gray-600">Jelajahi peta TPU untuk menemukan petak makam & blok sesuai nama almarhum.</p>
                </div>
                <div class="rounded-xl border border-gray-200 bg-white p-6 shadow-sm">
                    <div class="text-3xl">📋</div>
                    <h3 class="mt-4 text-lg font-semibold">Data almarhum</h3>
                    <p class="mt-2 text-sm text-gray-600">Lihat informasi kapan dimakamkan, nomor registrasi, blok dan petak.</p>
                </div>
                <div class="rounded-xl border border-gray-200 bg-white p-6 shadow-sm">
                    <div class="text-3xl">🏛️</div>
                    <h3 class="mt-4 text-lg font-semibold">Fasilitas TPU</h3>
                    <p class="mt-2 text-sm text-gray-600">Temukan mushola, kantor, dan fasilitas lain di sekitar TPU.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Daftar TPU -->
    <section id="tpu" class="bg-white py-16">
        <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
            <h2 class="text-2xl font-bold text-gray-900">Daftar TPU Aktif</h2>
            <div class="mt-8 grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
                @forelse ($tpus ?? [] as $tpu)
                    <div class="rounded-xl border border-gray-200 bg-white p-6 shadow-sm">
                        <div class="flex items-center justify-between">
                            <h3 class="text-lg font-semibold text-gray-900">{{ $tpu->nama_tpu }}</h3>
                            <span class="inline-flex items-center rounded-full bg-sky-100 px-3 py-1 text-xs font-medium text-sky-700">Aktif</span>
                        </div>
                        <p class="mt-2 text-sm text-gray-600">{{ $tpu->alamat ?: 'Alamat tidak tersedia' }}<br>{{ $tpu->kota }}</p>
                        <a href="/peta" class="mt-4 inline-flex items-center text-sm font-semibold text-sky-700 hover:text-sky-900">
                            Lihat di peta →
                        </a>
                    </div>
                @empty
                    <p class="text-gray-500">Belum ada TPU aktif.</p>
                @endforelse
            </div>
        </div>
    </section>
</main>

<footer class="border-t border-gray-200 bg-white">
    <div class="mx-auto max-w-7xl px-4 py-8 text-center text-sm text-gray-500">
        © {{ date('Y') }} SIPEMAKAMAN — UPTD I Kota Bandung
    </div>
</footer>
@endsection
