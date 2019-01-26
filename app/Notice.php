<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Notice extends Model
{
    protected $fillable = [
				'created_by', 'notice_title', 'description', 'publication_status', 'deletion_status'
		];
}
