<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class LeaveCategory extends Model
{
    protected $fillable = [
        'created_by', 'leave_category', 'publication_status', 'leave_category_description'
    ];
}
