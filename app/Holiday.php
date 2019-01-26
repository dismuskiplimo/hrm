<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Holiday extends Model {
	protected $fillable = [
		'created_by', 'holiday_name', 'date', 'publication_status', 'description', 'deletion_status',
	];
}
