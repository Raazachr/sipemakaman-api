<?php

namespace App\Http\Controllers;

use App\Models\AdminTpu;
use App\Models\AhliWaris;
use App\Models\Almarhum;
use App\Models\SuperAdmin;
use App\Models\Uptd;
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
        } elseif ($user instanceof Uptd) {
            $query->whereHas('almarhum.makam.blok.tpu', fn ($q) => $q->where('uptd_id', $user->id));
        }

        return response()->json($query->get());
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'almarhum_id' => ['required', 'exists:almarhums,id'],
            'nama_lengkap' => ['required', 'string', 'max:255'],
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
            'nama_lengkap' => ['sometimes', 'required', 'string', 'max:255'],
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

        $ahliWaris->update($validator->validated());

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

        return response()->json(['message' => 'Ahli waris berhasil dihapus']);
    }

    private function authorizeAlmarhum($user, Almarhum $almarhum, bool $writeOnly = false): bool
    {
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
