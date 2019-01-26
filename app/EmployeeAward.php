<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EmployeeAward extends Model
{
    protected $fillable = [
			'created_by', 'employee_id', 'award_category_id', 'gift_item',  'select_month', 'description', 'publication_status', 'deletion_status',

		];
}
