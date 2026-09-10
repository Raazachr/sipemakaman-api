<?php

namespace App\Services;

use App\Models\ActivityLog;
use App\Models\AdminTpu;
use App\Models\SuperAdmin;
use App\Models\Tpu;
use App\Models\Uptd;
use Illuminate\Foundation\Auth\User;

class ActivityLogger
{
    /**
     * Catat aktivitas ke activity_logs.
     *
     * Scope uptd_id/tpu_id diambil otomatis dari user:
     *  - AdminTpu  -> uptd_id = UPTD TPU-nya, tpu_id = TPU-nya
     *  - AdminUptd -> uptd_id = UPTD-nya
     *  - SuperAdmin -> null (dibuat juga saat mengubah data milik wilayah tertentu)
     *
     * @param  array  $override  uptd_id / tpu_id untuk menimpa scope otomatis
     */
    public static function log($user, string $action, string $description, array $override = []): void
    {
        try {
            $scope = self::resolveScope($user, $override);

            ActivityLog::create(array_merge([
                'user_type' => $user ? class_basename($user) : null,
                'user_id' => $user?->getKey(),
                'user_name' => self::userName($user),
                'action' => $action,
                'description' => $description,
                'ip_address' => request()->ip(),
            ], $scope));
        } catch (\Throwable $e) {
            // Jangan sampai log mengganggu proses utama
        }
    }

    private static function resolveScope($user, array $override): array
    {
        if ($user instanceof AdminTpu) {
            $tpu = Tpu::find($user->tpu_id);

            return [
                'uptd_id' => $override['uptd_id'] ?? $tpu?->uptd_id,
                'tpu_id' => $override['tpu_id'] ?? $user->tpu_id,
            ];
        }

        if ($user instanceof Uptd) {
            return [
                'uptd_id' => $override['uptd_id'] ?? $user->getKey(),
                'tpu_id' => $override['tpu_id'] ?? null,
            ];
        }

        return [
            'uptd_id' => $override['uptd_id'] ?? null,
            'tpu_id' => $override['tpu_id'] ?? null,
        ];
    }

    private static function userName($user): ?string
    {
        if (! $user) {
            return null;
        }

        foreach (['nama_lengkap', 'nama_uptd', 'username', 'email'] as $field) {
            if ($user->{$field} ?? false) {
                return $user->{$field};
            }
        }

        return null;
    }
}