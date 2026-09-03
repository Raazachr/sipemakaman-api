<?php

namespace App\Http\Controllers;

use App\Models\Almarhum;
use App\Models\Blok;
use App\Models\Fasilitas;
use App\Models\KoordinatMakam;
use App\Models\Makam;
use App\Models\Tpu;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PetaDataController extends Controller
{
    /**
     * GET /api/tpu/{tpu}/peta-data
     *
     * Mengembalikan seluruh data yang dibutuhkan peta dalam SATU response,
     * dengan nama field yang sengaja dibuat sama persis dengan variabel
     * GRAVE_DATA, ZONES, dan FACILITY_DATA di file HTML tim peta —
     * supaya mereka tinggal ganti mock data dengan hasil fetch() ke sini.
     */
    public function show(Tpu $tpu)
    {
        return response()->json([
            'tpu' => [
                'id' => $tpu->id,
                'kodeTpu' => $tpu->kode_tpu,
                'namaTpu' => $tpu->nama_tpu,
                'center' => [
                    (float) $tpu->center_lat,
                    (float) $tpu->center_lng,
                ],
                'defaultZoom' => $tpu->zoom_level,
            ],
            'zones' => $this->buildZones($tpu),
            'graves' => $this->buildGraves($tpu),
            'facilities' => $this->buildFacilities($tpu),
        ]);
    }

    /**
     * PUT /api/makam/{makam}/koordinat
     *
     * Update (create atau replace) koordinat latitude/longitude suatu makam.
     */
    public function updateKoordinat(Request $request, Makam $makam): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'latitude' => ['required', 'numeric', 'between:-90,90'],
            'longitude' => ['required', 'numeric', 'between:-180,180'],
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Data tidak valid', 'errors' => $validator->errors()], 422);
        }

        $koordinat = KoordinatMakam::updateOrCreate(
            ['makam_id' => $makam->id],
            [
                'latitude' => $request->latitude,
                'longitude' => $request->longitude,
            ]
        );

        return response()->json([
            'message' => 'Koordinat makam berhasil diperbarui',
            'data' => $koordinat,
        ]);
    }

    private function buildZones(Tpu $tpu): array
    {
        return Blok::where('tpu_id', $tpu->id)
            ->with('parentBlok')
            ->get()
            ->map(function (Blok $blok) {
                return [
                    'id' => 'zone-' . $blok->id,
                    'name' => $blok->nama_blok,
                    // frontend mencocokkan sub-blok ke induknya lewat NAMA, bukan id
                    'parent' => $blok->parentBlok?->nama_blok,
                    'corners' => $blok->corners ?? [],
                    'statusKetersediaan' => $blok->status_ketersediaan,
                ];
            })
            ->values()
            ->all();
    }

    private function buildGraves(Tpu $tpu): array
    {
        return Makam::whereHas('blok', fn ($q) => $q->where('tpu_id', $tpu->id))
            ->with(['blok', 'almarhum'])
            ->get()
            ->map(function (Makam $makam) {
                $blok = $makam->blok;
                $almarhum = $makam->almarhum;

                return [
                    'id' => (string) $makam->id,
                    'noRegistrasi' => $almarhum?->no_registrasi,
                    'fullName' => $almarhum?->nama_lengkap,
                    'nik' => $almarhum?->nik,
                    'binBinti' => $almarhum?->bin_binti,
                    'birthDate' => $almarhum?->tanggal_lahir?->format('Y-m-d'),
                    'meninggalTanggal' => $almarhum?->tanggal_wafat?->format('Y-m-d'),
                    'dimakamkanTanggal' => $almarhum?->tanggal_dimakamkan?->format('Y-m-d'),
                    'alamatJalan' => $almarhum?->alamat_jalan,
                    'kelurahan' => $almarhum?->kelurahan,
                    'kecamatan' => $almarhum?->kecamatan,
                    'block' => $blok?->nama_blok,
                    'plotNumber' => $blok ? $blok->kode_blok . '-' . $makam->nomor_makam : null,
                    'statusPetak' => $makam->status_petak,
                    'status' => $makam->status,
                ];
            })
            ->values()
            ->all();
    }

    private function buildFacilities(Tpu $tpu): array
    {
        return Fasilitas::where('tpu_id', $tpu->id)
            ->get()
            ->map(function (Fasilitas $fasilitas) {
                return [
                    'id' => (string) $fasilitas->id,
                    'namaFasilitas' => $fasilitas->nama_fasilitas,
                    'jenisFasilitas' => $fasilitas->jenis_fasilitas,
                    'latitude' => (float) $fasilitas->latitude,
                    'longitude' => (float) $fasilitas->longitude,
                ];
            })
            ->values()
            ->all();
    }
}
