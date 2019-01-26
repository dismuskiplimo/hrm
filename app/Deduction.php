<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Deduction extends Model
{
    protected $fillable = [
        'created_by', 'user_id', 'deduction_name', 'deduction_month', 'deduction_amount', 'deduction_description', 'deletion_status'
    ];
}
