<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class KoordinatMakam extends Model
{
    protected $table = 'koordinat_makams';

    protected $fillable = [
        'makam_id',
        'latitude',
        'longitude',
    ];

    public function makam(): BelongsTo
    {
        return $this->belongsTo(Makam::class);
    }
}
