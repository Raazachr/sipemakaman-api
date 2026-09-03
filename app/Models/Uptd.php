<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Uptd extends Authenticatable
{
    use HasApiTokens, Notifiable;

    protected $fillable = [
        'nip',
        'nama_uptd',
        'alamat',
        'no_telepon',
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

    // Satu UPTD membawahi banyak TPU
    public function tpus(): HasMany
    {
        return $this->hasMany(Tpu::class);
    }
}
