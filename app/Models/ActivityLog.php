<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ActivityLog extends Model
{
    protected $fillable = [
        'user_type',
        'user_id',
        'user_name',
        'action',
        'model',
        'model_id',
        'description',
        'uptd_id',
        'tpu_id',
        'ip_address',
    ];
}