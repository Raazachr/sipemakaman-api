<?php

namespace App\Http\Controllers\Auth;

use App\Models\Pemohon;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PemohonAuthController extends BaseAuthController
{
    public function register(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'nik' => ['required', 'string', 'size:16', 'unique:pemohons,nik'],
            'nama_lengkap' => ['required', 'string', 'max:255'],
            'no_telepon' => ['nullable', 'string', 'max:20'],
            'alamat' => ['nullable', 'string'],
            'username' => ['required', 'string', 'max:255', 'unique:pemohons,username'],
            'email' => ['required', 'email', 'unique:pemohons,email'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Data tidak valid',
                'errors' => $validator->errors(),
            ], 422);
        }

        $pemohon = Pemohon::create([
            'nik' => $request->nik,
            'nama_lengkap' => $request->nama_lengkap,
            'no_telepon' => $request->no_telepon,
            'alamat' => $request->alamat,
            'username' => $request->username,
            'email' => $request->email,
            'password' => $request->password, // otomatis di-hash oleh cast 'hashed' di model
        ]);

        $token = $pemohon->createToken('api-token')->plainTextToken;

        return response()->json([
            'message' => 'Registrasi berhasil',
            'token' => $token,
            'user' => $pemohon,
        ], 201);
    }

    public function login(Request $request): JsonResponse
    {
        return $this->attemptLogin($request, Pemohon::class);
    }
}
