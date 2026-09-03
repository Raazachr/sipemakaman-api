<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Almarhum extends Model
{
    protected $fillable = [
        'makam_id',
        'no_registrasi',
        'nik',
        'nama_lengkap',
        'bin_binti',
        'jenis_kelamin',
        'tanggal_lahir',
        'tanggal_wafat',
        'tanggal_dimakamkan',
        'agama',
        'alamat',
        'alamat_jalan',
        'no_rumah',
        'rt',
        'rw',
        'kelurahan',
        'kecamatan',
        'kota_kabupaten',
        'provinsi',
    ];

    protected $casts = [
        'tanggal_lahir' => 'date',
        'tanggal_wafat' => 'date',
        'tanggal_dimakamkan' => 'date',
    ];

    public function makam(): BelongsTo
    {
        return $this->belongsTo(Makam::class);
    }

    public function ahliWaris(): HasMany
    {
        return $this->hasMany(AhliWaris::class);
    }

    public function pengajuans(): HasMany
    {
        return $this->hasMany(Pengajuan::class);
    }
}
