<?php

namespace App\Http\Controllers;

use App\Models\AdminTpu;
use App\Models\Almarhum;
use App\Models\Makam;
use App\Models\SuperAdmin;
use App\Models\Uptd;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class AlmarhumController extends Controller
{
    public function index(Request $request)
    {
        $query = Almarhum::with('makam.blok.tpu');
        $user = $request->user();

        if ($user instanceof AdminTpu) {
            $query->whereHas('makam.blok', fn ($q) => $q->where('tpu_id', $user->tpu_id));
        } elseif ($user instanceof Uptd) {
            $query->whereHas('makam.blok.tpu', fn ($q) => $q->where('uptd_id', $user->id));
        }

        if ($request->filled('nama')) {
            $query->where('nama_lengkap', 'like', '%' . $request->nama . '%');
        }
        if ($request->filled('nik')) {
            $query->where('nik', $request->nik);
        }

        return response()->json($query->get());
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'makam_id' => ['nullable', 'exists:makams,id'],
            'no_registrasi' => ['nullable', 'string', 'unique:almarhums,no_registrasi'],
            'nik' => ['nullable', 'string', 'max:20'],
            'nama_lengkap' => ['required', 'string', 'max:255'],
            'bin_binti' => ['nullable', 'string', 'max:255'],
            'jenis_kelamin' => ['required', 'in:L,P'],
            'tanggal_lahir' => ['nullable', 'date'],
            'tanggal_wafat' => ['required', 'date'],
            'tanggal_dimakamkan' => ['nullable', 'date'],
            'agama' => ['nullable', 'string'],
            'alamat' => ['nullable', 'string'],
            'alamat_jalan' => ['nullable', 'string'],
            'no_rumah' => ['nullable', 'string', 'max:20'],
            'rt' => ['nullable', 'string', 'max:5'],
            'rw' => ['nullable', 'string', 'max:5'],
            'kelurahan' => ['nullable', 'string'],
            'kecamatan' => ['nullable', 'string'],
            'kota_kabupaten' => ['nullable', 'string'],
            'provinsi' => ['nullable', 'string'],
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Data tidak valid', 'errors' => $validator->errors()], 422);
        }

        $data = $validator->validated();

        if (! empty($data['makam_id'])) {
            $makam = Makam::with('blok')->findOrFail($data['makam_id']);

            if (! $this->authorizeMakam($request->user(), $makam)) {
                return response()->json(['message' => 'Makam ini bukan tanggung jawab Anda'], 403);
            }

            if ($makam->almarhum()->exists()) {
                return response()->json(['message' => 'Makam ini sudah ditempati almarhum lain'], 422);
            }
        }

        $almarhum = DB::transaction(function () use ($data) {
            $almarhum = Almarhum::create($data);

            // Kalau langsung ditempatkan di suatu makam, sinkronkan status makam
            if (! empty($data['makam_id'])) {
                Makam::where('id', $data['makam_id'])->update([
                    'status' => 'terisi',
                    'status_petak' => 'Terisi (Aktif)',
                ]);
            }

            return $almarhum;
        });

        return response()->json([
            'message' => 'Data almarhum berhasil ditambahkan',
            'data' => $almarhum,
        ], 201);
    }

    public function show(Request $request, Almarhum $almarhum)
    {
        if (! $this->authorizeAlmarhum($request->user(), $almarhum)) {
            return response()->json(['message' => 'Anda tidak memiliki akses ke data ini'], 403);
        }

        return response()->json($almarhum->load('makam.blok.tpu', 'ahliWaris'));
    }

    public function update(Request $request, Almarhum $almarhum)
    {
        if (! $this->authorizeAlmarhum($request->user(), $almarhum, true)) {
            return response()->json(['message' => 'Anda tidak memiliki akses ke data ini'], 403);
        }

        $validator = Validator::make($request->all(), [
            'makam_id' => ['nullable', 'exists:makams,id'],
            'no_registrasi' => ['nullable', 'string', 'unique:almarhums,no_registrasi,' . $almarhum->id],
            'nik' => ['nullable', 'string', 'max:20'],
            'nama_lengkap' => ['sometimes', 'required', 'string', 'max:255'],
            'bin_binti' => ['nullable', 'string', 'max:255'],
            'jenis_kelamin' => ['sometimes', 'required', 'in:L,P'],
            'tanggal_lahir' => ['nullable', 'date'],
            'tanggal_wafat' => ['sometimes', 'required', 'date'],
            'tanggal_dimakamkan' => ['nullable', 'date'],
            'agama' => ['nullable', 'string'],
            'alamat' => ['nullable', 'string'],
            'alamat_jalan' => ['nullable', 'string'],
            'no_rumah' => ['nullable', 'string', 'max:20'],
            'rt' => ['nullable', 'string', 'max:5'],
            'rw' => ['nullable', 'string', 'max:5'],
            'kelurahan' => ['nullable', 'string'],
            'kecamatan' => ['nullable', 'string'],
            'kota_kabupaten' => ['nullable', 'string'],
            'provinsi' => ['nullable', 'string'],
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Data tidak valid', 'errors' => $validator->errors()], 422);
        }

        $data = $validator->validated();
        $makamIdLama = $almarhum->makam_id;
        $makamIdBaru = array_key_exists('makam_id', $data) ? $data['makam_id'] : $makamIdLama;

        if ($makamIdBaru && $makamIdBaru !== $makamIdLama) {
            $makamBaru = Makam::with('blok')->findOrFail($makamIdBaru);

            if (! $this->authorizeMakam($request->user(), $makamBaru)) {
                return response()->json(['message' => 'Makam tujuan bukan tanggung jawab Anda'], 403);
            }
            if ($makamBaru->almarhum()->exists()) {
                return response()->json(['message' => 'Makam tujuan sudah ditempati almarhum lain'], 422);
            }
        }

        DB::transaction(function () use ($almarhum, $data, $makamIdLama, $makamIdBaru) {
            $almarhum->update($data);

            if ($makamIdBaru !== $makamIdLama) {
                // Kosongkan makam lama (kalau ada)
                if ($makamIdLama) {
                    Makam::where('id', $makamIdLama)->update([
                        'status' => 'kosong',
                        'status_petak' => 'Kosong (Tersedia)',
                    ]);
                }
                // Isi makam baru (kalau ada)
                if ($makamIdBaru) {
                    Makam::where('id', $makamIdBaru)->update([
                        'status' => 'terisi',
                        'status_petak' => 'Terisi (Aktif)',
                    ]);
                }
            }
        });

        return response()->json([
            'message' => 'Data almarhum berhasil diperbarui',
            'data' => $almarhum->fresh(),
        ]);
    }

    public function destroy(Request $request, Almarhum $almarhum)
    {
        if (! $this->authorizeAlmarhum($request->user(), $almarhum, true)) {
            return response()->json(['message' => 'Anda tidak memiliki akses ke data ini'], 403);
        }

        DB::transaction(function () use ($almarhum) {
            if ($almarhum->makam_id) {
                Makam::where('id', $almarhum->makam_id)->update([
                    'status' => 'kosong',
                    'status_petak' => 'Kosong (Tersedia)',
                ]);
            }
            $almarhum->delete();
        });

        return response()->json(['message' => 'Data almarhum berhasil dihapus']);
    }

    private function authorizeMakam($user, Makam $makam): bool
    {
        if ($user instanceof AdminTpu) {
            return $makam->blok->tpu_id === $user->tpu_id;
        }

        return $user instanceof SuperAdmin;
    }

    private function authorizeAlmarhum($user, Almarhum $almarhum, bool $writeOnly = false): bool
    {
        // Almarhum tanpa makam (belum ditempatkan): hanya SuperAdmin & AdminTpu manapun boleh urus dulu
        if (! $almarhum->makam_id) {
            return $user instanceof SuperAdmin || $user instanceof AdminTpu;
        }

        $blok = $almarhum->makam->blok;

        if ($user instanceof AdminTpu) {
            return $blok->tpu_id === $user->tpu_id;
        }

        if (! $writeOnly && $user instanceof Uptd) {
            return $blok->tpu->uptd_id === $user->id;
        }

        return $user instanceof SuperAdmin;
    }
}
