<?php

use App\Http\Controllers\Auth\AdminTpuAuthController;
use App\Http\Controllers\Auth\NipAuthController;
use App\Http\Controllers\Auth\PemohonAuthController;
use App\Http\Controllers\Auth\SuperAdminAuthController;
use App\Http\Controllers\Auth\UptdAuthController;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TpuController;
use App\Http\Controllers\UptdController;


use App\Http\Controllers\BlokController;
use App\Http\Controllers\FasilitasController;
use App\Http\Controllers\MakamController;
use App\Http\Controllers\PetaDataController;

use App\Http\Controllers\AdminTpuManagementController;
use App\Http\Controllers\AhliWarisController;
use App\Http\Controllers\AlmarhumController;
use App\Http\Controllers\PengajuanController;
use App\Http\Controllers\LaporanController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\AlmarhumImportController;
use App\Http\Controllers\DeleteRequestController;
use App\Http\Controllers\ActivityLogController;


/*
|--------------------------------------------------------------------------
| AUTH ROUTES (Fase 4)
|--------------------------------------------------------------------------
*/

// --- Super Admin ---
Route::post('/super-admin/login', [SuperAdminAuthController::class, 'login']);

// --- Login terpadu via NIP (SuperAdmin / AdminUPTD / AdminTPU) ---
Route::post('/login', [NipAuthController::class, 'login']);

// --- UPTD ---
Route::post('/uptd/login', [UptdAuthController::class, 'login']);

// --- Admin TPU ---
Route::post('/admin-tpu/login', [AdminTpuAuthController::class, 'login']);

// --- Pemohon (masyarakat umum, bisa daftar sendiri) ---
Route::post('/pemohon/register', [PemohonAuthController::class, 'register']);
Route::post('/pemohon/login', [PemohonAuthController::class, 'login']);

// --- Logout (berlaku untuk role manapun yang sedang login) ---
Route::middleware('auth:sanctum')->post('/logout', function (Request $request) {
    $request->user()->currentAccessToken()->delete();

    return response()->json(['message' => 'Logout berhasil']);
});

// --- Tes: cek siapa yang sedang login (berguna untuk debugging token) ---
Route::middleware('auth:sanctum')->get('/me', function (Request $request) {
    return response()->json([
        'tipe_akun' => class_basename($request->user()),
        'data' => $request->user(),
    ]);
});


/*
|--------------------------------------------------------------------------
| Route-route modul lain (Blok, Makam, Almarhum, dst) akan kita
| tambahkan satu per satu di Fase 5.
|--------------------------------------------------------------------------
*/
// ---- UPTD: hanya Super Admin yang boleh kelola ----
Route::middleware(['auth:sanctum', 'user_type:SuperAdmin'])->group(function () {
    Route::get('/uptd', [UptdController::class, 'index']);
    Route::post('/uptd', [UptdController::class, 'store']);
    Route::get('/uptd/{uptd}', [UptdController::class, 'show']);
    Route::put('/uptd/{uptd}', [UptdController::class, 'update']);
    Route::delete('/uptd/{uptd}', [UptdController::class, 'destroy']);
});

// ---- TPU: create/update/delete hanya Super Admin ----
Route::middleware(['auth:sanctum', 'user_type:SuperAdmin'])->group(function () {
    Route::post('/tpu', [TpuController::class, 'store']);
    Route::put('/tpu/{tpu}', [TpuController::class, 'update']);
    Route::delete('/tpu/{tpu}', [TpuController::class, 'destroy']);
});

// ---- TPU: daftar TPU PUBLIK (diperlukan pemilih TPU di peta pemohon) ----
// (Super Admin lihat semua, UPTD lihat cakupannya, AdminTpu lihat TPU-nya,
//  Pemohon tanpa login pakai daftar ini untuk memilih TPU tujuan pemakaman)
Route::get('/tpu', [TpuController::class, 'index']);

// ---- TPU: detail hanya untuk role yang sudah login ----
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/tpu/{tpu}', [TpuController::class, 'show']);
});


/*
|--------------------------------------------------------------------------
| ROUTES FASE 7 — tambahkan blok ini ke routes/api.php Anda,
| DI BAWAH baris-baris routes dari Fase 5.
|--------------------------------------------------------------------------
*/
// ---- Tulis Blok/Makam/Fasilitas ----
// Create: AdminTpu (TPU-nya), Uptd (wilayah-nya), SuperAdmin
Route::middleware(['auth:sanctum', 'user_type:AdminTpu,SuperAdmin,Uptd'])->group(function () {
    Route::post('/blok', [BlokController::class, 'store']);
    Route::post('/makam', [MakamController::class, 'store']);
    Route::post('/fasilitas', [FasilitasController::class, 'store']);
});

