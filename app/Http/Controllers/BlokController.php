<?php

namespace App\Http\Controllers;

use App\Models\AdminTpu;
use App\Models\Blok;
use App\Models\SuperAdmin;
use App\Models\Uptd;
use App\Services\ActivityLogger;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BlokController extends Controller
{
    private const STATUS_OPTIONS = [
        'Terisi (Aktif)',
        'Kosong (Tersedia)',
        'Tersedia untuk Makam Tumpuk',
    ];

    public function index(Request $request)
    {
        $query = Blok::with('parentBlok')->withCount('makams');
        $user = $request->user();

        if ($user instanceof AdminTpu) {
            $query->where('tpu_id', $user->tpu_id);
        } elseif ($request->filled('tpu_id')) {
            $query->where('tpu_id', $request->tpu_id);
        }
        // SuperAdmin & AdminUptd (semua akun) melihat SELURUH data tanpa filter wilayah.

        $perPage = min((int) $request->input('per_page', 15), 100);

        return response()->json($query->paginate($perPage));
    }

    public function store(Request $request)
    {
        $user = $request->user();

        $rules = [
            'kode_blok' => ['required', 'string'],
            'nama_blok' => ['required', 'string', 'max:255'],
            'keterangan' => ['nullable', 'string'],
            'parent_blok_id' => ['nullable', 'integer', 'exists:bloks,id'],
            'corners' => ['nullable', 'array', 'min:3'],
            'corners.*.lat' => ['required_with:corners', 'numeric', 'between:-90,90'],
            'corners.*.lng' => ['required_with:corners', 'numeric', 'between:-180,180'],
            'status_ketersediaan' => ['nullable', 'in:' . implode(',', self::STATUS_OPTIONS)],
        ];

        if ($user instanceof AdminTpu) {
            $tpuId = $user->tpu_id;
        } else {
            // SuperAdmin & AdminUptd (semua akun): boleh memilih TPU mana pun
            $rules['tpu_id'] = ['required', 'exists:tpus,id'];
            $tpuId = $request->tpu_id;
        }

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['message' => 'Data tidak valid', 'errors' => $validator->errors()], 422);
        }

        if (Blok::where('tpu_id', $tpuId)->where('kode_blok', $request->kode_blok)->exists()) {
            return response()->json(['message' => 'Kode blok sudah dipakai di TPU ini'], 422);
        }

        // Pastikan hierarki cuma 1 level: parent yang dipilih tidak boleh sub-blok juga
        if ($request->filled('parent_blok_id')) {
            $parent = Blok::find($request->parent_blok_id);
            if (! $parent || $parent->tpu_id !== (int) $tpuId) {
                return response()->json(['message' => 'Blok Utama harus berada di TPU yang sama'], 422);
            }
            if ($parent->parent_blok_id !== null) {
                return response()->json(['message' => 'Sub-blok tidak boleh dijadikan induk (maksimal 1 level)'], 422);
            }
        }

        $blok = Blok::create([
            'tpu_id' => $tpuId,
            'parent_blok_id' => $request->parent_blok_id,
            'kode_blok' => $request->kode_blok,
            'nama_blok' => $request->nama_blok,
            'keterangan' => $request->keterangan,
            'corners' => $request->corners,
            'status_ketersediaan' => $request->status_ketersediaan ?? 'Kosong (Tersedia)',
        ]);

        ActivityLogger::log($request->user(), 'create', 'Menambah blok ' . $blok->nama_blok, ['tpu_id' => $tpuId]);

        return response()->json(['message' => 'Blok berhasil ditambahkan', 'data' => $blok], 201);
    }

    public function show(Request $request, Blok $blok)
    {
        if (! $this->authorizeAccess($request->user(), $blok)) {
            return response()->json(['message' => 'Anda tidak memiliki akses ke blok ini'], 403);
        }

        return response()->json($blok->load('parentBlok', 'subBloks', 'makams'));
    }

    public function update(Request $request, Blok $blok)
    {
        if (! $this->authorizeAccess($request->user(), $blok, true)) {
            return response()->json(['message' => 'Anda tidak memiliki akses ke blok ini'], 403);
        }

        $validator = Validator::make($request->all(), [
            'kode_blok' => ['sometimes', 'required', 'string'],
            'nama_blok' => ['sometimes', 'required', 'string', 'max:255'],
            'keterangan' => ['nullable', 'string'],
            'corners' => ['nullable', 'array', 'min:3'],
            'corners.*.lat' => ['required_with:corners', 'numeric', 'between:-90,90'],
            'corners.*.lng' => ['required_with:corners', 'numeric', 'between:-180,180'],
            'status_ketersediaan' => ['nullable', 'in:' . implode(',', self::STATUS_OPTIONS)],
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Data tidak valid', 'errors' => $validator->errors()], 422);
        }

        $blok->update($validator->validated());

        ActivityLogger::log($request->user(), 'update', 'Mengubah blok ' . $blok->nama_blok, ['tpu_id' => $blok->tpu_id]);

        return response()->json(['message' => 'Blok berhasil diperbarui', 'data' => $blok]);
    }

    public function destroy(Request $request, Blok $blok)
    {
        if (! $this->authorizeAccess($request->user(), $blok, true)) {
            return response()->json(['message' => 'Anda tidak memiliki akses ke blok ini'], 403);
        }

        if ($blok->subBloks()->exists()) {
            return response()->json(['message' => 'Hapus dulu sub-blok di dalamnya'], 422);
        }

        $blok->delete();

        ActivityLogger::log($request->user(), 'delete', 'Menghapus blok ' . $blok->nama_blok, ['tpu_id' => $blok->tpu_id]);

        return response()->json(['message' => 'Blok berhasil dihapus']);
    }

    private function authorizeAccess($user, Blok $blok, bool $writeOnly = false): bool
    {
        if ($user instanceof AdminTpu) {
            // AdminTPU boleh melihat blok TPU-nya; TIDAK boleh edit (writeOnly -> false)
            return $blok->tpu_id === $user->tpu_id && ! $writeOnly;
        }

        // AdminUptd (semua akun) mengelola seluruh data tanpa filter wilayah
        return $user instanceof Uptd || $user instanceof SuperAdmin;
    }
}
