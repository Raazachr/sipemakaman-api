<?php

namespace App\Http\Controllers;

use App\Models\AdminTpu;
use App\Models\Almarhum;
use App\Models\Makam;
use App\Models\MakamKapasitas;
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

        $scopeMakam = $this->scopeMakam($user, $request);
        $scopeAlmarhum = $this->scopeAlmarhum($user, $request);

        // Jumlah almarhum per petak makam (dipakai untuk status tumpang tindih).
        $jumlahAlmarhumPerMakam = (clone $scopeAlmarhum)
            ->whereNotNull('makam_id')
            ->select('makam_id')
            ->selectRaw('COUNT(*) as jml')
            ->groupBy('makam_id');

        // Tumpang tindih: satu petak makam dipakai lebih dari 1 almarhum.
        $makamTumpangTindih = (clone $scopeMakam)
            ->whereIn('id', (clone $jumlahAlmarhumPerMakam)->havingRaw('COUNT(*) > 1')->select('makam_id'))
            ->count();

        // Tunggal: satu petak makam dipakai tepat 1 almarhum.
        $makamTunggal = (clone $scopeMakam)
            ->whereIn('id', (clone $jumlahAlmarhumPerMakam)->havingRaw('COUNT(*) = 1')->select('makam_id'))
            ->count();

        $ringkasan = [
            'total_almarhum' => (clone $scopeAlmarhum)->count(),
            'total_ahli_waris' => $this->scopeAhliWaris($user, $request)->count(),
            'total_makam' => (clone $scopeMakam)->count(),
            'makam_terisi' => (clone $scopeMakam)->where('status', 'terisi')->count(),
            'makam_kosong' => (clone $scopeMakam)->where('status', 'kosong')->count(),
            'makam_tumpang_tindih' => $makamTumpangTindih,
            'makam_tunggal' => $makamTunggal,
            'kapasitas_makam' => $this->scopeKapasitasMakam($user, $request)->sum('jumlah'),
        ];

        $tabel = (clone $scopeAlmarhum)
            ->with(['makam.blok.tpu', 'ahliWaris'])
            ->addSelect([
                'jml_almarhum_per_makam' => AlmarhumController::subqueryJmlAlmarhumPerMakam(),
            ])
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
            // Sama seperti AlmarhumController@index: AdminTpu melihat makam di
            // TPU-nya PLUS almarhum yang belum ditempatkan, supaya tidak ada
            // yang tersembunyi dari tabel dashboard.
            $query->where(function ($q) use ($user) {
                $q->whereHas('makam.blok', fn ($b) => $b->where('tpu_id', $user->tpu_id))
                    ->orWhereNull('makam_id');
            });
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

    /**
     * Kapasitas makam per TPU. AdminTpu hanya melihat kapasitas TPU-nya,
     * SuperAdmin & Uptd melihat seluruh TPU. Kalau tabelnya kosong, 0.
     */
    private function scopeKapasitasMakam($user, Request $request)
    {
        $query = MakamKapasitas::query();

        if ($user instanceof AdminTpu) {
            $query->where('tpu_id', $user->tpu_id);
        } elseif ($request->filled('tpu_id')) {
            $query->where('tpu_id', $request->tpu_id);
        }

        return $query;
    }
}
