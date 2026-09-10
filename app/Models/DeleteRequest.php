<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\MorphTo;

class DeleteRequest extends Model
{
    protected $fillable = [
        'requestable_type',
        'requestable_id',
        'reason',
        'status',
        'requested_by_type',
        'requested_by_id',
        'reviewed_by_type',
        'reviewed_by_id',
        'review_note',
        'reviewed_at',
        'uptd_id',
        'tpu_id',
    ];

    protected $casts = [
        'reviewed_at' => 'datetime',
    ];

    public function requestable(): MorphTo
    {
        return $this->morphTo();
    }

    public function requestedBy()
    {
        return $this->morphTo('requested_by', 'requested_by_type', 'requested_by_id');
    }
}