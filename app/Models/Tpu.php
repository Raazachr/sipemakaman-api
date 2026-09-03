<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Tpu extends Model
{
    protected $fillable = [
        'uptd_id',
        'kode_tpu',
        'nama_tpu',
        'alamat',
        'kelurahan',
        'kecamatan',
        'kota',
        'provinsi',
        'status',
        'center_lat',
        'center_lng',
        'zoom_level',
    ];

    public function uptd(): BelongsTo
    {
        return $this->belongsTo(Uptd::class);
    }

    public function admins(): HasMany
    {
        return $this->hasMany(AdminTpu::class);
    }

    public function bloks(): HasMany
    {
        return $this->hasMany(Blok::class);
    }

    public function pengajuans(): HasMany
    {
        return $this->hasMany(Pengajuan::class);
    }

    public function fasilitas(): HasMany
    {
        return $this->hasMany(Fasilitas::class);
    }

    // Ambil semua makam yang ada di TPU ini (lewat relasi bloks)
    public function makams()
    {
        return $this->hasManyThrough(Makam::class, Blok::class);
    }
}
