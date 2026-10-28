<?php

namespace App\Http\Controllers;

use App\Models\AdminTpu;
use App\Models\MakamKapasitas;
use App\Services\ActivityLogger;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class MakamKapasitasController extends Controller
{
    /**
     * GET /api/makam-kapasitas
     *
     * Daftar angka kapasitas makam per TPU. Satu TPU = satu baris.
     * AdminTpu hanya melihat baris TPU-nya sendiri.
     */
    public function index(Request $request)
    {
        $query = MakamKapasitas::with('tpu');
        $user = $request->user();

        if ($user instanceof AdminTpu) {
            $query->where('tpu_id', $user->tpu_id);
        }

        $data = $query->get()->sortBy(
            fn ($row) => $row->tpu->nama_tpu ?? '',
            SORT_NATURAL | SORT_FLAG_CASE
        )->values();

        return response()->json([
            'data' => $data,
            'total_kapasitas' => (int) $data->sum('jumlah'),
        ]);
    }

    /**
     * POST /api/makam-kapasitas
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'tpu_id' => ['required', 'integer', 'exists:tpus,id', 'unique:makam_kapasitas,tpu_id'],
            'jumlah' => ['required', 'integer', 'min:0', 'max:1000000'],
            'keterangan' => ['nullable', 'string', 'max:255'],
        ], [
            'tpu_id.unique' => 'TPU ini sudah punya angka kapasitas. Gunakan tombol Edit untuk mengubahnya.',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first(), 'errors' => $validator->errors()], 422);
        }

        $kapasitas = MakamKapasitas::create($validator->validated());

        ActivityLogger::log($request->user(), 'create', 'Menambah kapasitas makam TPU ' . $kapasitas->tpu_id . ' = ' . $kapasitas->jumlah);

        return response()->json([
            'message' => 'Kapasitas makam berhasil ditambahkan',
            'data' => $kapasitas->load('tpu'),
        ], 201);
    }

    /**
     * PUT /api/makam-kapasitas/{id}
     */
    public function update(Request $request, MakamKapasitas $makamKapasitas)
    {
        $validator = Validator::make($request->all(), [
            'jumlah' => ['required', 'integer', 'min:0', 'max:1000000'],
            'keterangan' => ['nullable', 'string', 'max:255'],
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first(), 'errors' => $validator->errors()], 422);
        }

        $makamKapasitas->update($validator->validated());

        ActivityLogger::log($request->user(), 'update', 'Mengubah kapasitas makam TPU ' . $makamKapasitas->tpu_id . ' = ' . $makamKapasitas->jumlah);

        return response()->json([
            'message' => 'Kapasitas makam berhasil diperbarui',
            'data' => $makamKapasitas->load('tpu'),
        ]);
    }

    /**
     * DELETE /api/makam-kapasitas/{id}
     */
    public function destroy(Request $request, MakamKapasitas $makamKapasitas)
    {
        $tpuId = $makamKapasitas->tpu_id;
        $makamKapasitas->delete();

        ActivityLogger::log($request->user(), 'delete', 'Menghapus kapasitas makam TPU ' . $tpuId);

        return response()->json(['message' => 'Kapasitas makam berhasil dihapus']);
    }
}
