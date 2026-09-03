<?php

namespace App\Http\Controllers\Auth;

use App\Models\SuperAdmin;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class SuperAdminAuthController extends BaseAuthController
{
    public function login(Request $request): JsonResponse
    {
        return $this->attemptLogin($request, SuperAdmin::class);
    }
}
