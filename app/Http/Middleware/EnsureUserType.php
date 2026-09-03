<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class EnsureUserType
{
    /**
     * Contoh pemakaian di route:
     *   Route::middleware(['auth:sanctum', 'user_type:SuperAdmin'])->...
     *   Route::middleware(['auth:sanctum', 'user_type:SuperAdmin,AdminTpu'])->...
     */
    public function handle(Request $request, Closure $next, string ...$allowedTypes): Response
    {
        $user = $request->user();

        if (! $user) {
            return response()->json(['message' => 'Unauthenticated.'], 401);
        }

        $userType = class_basename($user); // contoh: "SuperAdmin", "AdminTpu", dst.

        if (! in_array($userType, $allowedTypes)) {
            return response()->json([
                'message' => 'Anda (' . $userType . ') tidak memiliki akses untuk aksi ini.',
            ], 403);
        }

        return $next($request);
    }
}
