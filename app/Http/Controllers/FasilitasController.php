<?php

namespace App\Http\Controllers;

use App\Models\AdminTpu;
use App\Models\Fasilitas;
use App\Models\SuperAdmin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class FasilitasController extends Controller
{
    public function index(Request $request)
    {
        $query = Fasilitas::query();
        $user = $request->user();

        if ($user instanceof AdminTpu) {
            $query->where('tpu_id', $user->tpu_id);
        } elseif ($request->filled('tpu_id')) {
            $query->where('tpu_id', $request->tpu_id);
        }

        $perPage = min((int) $request->input('per_page', 15), 100);

        return response()->json($query->paginate($perPage));
    }

    public function store(Request $request)
    {
        $user = $request->user();

        $rules = [
            'nama_fasilitas' => ['required', 'string', 'max:255'],
            'jenis_fasilitas' => ['required', 'string', 'max:100'],
            'latitude' => ['required', 'numeric', 'between:-90,90'],
            'longitude' => ['required', 'numeric', 'between:-180,180'],
        ];

        if ($user instanceof AdminTpu) {
            $tpuId = $user->tpu_id;
        } else {
            $rules['tpu_id'] = ['required', 'exists:tpus,id'];
            $tpuId = $request->tpu_id;
        }

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['message' => 'Data tidak valid', 'errors' => $validator->errors()], 422);
        }

        $fasilitas = Fasilitas::create([
            'tpu_id' => $tpuId,
            'nama_fasilitas' => $request->nama_fasilitas,
            'jenis_fasilitas' => $request->jenis_fasilitas,
            'latitude' => $request->latitude,
            'longitude' => $request->longitude,
        ]);

        return response()->json(['message' => 'Fasilitas berhasil ditambahkan', 'data' => $fasilitas], 201);
    }

    public function show(Request $request, Fasilitas $fasilitas)
    {
        if (! $this->authorizeAccess($request->user(), $fasilitas)) {
            return response()->json(['message' => 'Anda tidak memiliki akses ke fasilitas ini'], 403);
        }

        return response()->json($fasilitas);
    }

    public function update(Request $request, Fasilitas $fasilitas)
    {
        if (! $this->authorizeAccess($request->user(), $fasilitas)) {
            return response()->json(['message' => 'Anda tidak memiliki akses ke fasilitas ini'], 403);
        }

        $validator = Validator::make($request->all(), [
            'nama_fasilitas' => ['sometimes', 'required', 'string', 'max:255'],
            'jenis_fasilitas' => ['sometimes', 'required', 'string', 'max:100'],
            'latitude' => ['sometimes', 'required', 'numeric', 'between:-90,90'],
            'longitude' => ['sometimes', 'required', 'numeric', 'between:-180,180'],
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Data tidak valid', 'errors' => $validator->errors()], 422);
        }

        $fasilitas->update($validator->validated());

        return response()->json(['message' => 'Fasilitas berhasil diperbarui', 'data' => $fasilitas]);
    }

    public function destroy(Request $request, Fasilitas $fasilitas)
    {
        if (! $this->authorizeAccess($request->user(), $fasilitas)) {
            return response()->json(['message' => 'Anda tidak memiliki akses ke fasilitas ini'], 403);
        }

        $fasilitas->delete();

        return response()->json(['message' => 'Fasilitas berhasil dihapus']);
    }

    private function authorizeAccess($user, Fasilitas $fasilitas): bool
    {
        if ($user instanceof AdminTpu) {
            return $fasilitas->tpu_id === $user->tpu_id;
        }

        return $user instanceof SuperAdmin;
    }
}
