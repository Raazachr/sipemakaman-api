<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Pengajuan extends Model
{
    protected $fillable = [
        'kode_pengajuan',
        'pemohon_id',
        'tpu_id',
        'almarhum_id',
        'admin_tpu_id',
        'status',
        'catatan_verifikasi',
        'tanggal_pengajuan',
        'tanggal_verifikasi',
    ];

    protected $casts = [
        'tanggal_pengajuan' => 'datetime',
        'tanggal_verifikasi' => 'datetime',
    ];

    public function pemohon(): BelongsTo
    {
        return $this->belongsTo(Pemohon::class);
    }

    public function tpu(): BelongsTo
    {
        return $this->belongsTo(Tpu::class);
    }

    public function almarhum(): BelongsTo
    {
        return $this->belongsTo(Almarhum::class);
    }

    public function adminTpu(): BelongsTo
    {
        return $this->belongsTo(AdminTpu::class);
    }
}