// Update/Delete: TANPA AdminTpu (AdminTPU tidak boleh edit, hapus via permintaan)
Route::middleware(['auth:sanctum', 'user_type:SuperAdmin,Uptd'])->group(function () {
    Route::put('/blok/{blok}', [BlokController::class, 'update']);
    Route::delete('/blok/{blok}', [BlokController::class, 'destroy']);
    Route::put('/makam/{makam}', [MakamController::class, 'update']);
    Route::delete('/makam/{makam}', [MakamController::class, 'destroy']);
    Route::put('/fasilitas/{fasilitas}', [FasilitasController::class, 'update']);
    Route::delete('/fasilitas/{fasilitas}', [FasilitasController::class, 'destroy']);
});

// ---- Baca: semua role yang sudah login (difilter otomatis di controller) ----
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/blok', [BlokController::class, 'index']);
    Route::get('/blok/{blok}', [BlokController::class, 'show']);

    Route::get('/makam', [MakamController::class, 'index']);
    Route::get('/makam/{makam}', [MakamController::class, 'show']);

    Route::get('/fasilitas', [FasilitasController::class, 'index']);
    Route::get('/fasilitas/{fasilitas}', [FasilitasController::class, 'show']);
});

// ---- Endpoint peta gabungan: PUBLIK (tanpa login), karena peta TPU
//      biasanya info publik yang dibutuhkan masyarakat mencari makam keluarga ----
Route::get('/tpu/{tpu}/peta-data', [PetaDataController::class, 'show']);



/*
|--------------------------------------------------------------------------
| ROUTES FASE 8 — tambahkan blok ini ke routes/api.php Anda,
| DI BAWAH baris-baris routes dari Fase 7.
|--------------------------------------------------------------------------
*/
// ---- Admin TPU (akun login): KHUSUS Super Admin, semua aksi ----
// (berisi kredensial login Admin TPU, jadi index/show pun tidak dibuka untuk role lain)
Route::middleware(['auth:sanctum', 'user_type:SuperAdmin'])->group(function () {
    Route::get('/admin-tpu', [AdminTpuManagementController::class, 'index']);
    Route::post('/admin-tpu', [AdminTpuManagementController::class, 'store']);
    Route::get('/admin-tpu/{adminTpu}', [AdminTpuManagementController::class, 'show']);
    Route::put('/admin-tpu/{adminTpu}', [AdminTpuManagementController::class, 'update']);
    Route::delete('/admin-tpu/{adminTpu}', [AdminTpuManagementController::class, 'destroy']);
});

// ---- Almarhum & Ahli Waris: Create (AdminTpu/Uptd/SuperAdmin) ----
Route::middleware(['auth:sanctum', 'user_type:AdminTpu,Uptd,SuperAdmin'])->group(function () {
    Route::post('/almarhum', [AlmarhumController::class, 'store']);
    Route::post('/ahli-waris', [AhliWarisController::class, 'store']);
});

// ---- Almarhum & Ahli Waris: Update/Delete TANPA AdminTpu ----
Route::middleware(['auth:sanctum', 'user_type:Uptd,SuperAdmin'])->group(function () {
    Route::put('/almarhum/{almarhum}', [AlmarhumController::class, 'update']);
    Route::delete('/almarhum/{almarhum}', [AlmarhumController::class, 'destroy']);
    Route::put('/ahli-waris/{ahliWaris}', [AhliWarisController::class, 'update']);
    Route::delete('/ahli-waris/{ahliWaris}', [AhliWarisController::class, 'destroy']);
});

// ---- Import almarhum via file Excel: Super Admin & Admin UPTD ----
Route::middleware(['auth:sanctum', 'user_type:Uptd,SuperAdmin'])->group(function () {
    Route::get('/almarhum/import/template', [AlmarhumImportController::class, 'template']);
    Route::post('/almarhum/import', [AlmarhumImportController::class, 'store']);
});

