<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Blok extends Model
{
    protected $fillable = [
        'tpu_id',
        'parent_blok_id',
        'kode_blok',
        'nama_blok',
        'keterangan',
        'corners',
        'status_ketersediaan',
    ];

    protected $casts = [
        // corners disimpan sbg JSON: [{"lat":..,"lng":..}, ...] -> otomatis jadi array PHP
        'corners' => 'array',
    ];

    public function tpu(): BelongsTo
    {
        return $this->belongsTo(Tpu::class);
    }

    public function makams(): HasMany
    {
        return $this->hasMany(Makam::class);
    }

    // Blok Utama dari sub-blok ini (null kalau dia sendiri Blok Utama)
    public function parentBlok(): BelongsTo
    {
        return $this->belongsTo(Blok::class, 'parent_blok_id');
    }

    // Daftar sub-blok di bawah Blok Utama ini
    public function subBloks(): HasMany
    {
        return $this->hasMany(Blok::class, 'parent_blok_id');
    }

    public function isSubBlok(): bool
    {
        return $this->parent_blok_id !== null;
    }
}
