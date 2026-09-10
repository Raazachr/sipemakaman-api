<?php

namespace App\Http\Controllers;

use App\Models\AdminTpu;
use App\Models\Blok;
use App\Models\Makam;
use App\Models\SuperAdmin;
use App\Models\Uptd;
use App\Services\ActivityLogger;
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
        } elseif ($request->filled('blok_id')) {
            $query->where('blok_id', $request->blok_id);
        }
        // SuperAdmin & AdminUptd (semua akun) melihat SELURUH data tanpa filter wilayah.

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        // Pencarian umum: kode / nomor makam / nama blok / nama almarhum
        if ($request->filled('q')) {
            $like = '%'.$request->q.'%';
            $query->where(function ($w) use ($like) {
                $w->where('kode_makam', 'like', $like)
                    ->orWhere('nomor_makam', 'like', $like)
                    ->orWhereHas('blok', fn ($b) => $b->where('nama_blok', 'like', $like)->orWhere('kode_blok', 'like', $like))
                    ->orWhereHas('almarhum', fn ($a) => $a->where('nama_lengkap', 'like', $like));
            });
        }

        // Sort (whitelist kolom yang aman)
        $sortable = ['id', 'kode_makam', 'nomor_makam', 'blok_id', 'status', 'created_at'];
        $sortBy = in_array($request->input('sort_by'), $sortable, true) ? $request->input('sort_by') : 'id';
        $sortDir = strtolower($request->input('sort_dir', 'desc')) === 'asc' ? 'asc' : 'desc';
        $query->orderBy($sortBy, $sortDir);

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

        ActivityLogger::log($request->user(), 'create', 'Menambah makam ' . $makam->kode_makam, ['tpu_id' => $blok->tpu_id]);

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

        ActivityLogger::log($request->user(), 'update', 'Mengubah makam ' . $makam->kode_makam, ['tpu_id' => $makam->blok->tpu_id]);

        return response()->json(['message' => 'Makam berhasil diperbarui', 'data' => $makam]);
    }

    public function destroy(Request $request, Makam $makam)
    {
        if (! $this->authorizeMakam($request->user(), $makam, true)) {
            return response()->json(['message' => 'Anda tidak memiliki akses ke makam ini'], 403);
        }

        $makam->delete();

        ActivityLogger::log($request->user(), 'delete', 'Menghapus makam ' . $makam->kode_makam, ['tpu_id' => $makam->blok->tpu_id]);

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

        // AdminUptd (semua akun) mengelola seluruh data tanpa filter wilayah
        return $user instanceof Uptd || $user instanceof SuperAdmin;
    }

    private function authorizeMakam($user, Makam $makam, bool $writeOnly = false): bool
    {
        $blok = $makam->blok;

        if ($user instanceof AdminTpu) {
            // AdminTPU boleh melihat makam TPU-nya; TIDAK boleh edit/hapus
            return $blok->tpu_id === $user->tpu_id && ! $writeOnly;
        }

        // AdminUptd (semua akun) mengelola seluruh data tanpa filter wilayah
        return $user instanceof Uptd || $user instanceof SuperAdmin;
    }
}
