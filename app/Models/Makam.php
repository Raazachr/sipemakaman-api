<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Makam extends Model
{
    protected $fillable = [
        'blok_id',
        'kode_makam',
        'nomor_makam',
        'status',
        // FIX Fase 8: kolom ini ditambahkan migrasinya di Fase 7
        // (2024_01_03_000001_add_status_petak_to_makams_table) tapi lupa
        // dimasukkan ke $fillable, jadi mass-assignment (create/update) diam-diam
        // mengabaikannya. Ditambahkan di sini supaya AlmarhumController (Fase 8)
        // dan MakamController (Fase 7) bisa menyimpannya dengan benar.
        'status_petak',
        'keterangan',
    ];

    public function blok(): BelongsTo
    {
        return $this->belongsTo(Blok::class);
    }

    public function koordinat(): HasOne
    {
        return $this->hasOne(KoordinatMakam::class);
    }

    // Almarhum yang saat ini menempati makam ini (1 makam = 1 almarhum aktif)
    public function almarhum(): HasOne
    {
        return $this->hasOne(Almarhum::class);
    }
}
