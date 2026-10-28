<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class MakamKapasitas extends Model
{
    protected $table = 'makam_kapasitas';

    protected $fillable = [
        'tpu_id',
        'jumlah',
        'keterangan',
    ];

    protected $casts = [
        'jumlah' => 'integer',
    ];

    public function tpu(): BelongsTo
    {
        return $this->belongsTo(Tpu::class);
    }
}
