<?php

namespace App\Http\Controllers\Auth;

use App\Models\AdminTpu;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class AdminTpuAuthController extends BaseAuthController
{
    public function login(Request $request): JsonResponse
    {
        return $this->attemptLogin($request, AdminTpu::class);
    }
}
