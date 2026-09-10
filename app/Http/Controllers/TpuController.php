<?php

namespace App\Http\Controllers;

use App\Models\AdminTpu;
use App\Models\Tpu;
use App\Models\Uptd;
use App\Services\ActivityLogger;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class TpuController extends Controller
{
    // Bisa diakses SuperAdmin (lihat semua), UPTD (lihat cakupannya), AdminTpu (lihat TPU-nya sendiri)
    public function index(Request $request)
    {
        $query = Tpu::with('uptd');
        $user = $request->user();

        if ($user instanceof AdminTpu) {
            $query->where('id', $user->tpu_id);
        }
        // SuperAdmin & AdminUptd (semua akun): lihat semua TPU.

        $perPage = min((int) $request->input('per_page', 15), 100);

        return response()->json($query->paginate($perPage));
    }

    public function show(Request $request, Tpu $tpu)
    {
        $user = $request->user();

        // Cegah AdminTpu mengintip TPU yang bukan cakupannya lewat akses langsung by ID
        // (AdminUptd & SuperAdmin boleh melihat semua TPU)
        if ($user instanceof AdminTpu && $tpu->id !== $user->tpu_id) {
            return response()->json(['message' => 'TPU ini bukan tanggung jawab Anda'], 403);
        }

        return response()->json($tpu->load('uptd', 'bloks', 'admins'));
    }

    // Hanya Super Admin yang boleh sampai sini (dibatasi di routes/api.php)
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'uptd_id' => ['nullable', 'exists:uptds,id'],
            'kode_tpu' => ['required', 'string', 'unique:tpus,kode_tpu'],
            'nama_tpu' => ['required', 'string', 'max:255'],
            'alamat' => ['nullable', 'string'],
            'kelurahan' => ['nullable', 'string'],
            'kecamatan' => ['nullable', 'string'],
            'kota' => ['nullable', 'string'],
            'provinsi' => ['nullable', 'string'],
            'status' => ['nullable', 'in:aktif,tidak_aktif'],
            'center_lat' => ['nullable', 'numeric', 'between:-90,90'],
            'center_lng' => ['nullable', 'numeric', 'between:-180,180'],
            'zoom_level' => ['nullable', 'integer', 'min:1', 'max:20'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Data tidak valid',
                'errors' => $validator->errors(),
            ], 422);
        }

        $tpu = Tpu::create($validator->validated());

        ActivityLogger::log($request->user(), 'create', 'Menambah TPU ' . $tpu->nama_tpu, ['uptd_id' => $tpu->uptd_id, 'tpu_id' => $tpu->id]);

        return response()->json([
            'message' => 'TPU berhasil ditambahkan',
            'data' => $tpu,
        ], 201);
    }

    public function update(Request $request, Tpu $tpu)
    {
        $validator = Validator::make($request->all(), [
            'uptd_id' => ['nullable', 'exists:uptds,id'],
            'kode_tpu' => ['sometimes', 'required', 'string', 'unique:tpus,kode_tpu,' . $tpu->id],
            'nama_tpu' => ['sometimes', 'required', 'string', 'max:255'],
            'alamat' => ['nullable', 'string'],
            'kelurahan' => ['nullable', 'string'],
            'kecamatan' => ['nullable', 'string'],
            'kota' => ['nullable', 'string'],
            'provinsi' => ['nullable', 'string'],
            'status' => ['nullable', 'in:aktif,tidak_aktif'],
            'center_lat' => ['nullable', 'numeric', 'between:-90,90'],
            'center_lng' => ['nullable', 'numeric', 'between:-180,180'],
            'zoom_level' => ['nullable', 'integer', 'min:1', 'max:20'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Data tidak valid',
                'errors' => $validator->errors(),
            ], 422);
        }

        $tpu->update($validator->validated());

        ActivityLogger::log($request->user(), 'update', 'Mengubah TPU ' . $tpu->nama_tpu, ['uptd_id' => $tpu->uptd_id, 'tpu_id' => $tpu->id]);

        return response()->json([
            'message' => 'TPU berhasil diperbarui',
            'data' => $tpu,
        ]);
    }

    public function destroy(Request $request, Tpu $tpu)
    {
        $tpu->delete();

        ActivityLogger::log($request->user(), 'delete', 'Menghapus TPU ' . $tpu->nama_tpu, ['uptd_id' => $tpu->uptd_id, 'tpu_id' => $tpu->id]);

        return response()->json(['message' => 'TPU berhasil dihapus']);
    }
}
