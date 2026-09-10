<?php

namespace App\Http\Controllers;

use App\Models\Uptd;
use App\Services\ActivityLogger;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class UptdController extends Controller
{
    // Semua UPTD, sekalian hitung berapa TPU yang dibawahi masing-masing
    public function index(Request $request)
    {
        $perPage = min((int) $request->input('per_page', 15), 100);

        return response()->json(
            Uptd::withCount('tpus')->paginate($perPage)
        );
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nip' => ['required', 'string', 'unique:uptds,nip'],
            'nama_uptd' => ['required', 'string', 'max:255'],
            'alamat' => ['nullable', 'string'],
            'no_telepon' => ['nullable', 'string', 'max:20'],
            'username' => ['required', 'string', 'unique:uptds,username'],
            'email' => ['required', 'email', 'unique:uptds,email'],
            'password' => ['required', 'string', 'min:8'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Data tidak valid',
                'errors' => $validator->errors(),
            ], 422);
        }

        $uptd = Uptd::create($validator->validated());

        ActivityLogger::log($request->user(), 'create', 'Menambah UPTD ' . $uptd->nama_uptd, ['uptd_id' => $uptd->id]);

        return response()->json([
            'message' => 'UPTD berhasil ditambahkan',
            'data' => $uptd,
        ], 201);
    }

    // Laravel otomatis mencarikan Uptd berdasarkan {uptd} di URL (route model binding)
    public function show(Uptd $uptd)
    {
        return response()->json($uptd->load('tpus'));
    }

    public function update(Request $request, Uptd $uptd)
    {
        $validator = Validator::make($request->all(), [
            'nip' => ['sometimes', 'required', 'string', 'unique:uptds,nip,' . $uptd->id],
            'nama_uptd' => ['sometimes', 'required', 'string', 'max:255'],
            'alamat' => ['nullable', 'string'],
            'no_telepon' => ['nullable', 'string', 'max:20'],
            'username' => ['sometimes', 'required', 'string', 'unique:uptds,username,' . $uptd->id],
            'email' => ['sometimes', 'required', 'email', 'unique:uptds,email,' . $uptd->id],
            'password' => ['nullable', 'string', 'min:8'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Data tidak valid',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = $validator->validated();

        // Kalau password tidak diisi saat update, jangan diubah
        if (empty($data['password'])) {
            unset($data['password']);
        }

        $uptd->update($data);

        ActivityLogger::log($request->user(), 'update', 'Mengubah UPTD ' . $uptd->nama_uptd, ['uptd_id' => $uptd->id]);

        return response()->json([
            'message' => 'UPTD berhasil diperbarui',
            'data' => $uptd,
        ]);
    }

    public function destroy(Request $request, Uptd $uptd)
    {
        $uptd->delete();

        ActivityLogger::log($request->user(), 'delete', 'Menghapus UPTD ' . $uptd->nama_uptd, ['uptd_id' => $uptd->id]);

        return response()->json(['message' => 'UPTD berhasil dihapus']);
    }
}
