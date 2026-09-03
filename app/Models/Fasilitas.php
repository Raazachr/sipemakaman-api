<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Fasilitas extends Model
{
    protected $table = 'fasilitas';

    protected $fillable = [
        'tpu_id',
        'nama_fasilitas',
        'jenis_fasilitas',
        'latitude',
        'longitude',
    ];

    public function tpu(): BelongsTo
    {
        return $this->belongsTo(Tpu::class);
    }
}
