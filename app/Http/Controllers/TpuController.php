<?php

namespace App\Http\Controllers;

use App\Models\AdminTpu;
use App\Models\Tpu;
use App\Models\Uptd;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class TpuController extends Controller
{
    // Bisa diakses SuperAdmin (lihat semua), UPTD (lihat cakupannya), AdminTpu (lihat TPU-nya sendiri)
    public function index(Request $request)
    {
        $query = Tpu::with('uptd');
        $user = $request->user();

        if ($user instanceof Uptd) {
            $query->where('uptd_id', $user->id);
        } elseif ($user instanceof AdminTpu) {
            $query->where('id', $user->tpu_id);
        }
        // Kalau SuperAdmin atau Pemohon: tidak difilter, tampil semua TPU

        $perPage = min((int) $request->input('per_page', 15), 100);

        return response()->json($query->paginate($perPage));
    }

    public function show(Request $request, Tpu $tpu)
    {
        $user = $request->user();

        // Cegah UPTD/AdminTpu mengintip TPU yang bukan cakupannya lewat akses langsung by ID
        if ($user instanceof Uptd && $tpu->uptd_id !== $user->id) {
            return response()->json(['message' => 'TPU ini bukan cakupan Anda'], 403);
        }
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

        return response()->json([
            'message' => 'TPU berhasil diperbarui',
            'data' => $tpu,
        ]);
    }

    public function destroy(Tpu $tpu)
    {
        $tpu->delete();

        return response()->json(['message' => 'TPU berhasil dihapus']);
    }
}
