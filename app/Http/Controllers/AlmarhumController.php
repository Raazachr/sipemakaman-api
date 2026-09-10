<?php

namespace App\Http\Controllers;

use App\Models\AdminTpu;
use App\Models\Almarhum;
use App\Models\Makam;
use App\Models\SuperAdmin;
use App\Models\Uptd;
use App\Services\ActivityLogger;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class AlmarhumController extends Controller
{
    public function index(Request $request)
    {
        $query = Almarhum::with(['makam.blok.tpu', 'makam.koordinat', 'ahliWaris']);
        $user = $request->user();

        if ($user instanceof AdminTpu) {
            // AdminTPU melihat makam di TPU-nya + almarhum yang belum ditempatkan
            // (belum punya makam) supaya tidak ada yang tersembunyi.
            $query->where(function ($q) use ($user) {
                $q->whereHas('makam.blok', fn ($b) => $b->where('tpu_id', $user->tpu_id))
                    ->orWhereNull('makam_id');
            });
        }
        // SuperAdmin & AdminUptd (semua akun) melihat SELURUH data tanpa filter wilayah.

        if ($request->filled('nama')) {
            $query->where('nama_lengkap', 'like', '%'.$request->nama.'%');
        }
        if ($request->filled('nik')) {
            $query->where('nik', $request->nik);
        }

        // Pencarian umum: nama / NIK / no registrasi
        if ($request->filled('q')) {
            $like = '%'.$request->q.'%';
            $query->where(function ($w) use ($like) {
                $w->where('nama_lengkap', 'like', $like)
                    ->orWhere('nik', 'like', $like)
                    ->orWhere('no_registrasi', 'like', $like);
            });
        }

        // Sort (whitelist kolom yang aman)
        $sortable = ['id', 'no_registrasi', 'nama_lengkap', 'nik', 'jenis_kelamin', 'tanggal_lahir', 'tanggal_wafat', 'tanggal_dimakamkan', 'created_at'];
        $sortBy = in_array($request->input('sort_by'), $sortable, true) ? $request->input('sort_by') : 'id';
        $sortDir = strtolower($request->input('sort_dir', 'desc')) === 'asc' ? 'asc' : 'desc';
        $query->orderBy($sortBy, $sortDir);

        // Hindari undefined index saat per_page tidak valid
        $perPage = min((int) $request->input('per_page', 15), 100);

        return response()->json($query->paginate($perPage));
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
            'latitude' => ['nullable', 'numeric', 'between:-90,90'],
            'longitude' => ['nullable', 'numeric', 'between:-180,180'],
            'catatan_makam' => ['nullable', 'string'],
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

        // Simpan koordinat & catatan lokasi makam (kolom non-almarhum dipisah dulu)
        $latitude = $data['latitude'] ?? null;
        $longitude = $data['longitude'] ?? null;
        $catatanMakam = $data['catatan_makam'] ?? null;
        unset($data['latitude'], $data['longitude'], $data['catatan_makam']);

        $almarhum = DB::transaction(function () use ($data, $latitude, $longitude, $catatanMakam) {
            $almarhum = Almarhum::create($data);

            // Kalau langsung ditempatkan di suatu makam, sinkronkan status makam
            if (! empty($data['makam_id'])) {
                Makam::where('id', $data['makam_id'])->update([
                    'status' => 'terisi',
                    'status_petak' => 'Terisi (Aktif)',
                ]);

                // Simpan koordinat makam kalau diisi
                if ($latitude !== null && $longitude !== null) {
                    \App\Models\KoordinatMakam::updateOrCreate(
                        ['makam_id' => $data['makam_id']],
                        ['latitude' => $latitude, 'longitude' => $longitude]
                    );
                }

                // Simpan catatan lokasi makam kalau diisi
                if ($catatanMakam !== null) {
                    Makam::where('id', $data['makam_id'])->update(['keterangan' => $catatanMakam]);
                }
            }

            return $almarhum;
        });

        ActivityLogger::log($request->user(), 'create', 'Menambah almarhum ' . $almarhum->nama_lengkap, ['tpu_id' => ($data['makam_id'] ?? null) ? (Makam::find($data['makam_id'])?->blok?->tpu_id) : null]);

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

        return response()->json($almarhum->load('makam.blok.tpu', 'makam.koordinat', 'ahliWaris'));
    }

    public function update(Request $request, Almarhum $almarhum)
    {
        if (! $this->authorizeAlmarhum($request->user(), $almarhum, true)) {
            return response()->json(['message' => 'Anda tidak memiliki akses ke data ini'], 403);
        }

        // Sanitize input tanggal dari ISO string ("2018-05-12T00:00:00.000000Z" -> "2018-05-12")
        $input = $request->all();
        foreach (['tanggal_lahir', 'tanggal_wafat', 'tanggal_dimakamkan'] as $dateField) {
            if (! empty($input[$dateField])) {
                $input[$dateField] = substr($input[$dateField], 0, 10);
            }
        }

        // Izinkan 'nama' atau 'nama_lengkap'
        if (isset($input['nama']) && ! isset($input['nama_lengkap'])) {
            $input['nama_lengkap'] = $input['nama'];
        }

        $validator = Validator::make($input, [
            'makam_id' => ['nullable', 'exists:makams,id'],
            'no_registrasi' => ['nullable', 'string', 'unique:almarhums,no_registrasi,'.$almarhum->id],
            'nik' => ['nullable', 'string', 'max:20'],
            'nama' => ['sometimes', 'nullable', 'string', 'max:255'],
            'nama_lengkap' => ['sometimes', 'required', 'string', 'max:255'],
            'bin_binti' => ['nullable', 'string', 'max:255'],
            'jenis_kelamin' => ['sometimes', 'required', 'in:L,P'],
            'tanggal_lahir' => ['nullable', 'date_format:Y-m-d'],
            'tanggal_wafat' => ['sometimes', 'nullable', 'date_format:Y-m-d'],
            'tanggal_dimakamkan' => ['nullable', 'date_format:Y-m-d'],
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
            'latitude' => ['nullable', 'numeric', 'between:-90,90'],
            'longitude' => ['nullable', 'numeric', 'between:-180,180'],
            'catatan_makam' => ['nullable', 'string'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Data tidak valid',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = $validator->validated();

        // Pastikan field nama di-sync ke kolom database yang tepat
        if (isset($data['nama']) && ! isset($data['nama_lengkap'])) {
            $data['nama_lengkap'] = $data['nama'];
        }

        // Pisahkan data koordinat & catatan makam dari data almarhum
        $latitude = $data['latitude'] ?? null;
        $longitude = $data['longitude'] ?? null;
        $catatanMakam = $data['catatan_makam'] ?? null;
        unset($data['latitude'], $data['longitude'], $data['catatan_makam']);

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

        DB::transaction(function () use ($almarhum, $data, $makamIdLama, $makamIdBaru, $latitude, $longitude, $catatanMakam) {
            $almarhum->update($data);

            if ($makamIdBaru) {
                // Simpan koordinat makam kalau diisi
                if ($latitude !== null && $longitude !== null) {
                    \App\Models\KoordinatMakam::updateOrCreate(
                        ['makam_id' => $makamIdBaru],
                        ['latitude' => $latitude, 'longitude' => $longitude]
                    );
                }

                // Simpan catatan lokasi makam kalau diisi
                if ($catatanMakam !== null) {
                    Makam::where('id', $makamIdBaru)->update(['keterangan' => $catatanMakam]);
                }
            }

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

        ActivityLogger::log($request->user(), 'update', 'Mengubah almarhum ' . $almarhum->nama_lengkap, ['tpu_id' => $almarhum->makam?->blok?->tpu_id]);

        return response()->json([
            'message' => 'Data almarhum berhasil diperbarui',
            'data' => $almarhum->fresh(['makam.blok.tpu', 'makam.koordinat', 'ahliWaris']),
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

        ActivityLogger::log($request->user(), 'delete', 'Menghapus almarhum ' . $almarhum->nama_lengkap, ['tpu_id' => $almarhum->makam?->blok?->tpu_id]);

        return response()->json(['message' => 'Data almarhum berhasil dihapus']);
    }

    private function authorizeMakam($user, Makam $makam): bool
    {
        if ($user instanceof AdminTpu) {
            return $makam->blok->tpu_id === $user->tpu_id;
        }

        // AdminUptd (semua akun) mengelola seluruh data tanpa filter wilayah
        return $user instanceof Uptd || $user instanceof SuperAdmin;
    }

    private function authorizeAlmarhum($user, Almarhum $almarhum, bool $writeOnly = false): bool
    {
        // Almarhum tanpa makam (belum ditempatkan): SuperAdmin & AdminUptd boleh kelola;
        // AdminTpu boleh baca/tambah data yang belum ditempatkan tapi TIDAK hapus langsung
        if (! $almarhum->makam_id) {
            if (! $writeOnly) {
                return $user instanceof SuperAdmin || $user instanceof AdminTpu || $user instanceof Uptd;
            }

            return ! $user instanceof AdminTpu;
        }

        $blok = $almarhum->makam->blok;

        if ($user instanceof AdminTpu) {
            return $blok->tpu_id === $user->tpu_id && ! $writeOnly;
        }

        // AdminUptd (semua akun) mengelola seluruh data tanpa filter wilayah
        return $user instanceof Uptd || $user instanceof SuperAdmin;
    }
}
