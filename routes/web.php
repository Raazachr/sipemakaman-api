<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PageController;

/*
|--------------------------------------------------------------------------
| FRONTEND (Halaman Web)
|--------------------------------------------------------------------------
| Backend utama adalah API. Halaman-halaman ini hanyalah UI cadangan yang
| mengonsumsi API via JavaScript (token disimpan di localStorage).
*/

// Beranda publik (untuk Pemohon / masyarakat, tanpa login)
Route::get('/', [PageController::class, 'home']);

// Halaman login (3 role: SuperAdmin, AdminUPTD, AdminTPU)
Route::get('/login', [PageController::class, 'login'])->name('login');

// Aplikasi admin (SPA-lite) — halaman dimuat sekali, konten dirender JS
Route::get('/app', [PageController::class, 'app'])->name('app');

// Tampilan peta stand-alone
Route::get('/peta', [PageController::class, 'peta']);
