<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SalaryPaymentDetails extends Model
{
    protected $fillable = [
        'salary_payment_id', 'item_name', 'amount', 'status',
    ];
}
