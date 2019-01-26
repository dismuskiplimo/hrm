<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class LeaveApplication extends Model {
	protected $fillable = [
		'created_by', 'leave_category_id', 'start_date', 'end_date','last_leave_date', 'last_leave_period', 'last_leave_category_id', 'leave_address', 'during_leave', 'reason', 'publication_status', 'deletion_status',
	];

	public function user(){
		return $this->belongsTo('App\User', 'created_by');
	}

	public function leave_category(){
		return $this->belongsTo('App\LeaveCategory', 'leave_category_id');
	}

	public function recommender(){
		return $this->belongsTo('App\User', 'recommender_id');
	}

}
