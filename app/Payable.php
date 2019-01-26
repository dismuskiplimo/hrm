<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Payable extends Model
{
    protected $fillable = [
        'created_by', 'job_id', 'payable_amount', 'short_note', 'tax', 'tax_method' , 'tax_amount',
    ];

}
