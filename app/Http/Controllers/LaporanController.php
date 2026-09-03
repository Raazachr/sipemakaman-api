<?php

namespace App\Http\Controllers;

use App\Models\AdminTpu;
use App\Models\Almarhum;
use App\Models\Makam;
use App\Models\Pengajuan;
use App\Models\SuperAdmin;
use App\Models\Tpu;
use App\Models\Uptd;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class LaporanController extends Controller
{
    // GET /api/laporan?tpu_id=&dari=YYYY-MM-DD&sampai=YYYY-MM-DD
    public function rekapitulasi(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'tpu_id' => ['required', 'exists:tpus,id'],
            'dari' => ['required', 'date'],
            'sampai' => ['required', 'date', 'after_or_equal:dari'],
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Data tidak valid', 'errors' => $validator->errors()], 422);
        }

        $tpu = Tpu::findOrFail($request->tpu_id);

        if (! $this->authorizeAccess($request->user(), $tpu)) {
            return response()->json(['message' => 'TPU ini bukan cakupan Anda'], 403);
        }

        $dari = $request->dari;
        $sampai = $request->sampai;

        // Pengajuan yang masuk pada periode ini (berdasarkan tanggal_pengajuan)
        $pengajuanPeriode = Pengajuan::where('tpu_id', $tpu->id)
            ->whereBetween('tanggal_pengajuan', ["$dari 00:00:00", "$sampai 23:59:59"]);

        $ringkasanPengajuan = [
            'total' => (clone $pengajuanPeriode)->count(),
            'menunggu_verifikasi' => (clone $pengajuanPeriode)->where('status', 'menunggu_verifikasi')->count(),
            'disetujui' => (clone $pengajuanPeriode)->where('status', 'disetujui')->count(),
            'ditolak' => (clone $pengajuanPeriode)->where('status', 'ditolak')->count(),
        ];

        // Makam yang dipakamkan (tanggal_dimakamkan) pada periode ini
        $almarhumPeriode = Almarhum::whereHas('makam.blok', fn ($q) => $q->where('tpu_id', $tpu->id))
            ->whereBetween('tanggal_dimakamkan', [$dari, $sampai])
            ->with('makam.blok')
            ->orderBy('tanggal_dimakamkan')
            ->get();

        // Kondisi makam TPU ini saat laporan dibuat (bukan snapshot periode, tapi kondisi terkini)
        $totalMakam = Makam::whereHas('blok', fn ($q) => $q->where('tpu_id', $tpu->id))->count();
        $makamTerisi = Makam::whereHas('blok', fn ($q) => $q->where('tpu_id', $tpu->id))
            ->where('status', 'terisi')->count();

        return response()->json([
            'tpu' => [
                'id' => $tpu->id,
                'kode_tpu' => $tpu->kode_tpu,
                'nama_tpu' => $tpu->nama_tpu,
            ],
            'periode' => ['dari' => $dari, 'sampai' => $sampai],
            'ringkasan_pengajuan' => $ringkasanPengajuan,
            'kondisi_makam_saat_ini' => [
                'total_makam' => $totalMakam,
                'terisi' => $makamTerisi,
                'kosong' => $totalMakam - $makamTerisi,
            ],
            'daftar_pemakaman_periode_ini' => $almarhumPeriode->map(function (Almarhum $a) {
                return [
                    'nama_lengkap' => $a->nama_lengkap,
                    'tanggal_wafat' => $a->tanggal_wafat?->format('Y-m-d'),
                    'tanggal_dimakamkan' => $a->tanggal_dimakamkan?->format('Y-m-d'),
                    'blok' => $a->makam?->blok?->nama_blok,
                    'kode_makam' => $a->makam?->kode_makam,
                ];
            })->values(),
        ]);
    }

    // GET /api/laporan/export?tpu_id=&dari=&sampai=  -> unduh CSV
    public function export(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'tpu_id' => ['required', 'exists:tpus,id'],
            'dari' => ['required', 'date'],
            'sampai' => ['required', 'date', 'after_or_equal:dari'],
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Data tidak valid', 'errors' => $validator->errors()], 422);
        }

        $tpu = Tpu::findOrFail($request->tpu_id);

        if (! $this->authorizeAccess($request->user(), $tpu)) {
            return response()->json(['message' => 'TPU ini bukan cakupan Anda'], 403);
        }

        $dari = $request->dari;
        $sampai = $request->sampai;

        $data = Almarhum::whereHas('makam.blok', fn ($q) => $q->where('tpu_id', $tpu->id))
            ->whereBetween('tanggal_dimakamkan', [$dari, $sampai])
            ->with('makam.blok')
            ->orderBy('tanggal_dimakamkan')
            ->get();

        $namaFile = 'laporan-' . $tpu->kode_tpu . '-' . $dari . '-sd-' . $sampai . '.csv';

        return response()->streamDownload(function () use ($data) {
            $handle = fopen('php://output', 'w');
            fputcsv($handle, ['Nama Lengkap', 'Tanggal Wafat', 'Tanggal Dimakamkan', 'Blok', 'Kode Makam']);

            foreach ($data as $a) {
                fputcsv($handle, [
                    $a->nama_lengkap,
                    $a->tanggal_wafat?->format('Y-m-d'),
                    $a->tanggal_dimakamkan?->format('Y-m-d'),
                    $a->makam?->blok?->nama_blok,
                    $a->makam?->kode_makam,
                ]);
            }

            fclose($handle);
        }, $namaFile, ['Content-Type' => 'text/csv']);
    }

    private function authorizeAccess($user, Tpu $tpu): bool
    {
        if ($user instanceof AdminTpu) {
            return $tpu->id === $user->tpu_id;
        }
        if ($user instanceof Uptd) {
            return $tpu->uptd_id === $user->id;
        }

        return $user instanceof SuperAdmin;
    }
}
