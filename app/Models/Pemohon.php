<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Pemohon extends Authenticatable
{
    use HasApiTokens, Notifiable;

    protected $fillable = [
        'nik',
        'nama_lengkap',
        'no_telepon',
        'alamat',
        'username',
        'password',
        'email',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'password' => 'hashed',
    ];

    // Satu pemohon bisa mengajukan banyak pemakaman
    public function pengajuans(): HasMany
    {
        return $this->hasMany(Pengajuan::class);
    }
}
