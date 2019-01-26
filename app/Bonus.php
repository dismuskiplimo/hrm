<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bonus extends Model
{
    protected $fillable = [
        'created_by', 'user_id', 'bonus_name', 'bonus_month', 'bonus_amount', 'bonus_description', 'deletion_status'
    ];
}
