<?php

namespace App\Http\Controllers;

use App\Models\AdminTpu;
use App\Models\AhliWaris;
use App\Models\Almarhum;
use App\Models\SuperAdmin;
use App\Models\Uptd;
use App\Services\ActivityLogger;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AhliWarisController extends Controller
{
    public function index(Request $request)
    {
        $query = AhliWaris::with('almarhum');

        if ($request->filled('almarhum_id')) {
            $query->where('almarhum_id', $request->almarhum_id);
        }

        $user = $request->user();
        if ($user instanceof AdminTpu) {
            $query->whereHas('almarhum.makam.blok', fn ($q) => $q->where('tpu_id', $user->tpu_id));
        }
        // SuperAdmin & AdminUptd (semua akun) melihat SELURUH data tanpa filter wilayah.

        // Pencarian umum: nama / NIK / hubungan / nama almarhum
        if ($request->filled('q')) {
            $like = '%'.$request->q.'%';
            $query->where(function ($w) use ($like) {
                $w->where('nama_lengkap', 'like', $like)
                    ->orWhere('nik', 'like', $like)
                    ->orWhere('hubungan', 'like', $like)
                    ->orWhere('no_telepon', 'like', $like)
                    ->orWhereHas('almarhum', fn ($a) => $a->where('nama_lengkap', 'like', $like));
            });
        }

        // Sort (whitelist kolom yang aman)
        $sortable = ['id', 'nama_lengkap', 'nik', 'hubungan', 'no_telepon', 'created_at'];
        $sortBy = in_array($request->input('sort_by'), $sortable, true) ? $request->input('sort_by') : 'id';
        $sortDir = strtolower($request->input('sort_dir', 'desc')) === 'asc' ? 'asc' : 'desc';
        $query->orderBy($sortBy, $sortDir);

        $perPage = min((int) $request->input('per_page', 15), 100);

        return response()->json($query->paginate($perPage));
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'almarhum_id' => ['required', 'exists:almarhums,id'],
            'nama_lengkap' => ['required', 'string', 'max:255'],
            'nik' => ['nullable', 'string', 'max:20'],
            'hubungan' => ['required', 'string', 'max:100'],
            'alamat' => ['nullable', 'string'],
            'alamat_jalan' => ['nullable', 'string'],
            'no_rumah' => ['nullable', 'string', 'max:20'],
            'rt' => ['nullable', 'string', 'max:5'],
            'rw' => ['nullable', 'string', 'max:5'],
            'kelurahan' => ['nullable', 'string'],
            'kecamatan' => ['nullable', 'string'],
            'kota_kabupaten' => ['nullable', 'string'],
            'provinsi' => ['nullable', 'string'],
            'no_telepon' => ['nullable', 'string', 'max:20'],
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Data tidak valid', 'errors' => $validator->errors()], 422);
        }

        $almarhum = Almarhum::findOrFail($request->almarhum_id);

        if (! $this->authorizeAlmarhum($request->user(), $almarhum)) {
            return response()->json(['message' => 'Anda tidak memiliki akses ke data almarhum ini'], 403);
        }

        $ahliWaris = AhliWaris::create($validator->validated());

        ActivityLogger::log($request->user(), 'create', 'Menambah ahli waris ' . $ahliWaris->nama_lengkap, ['tpu_id' => $almarhum->makam?->blok?->tpu_id]);

        return response()->json([
            'message' => 'Ahli waris berhasil ditambahkan',
            'data' => $ahliWaris,
        ], 201);
    }

    public function show(Request $request, AhliWaris $ahliWaris)
    {
        if (! $this->authorizeAlmarhum($request->user(), $ahliWaris->almarhum)) {
            return response()->json(['message' => 'Anda tidak memiliki akses ke data ini'], 403);
        }

        return response()->json($ahliWaris->load('almarhum'));
    }

    public function update(Request $request, AhliWaris $ahliWaris)
    {
        if (! $this->authorizeAlmarhum($request->user(), $ahliWaris->almarhum, true)) {
            return response()->json(['message' => 'Anda tidak memiliki akses ke data ini'], 403);
        }

        $validator = Validator::make($request->all(), [
            'almarhum_id' => ['sometimes', 'required', 'exists:almarhums,id'],
            'nama_lengkap' => ['sometimes', 'required', 'string', 'max:255'],
            'nik' => ['nullable', 'string', 'max:20'],
            'hubungan' => ['sometimes', 'required', 'string', 'max:100'],
            'alamat' => ['nullable', 'string'],
            'alamat_jalan' => ['nullable', 'string'],
            'no_rumah' => ['nullable', 'string', 'max:20'],
            'rt' => ['nullable', 'string', 'max:5'],
            'rw' => ['nullable', 'string', 'max:5'],
            'kelurahan' => ['nullable', 'string'],
            'kecamatan' => ['nullable', 'string'],
            'kota_kabupaten' => ['nullable', 'string'],
            'provinsi' => ['nullable', 'string'],
            'no_telepon' => ['nullable', 'string', 'max:20'],
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Data tidak valid', 'errors' => $validator->errors()], 422);
        }

        $data = $validator->validated();

        // Jika almarhum dipindahkan, otorisasi terhadap almarhum yang baru juga
        if (! empty($data['almarhum_id']) && (int) $data['almarhum_id'] !== (int) $ahliWaris->almarhum_id) {
            $almarhumBaru = Almarhum::findOrFail($data['almarhum_id']);
            if (! $this->authorizeAlmarhum($request->user(), $almarhumBaru, true)) {
                return response()->json(['message' => 'Anda tidak memiliki akses ke almarhum tujuan ini'], 403);
            }
        }

        $ahliWaris->update($data);

        ActivityLogger::log($request->user(), 'update', 'Mengubah ahli waris ' . $ahliWaris->nama_lengkap, ['tpu_id' => $ahliWaris->almarhum->makam?->blok?->tpu_id]);

        return response()->json([
            'message' => 'Ahli waris berhasil diperbarui',
            'data' => $ahliWaris,
        ]);
    }

    public function destroy(Request $request, AhliWaris $ahliWaris)
    {
        if (! $this->authorizeAlmarhum($request->user(), $ahliWaris->almarhum, true)) {
            return response()->json(['message' => 'Anda tidak memiliki akses ke data ini'], 403);
        }

        $ahliWaris->delete();

        ActivityLogger::log($request->user(), 'delete', 'Menghapus ahli waris ' . $ahliWaris->nama_lengkap, ['tpu_id' => $ahliWaris->almarhum->makam?->blok?->tpu_id]);

        return response()->json(['message' => 'Ahli waris berhasil dihapus']);
    }

    private function authorizeAlmarhum($user, Almarhum $almarhum, bool $writeOnly = false): bool
    {
        if (! $almarhum->makam_id) {
            return $user instanceof SuperAdmin || $user instanceof AdminTpu || $user instanceof Uptd;
        }

        $blok = $almarhum->makam->blok;

        if ($user instanceof AdminTpu) {
            return $blok->tpu_id === $user->tpu_id && ! $writeOnly;
        }

        // AdminUptd (semua akun) mengelola seluruh data tanpa filter wilayah
        return $user instanceof Uptd || $user instanceof SuperAdmin;
    }
}
