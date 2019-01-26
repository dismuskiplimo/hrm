<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Zizaco\Entrust\Traits\EntrustUserTrait;

class User extends Authenticatable {

	use Notifiable;
	use EntrustUserTrait;

	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = [
		'created_by', 'employee_id', 'name', 'father_name', 'mother_name', 'spouse_name', 'email', 'password', 'present_address', 'permanent_address', 'home_district', 'id_name', 'id_number', 'contact_no_one', 'contact_no_two', 'emergency_contact', 'web', 'gender', 'date_of_birth', 'marital_status', 'avatar', 'client_type_id', 'designation_id', 'access_label', 'joining_position', 'activation_status', 'academic_qualification', 'professional_qualification', 'experience', 'reference', 'joining_date', 'deletion_status', 'role',
	];

	/**
	 * The attributes that should be hidden for arrays.
	 *
	 * @var array
	 */
	protected $hidden = [
		'password', 'remember_token',
	];

	public function assets(){
		return $this->hasMany('App\Asset', 'assigned_to');
	}

	public function payroll(){
		return $this->hasOne('App\Payroll', 'user_id');
	}

	public function salary_payments(){
		return $this->hasMany('App\SalaryPayment', 'user_id');
	}

	public function designation(){
		return $this->belongsTo('App\Designation', 'designation_id');
	}

	public function annual_leaves(){
		return $this->hasMany('App\AnnualLeave', 'user_id');
	}

	public function leave_applications(){
		return $this->hasMany('App\LeaveApplication', 'created_by');
	}

	public function recommendations(){
		return $this->hasMany('App\LeaveApplication', 'recommender_id');
	}

}
