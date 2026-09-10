<?php

namespace App\Http\Controllers;

use App\Models\AdminTpu;
use App\Models\Almarhum;
use App\Models\Makam;
use App\Models\Uptd;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    /**
     * GET /api/dashboard?per_page=&page=&tpu_id=(khusus SuperAdmin)
     *
     * Mengembalikan ringkasan angka + tabel data almarhum (siap dipakai untuk
     * tabel di halaman dashboard), otomatis dibatasi sesuai cakupan role yang login.
     */
    public function index(Request $request)
    {
        $user = $request->user();

        $ringkasan = [
            'total_almarhum' => $this->scopeAlmarhum($user, $request)->count(),
            'total_ahli_waris' => $this->scopeAhliWaris($user, $request)->count(),
            'total_makam' => $this->scopeMakam($user, $request)->count(),
            'makam_terisi' => (clone $this->scopeMakam($user, $request))->where('status', 'terisi')->count(),
            'makam_kosong' => (clone $this->scopeMakam($user, $request))->where('status', 'kosong')->count(),
        ];

        $tabel = $this->scopeAlmarhum($user, $request)
            ->with(['makam.blok.tpu', 'ahliWaris'])
            ->latest('id')
            ->paginate($request->integer('per_page', 10));

        return response()->json([
            'ringkasan' => $ringkasan,
            'data_almarhum' => $tabel,
        ]);
    }

    private function scopeAlmarhum($user, Request $request)
    {
        $query = Almarhum::query();

        if ($user instanceof AdminTpu) {
            $query->whereHas('makam.blok', fn ($q) => $q->where('tpu_id', $user->tpu_id));
        } elseif ($request->filled('tpu_id')) {
            $query->whereHas('makam.blok', fn ($q) => $q->where('tpu_id', $request->tpu_id));
        }
        // SuperAdmin & AdminUptd (semua akun): seluruh data tanpa filter wilayah.

        return $query;
    }

    private function scopeAhliWaris($user, Request $request)
    {
        $query = \App\Models\AhliWaris::query();

        if ($user instanceof AdminTpu) {
            $query->whereHas('almarhum.makam.blok', fn ($q) => $q->where('tpu_id', $user->tpu_id));
        } elseif ($request->filled('tpu_id')) {
            $query->whereHas('almarhum.makam.blok', fn ($q) => $q->where('tpu_id', $request->tpu_id));
        }
        // SuperAdmin & AdminUptd (semua akun): seluruh data tanpa filter wilayah.

        return $query;
    }

    private function scopeMakam($user, Request $request)
    {
        $query = Makam::query();

        if ($user instanceof AdminTpu) {
            $query->whereHas('blok', fn ($q) => $q->where('tpu_id', $user->tpu_id));
        } elseif ($request->filled('tpu_id')) {
            $query->whereHas('blok', fn ($q) => $q->where('tpu_id', $request->tpu_id));
        }
        // SuperAdmin & AdminUptd (semua akun): seluruh data tanpa filter wilayah.

        return $query;
    }
}
