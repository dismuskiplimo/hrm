<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ExpenceManagement extends Model {
	protected $fillable = [
		'created_by', 'employee_id', 'opening_blance', 'recovery_amount_on_cash', 'recovery_amount_by_cheque', 'bank_deposit_amount', 'expenses_amount', 'balance_amount', 'remarks_if_any', 'deletion_status',
	];
}
