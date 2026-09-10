<?php

namespace App\Http\Controllers;

use App\Models\AdminTpu;
use App\Services\ActivityLogger;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

// Catatan: nama class sengaja "AdminTpuManagementController" (bukan AdminTpuController)
// supaya tidak bentrok dengan model App\Models\AdminTpu di use statement/route model binding.
// Endpoint ini KHUSUS Super Admin (dibatasi lewat middleware user_type di routes/api.php)
// karena berisi data akun login (username/password) milik Admin TPU.
class AdminTpuManagementController extends Controller
{
    public function index(Request $request)
    {
        $perPage = min((int) $request->input('per_page', 15), 100);

        return response()->json(
            AdminTpu::with('tpu')->paginate($perPage)
        );
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'tpu_id' => ['required', 'exists:tpus,id'],
            'nip' => ['required', 'string', 'unique:admin_tpus,nip'],
            'nama_lengkap' => ['required', 'string', 'max:255'],
            'username' => ['required', 'string', 'unique:admin_tpus,username'],
            'email' => ['required', 'email', 'unique:admin_tpus,email'],
            'password' => ['required', 'string', 'min:8'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Data tidak valid',
                'errors' => $validator->errors(),
            ], 422);
        }

        $adminTpu = AdminTpu::create($validator->validated());

        ActivityLogger::log($request->user(), 'create', 'Menambah Admin TPU ' . $adminTpu->nama_lengkap, ['tpu_id' => $adminTpu->tpu_id]);

        return response()->json([
            'message' => 'Admin TPU berhasil ditambahkan',
            'data' => $adminTpu->load('tpu'),
        ], 201);
    }

    public function show(AdminTpu $adminTpu)
    {
        return response()->json($adminTpu->load('tpu'));
    }

    public function update(Request $request, AdminTpu $adminTpu)
    {
        $validator = Validator::make($request->all(), [
            'tpu_id' => ['sometimes', 'required', 'exists:tpus,id'],
            'nip' => ['sometimes', 'required', 'string', 'unique:admin_tpus,nip,' . $adminTpu->id],
            'nama_lengkap' => ['sometimes', 'required', 'string', 'max:255'],
            'username' => ['sometimes', 'required', 'string', 'unique:admin_tpus,username,' . $adminTpu->id],
            'email' => ['sometimes', 'required', 'email', 'unique:admin_tpus,email,' . $adminTpu->id],
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

        $adminTpu->update($data);

        ActivityLogger::log($request->user(), 'update', 'Mengubah Admin TPU ' . $adminTpu->nama_lengkap, ['tpu_id' => $adminTpu->tpu_id]);

        return response()->json([
            'message' => 'Admin TPU berhasil diperbarui',
            'data' => $adminTpu->load('tpu'),
        ]);
    }

    public function destroy(Request $request, AdminTpu $adminTpu)
    {
        $adminTpu->delete();

        ActivityLogger::log($request->user(), 'delete', 'Menghapus Admin TPU ' . $adminTpu->nama_lengkap, ['tpu_id' => $adminTpu->tpu_id]);

        return response()->json(['message' => 'Admin TPU berhasil dihapus']);
    }
}
