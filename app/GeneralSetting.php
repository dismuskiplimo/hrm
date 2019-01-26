<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class GeneralSetting extends Model
{
    protected $fillable = [
        'updated_by', 'company_name', 'email', 'address_one', 'address_two', 'contact_no', 'web', 'logo'
    ];
}
