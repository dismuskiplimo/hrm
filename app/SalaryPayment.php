<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SalaryPayment extends Model {
	protected $fillable = [
		'created_by', 'user_id', 'gross_salary', 'total_deduction', 'net_salary', 'provident_fund', 'payment_amount', 'payment_month', 'payment_type', 'note',
	];

	protected $dates = ['payment_month'];

	public function user(){
		return $this->belongsTo('App\User', 'user_id');
	}

	public function creator(){
		return $this->belongsTo('App\User', 'created_by');
	}
}
