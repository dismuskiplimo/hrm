<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Department extends Model
{
    protected $fillable = [
        'created_by', 'department', 'publication_status', 'department_description'
    ];
}
