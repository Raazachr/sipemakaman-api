<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\AdminTpu;
use App\Models\SuperAdmin;
use App\Models\Uptd;
use App\Services\ActivityLogger;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class NipAuthController extends Controller
{
    /**
     * Login terpadu 3 role admin (SuperAdmin / AdminUptd / AdminTPU)
     * memakai NIP + password. Role dideteksi otomatis dari tabel mana
     * NIP ditemukan.
     */
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nip' => ['required', 'string'],
            'password' => ['required', 'string'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Data tidak valid',
                'errors' => $validator->errors(),
            ], 422);
        }

        $user = null;
        $role = null;

        foreach (['SuperAdmin', 'Uptd', 'AdminTpu'] as $candidate) {
            $model = match ($candidate) {
                'SuperAdmin' => SuperAdmin::class,
                'Uptd' => Uptd::class,
                'AdminTpu' => AdminTpu::class,
            };

            $found = $model::where('nip', $request->nip)->first();

            if ($found) {
                if (! Hash::check($request->password, $found->password)) {
                    return response()->json(['message' => 'NIP atau password salah'], 401);
                }

                $user = $found;
                $role = $candidate;
                break;
            }
        }

        if (! $user) {
            return response()->json(['message' => 'NIP tidak ditemukan'], 401);
        }

        $user->tokens()->delete();

        $token = $user->createToken('api-token')->plainTextToken;

        ActivityLogger::log($user, 'login', 'Login ke sistem');

        return response()->json([
            'message' => 'Login berhasil',
            'token' => $token,
            'tipe_akun' => $role,
            'role' => $role,
            'user' => $user,
        ]);
    }
}