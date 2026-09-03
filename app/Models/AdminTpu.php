<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class AdminTpu extends Authenticatable
{
    use HasApiTokens, Notifiable;

    protected $fillable = [
        'tpu_id',
        'nip',
        'username',
        'password',
        'nama_lengkap',
        'email',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'password' => 'hashed',
    ];

    // Satu Admin TPU mengelola satu TPU
    public function tpu(): BelongsTo
    {
        return $this->belongsTo(Tpu::class);
    }

    // Riwayat pengajuan yang pernah diverifikasi admin ini
    public function pengajuanDiverifikasi(): HasMany
    {
        return $this->hasMany(Pengajuan::class);
    }
}