// ---- Almarhum & Ahli Waris — baca: semua role yang sudah login (difilter di controller) ----
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/almarhum', [AlmarhumController::class, 'index']);
    Route::get('/almarhum/{almarhum}', [AlmarhumController::class, 'show']);

    Route::get('/ahli-waris', [AhliWarisController::class, 'index']);
    Route::get('/ahli-waris/{ahliWaris}', [AhliWarisController::class, 'show']);
});


/*
|--------------------------------------------------------------------------
| ROUTES FASE 9 — tambahkan blok ini ke routes/api.php Anda,
| DI BAWAH baris-baris routes dari Fase 8.
|--------------------------------------------------------------------------
*/

// ---- Ajukan pemakaman: hanya Pemohon ----
Route::middleware(['auth:sanctum', 'user_type:Pemohon'])->group(function () {
    Route::post('/pengajuan', [PengajuanController::class, 'store']);
});

// ---- Verifikasi: hanya Admin TPU (TPU miliknya) atau Super Admin ----
Route::middleware(['auth:sanctum', 'user_type:AdminTpu,SuperAdmin'])->group(function () {
    Route::post('/pengajuan/{pengajuan}/verifikasi', [PengajuanController::class, 'verifikasi']);
});

// ---- Baca: semua role, otomatis difilter di controller sesuai siapa yang login ----
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/pengajuan', [PengajuanController::class, 'index']);
    Route::get('/pengajuan/{pengajuan}', [PengajuanController::class, 'show']);
});



/*
|--------------------------------------------------------------------------
| ROUTES FASE 10 — tambahkan blok ini ke routes/api.php Anda,
| DI BAWAH baris-baris routes dari Fase 9.
|--------------------------------------------------------------------------
*/
// ---- Laporan: UPTD (cakupannya) atau SuperAdmin ----
Route::middleware(['auth:sanctum', 'user_type:Uptd,SuperAdmin'])->group(function () {
    Route::get('/laporan', [LaporanController::class, 'rekapitulasi']);
    Route::get('/laporan/export', [LaporanController::class, 'export']);
});



/*
|--------------------------------------------------------------------------
| ROUTES FASE 11 — tambahkan blok ini ke routes/api.php Anda,
| DI BAWAH baris-baris routes dari Fase 10.
|--------------------------------------------------------------------------
*/
// ---- Profil: berlaku untuk role manapun yang sedang login ----
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/profil', [ProfileController::class, 'show']);
    Route::put('/profil', [ProfileController::class, 'update']);
});


// ---- Koordinat Makam (ubah titik di peta): SuperAdmin & AdminUptd, TANPA AdminTpu ----
Route::middleware(['auth:sanctum', 'user_type:SuperAdmin,Uptd'])->group(function () {
    Route::put('/makam/{makam}/koordinat', [PetaDataController::class, 'updateKoordinat']);
});

/*
|--------------------------------------------------------------------------
| ROUTES PERMINTAAN HAPUS (delete-request) & LOG AKTIVITAS
|--------------------------------------------------------------------------
*/
// Kirim permintaan hapus: hanya AdminTPU
Route::middleware(['auth:sanctum', 'user_type:AdminTpu'])->group(function () {
    Route::post('/delete-request', [DeleteRequestController::class, 'store']);
});

// Lihat & proses permintaan hapus: SuperAdmin & AdminUptd
Route::middleware(['auth:sanctum', 'user_type:SuperAdmin,Uptd'])->group(function () {
    Route::get('/delete-request', [DeleteRequestController::class, 'index']);
    Route::post('/delete-request/{deleteRequest}/approve', [DeleteRequestController::class, 'approve']);
    Route::post('/delete-request/{deleteRequest}/reject', [DeleteRequestController::class, 'reject']);
});

// Log aktivitas: SuperAdmin (semua) & AdminUptd (wilayah-nya)
Route::middleware(['auth:sanctum', 'user_type:SuperAdmin,Uptd'])->group(function () {
    Route::get('/activity-logs', [ActivityLogController::class, 'index']);
});

/*
|--------------------------------------------------------------------------
| ROUTES FASE 14 — tambahkan blok ini ke routes/api.php Anda,
| DI BAWAH baris-baris routes dari Fase 11.
|--------------------------------------------------------------------------
*/

// ---- Dashboard: SuperAdmin, UPTD, AdminTPU (bukan Pemohon) ----
Route::middleware(['auth:sanctum', 'user_type:SuperAdmin,Uptd,AdminTpu'])->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index']);
});
