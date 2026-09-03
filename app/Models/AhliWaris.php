<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class AhliWaris extends Model
{
    protected $table = 'ahli_waris';

    protected $fillable = [
        'almarhum_id',
        'nama_lengkap',
        'hubungan',
        'alamat',
        'alamat_jalan',
        'no_rumah',
        'rt',
        'rw',
        'kelurahan',
        'kecamatan',
        'kota_kabupaten',
        'provinsi',
        'no_telepon',
    ];

    public function almarhum(): BelongsTo
    {
        return $this->belongsTo(Almarhum::class);
    }
}
