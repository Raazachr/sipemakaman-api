<?php

namespace App\Http\Controllers;

use App\Models\Pemohon;
use App\Models\Uptd;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class ProfileController extends Controller
{
    // GET /api/profil
    public function show(Request $request)
    {
        return response()->json([
            'tipe_akun' => class_basename($request->user()),
            'data' => $request->user(),
        ]);
    }

    // PUT /api/profil
    public function update(Request $request)
    {
        $user = $request->user();

        $rules = [
            'email' => ['sometimes', 'email', Rule::unique($user->getTable(), 'email')->ignore($user->id)],
            'password' => ['sometimes', 'string', 'min:8'],
            'current_password' => ['required_with:password', 'string'],
        ];

        // Field yang boleh diubah beda-beda tergantung jenis akun
        if ($user instanceof Uptd) {
            $rules['nama_uptd'] = ['sometimes', 'string', 'max:255'];
            $rules['alamat'] = ['nullable', 'string'];
            $rules['no_telepon'] = ['nullable', 'string', 'max:20'];
        } elseif ($user instanceof Pemohon) {
            $rules['nama_lengkap'] = ['sometimes', 'string', 'max:255'];
            $rules['alamat'] = ['nullable', 'string'];
            $rules['no_telepon'] = ['nullable', 'string', 'max:20'];
        } else {
            // SuperAdmin & AdminTpu: nip & tpu_id tidak boleh diubah lewat sini
            $rules['nama_lengkap'] = ['sometimes', 'string', 'max:255'];
        }

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['message' => 'Data tidak valid', 'errors' => $validator->errors()], 422);
        }

        // Kalau mau ganti password, wajib verifikasi password lama dulu
        if ($request->filled('password')) {
            if (! Hash::check($request->current_password, $user->password)) {
                return response()->json(['message' => 'Password saat ini salah'], 422);
            }
        }

        $data = $validator->validated();
        unset($data['current_password']);
        if (empty($data['password'])) {
            unset($data['password']);
        }

        $user->update($data);

        return response()->json([
            'message' => 'Profil berhasil diperbarui',
            'data' => $user->fresh(),
        ]);
    }
}
