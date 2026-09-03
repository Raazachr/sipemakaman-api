<?php

namespace App\Http\Controllers;

use App\Models\AdminTpu;
use App\Models\Blok;
use App\Models\Makam;
use App\Models\SuperAdmin;
use App\Models\Uptd;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class MakamController extends Controller
{
    public function index(Request $request)
    {
        $query = Makam::with(['blok.tpu', 'almarhum']);
        $user = $request->user();

        if ($user instanceof AdminTpu) {
            $query->whereHas('blok', fn ($q) => $q->where('tpu_id', $user->tpu_id));
        } elseif ($user instanceof Uptd) {
            $query->whereHas('blok.tpu', fn ($q) => $q->where('uptd_id', $user->id));
        } elseif ($request->filled('blok_id')) {
            $query->where('blok_id', $request->blok_id);
        }

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        $perPage = min((int) $request->input('per_page', 15), 100);

        return response()->json($query->paginate($perPage));
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'blok_id' => ['required', 'exists:bloks,id'],
            'kode_makam' => ['required', 'string'],
            'nomor_makam' => ['required', 'string'],
            'status' => ['nullable', 'in:kosong,terisi'],
            'status_petak' => ['nullable', 'string'],
            'keterangan' => ['nullable', 'string'],
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Data tidak valid', 'errors' => $validator->errors()], 422);
        }

        $blok = Blok::findOrFail($request->blok_id);

        if (! $this->authorizeBlok($request->user(), $blok)) {
            return response()->json(['message' => 'Blok ini bukan tanggung jawab Anda'], 403);
        }

        if (Makam::where('blok_id', $blok->id)->where('kode_makam', $request->kode_makam)->exists()) {
            return response()->json(['message' => 'Kode makam sudah dipakai di blok ini'], 422);
        }

        $status = $request->status ?? 'kosong';

        $makam = Makam::create([
            'blok_id' => $blok->id,
            'kode_makam' => $request->kode_makam,
            'nomor_makam' => $request->nomor_makam,
            'status' => $status,
            'status_petak' => $request->status_petak ?? $this->defaultStatusPetak($status),
            'keterangan' => $request->keterangan,
        ]);

        return response()->json(['message' => 'Makam berhasil ditambahkan', 'data' => $makam], 201);
    }

    public function show(Request $request, Makam $makam)
    {
        if (! $this->authorizeMakam($request->user(), $makam)) {
            return response()->json(['message' => 'Anda tidak memiliki akses ke makam ini'], 403);
        }

        return response()->json($makam->load('blok.tpu', 'almarhum.ahliWaris'));
    }

    public function update(Request $request, Makam $makam)
    {
        if (! $this->authorizeMakam($request->user(), $makam, true)) {
            return response()->json(['message' => 'Anda tidak memiliki akses ke makam ini'], 403);
        }

        $validator = Validator::make($request->all(), [
            'kode_makam' => ['sometimes', 'required', 'string'],
            'nomor_makam' => ['sometimes', 'required', 'string'],
            'status' => ['nullable', 'in:kosong,terisi'],
            'status_petak' => ['nullable', 'string'],
            'keterangan' => ['nullable', 'string'],
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Data tidak valid', 'errors' => $validator->errors()], 422);
        }

        $makam->update($validator->validated());

        return response()->json(['message' => 'Makam berhasil diperbarui', 'data' => $makam]);
    }

    public function destroy(Request $request, Makam $makam)
    {
        if (! $this->authorizeMakam($request->user(), $makam, true)) {
            return response()->json(['message' => 'Anda tidak memiliki akses ke makam ini'], 403);
        }

        $makam->delete();

        return response()->json(['message' => 'Makam berhasil dihapus']);
    }

    private function defaultStatusPetak(string $status): string
    {
        return $status === 'terisi' ? 'Terisi (Aktif)' : 'Kosong (Tersedia)';
    }

    private function authorizeBlok($user, Blok $blok): bool
    {
        if ($user instanceof AdminTpu) {
            return $blok->tpu_id === $user->tpu_id;
        }

        return $user instanceof SuperAdmin;
    }

    private function authorizeMakam($user, Makam $makam, bool $writeOnly = false): bool
    {
        $blok = $makam->blok;

        if ($user instanceof AdminTpu) {
            return $blok->tpu_id === $user->tpu_id;
        }

        if (! $writeOnly && $user instanceof Uptd) {
            return $blok->tpu->uptd_id === $user->id;
        }

        return $user instanceof SuperAdmin;
    }
}
