<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePayrollsTable extends Migration {
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up() {
		Schema::create('payrolls', function (Blueprint $table) {
			$table->increments('id');
			$table->integer('created_by');
			$table->integer('user_id');
			$table->tinyInteger('employee_type')->comment('1 for Provision & 2 for Permanent');
			$table->string('basic_salary')->nullable();
			$table->string('house_rent_allowance')->nullable();
			$table->string('medical_allowance')->nullable();
			$table->string('special_allowance')->nullable();
			$table->string('provident_fund_contribution')->nullable();
			$table->string('other_allowance')->nullable();
			$table->string('tax_deduction')->nullable();
			$table->string('provident_fund_deduction')->nullable();
			$table->string('other_deduction')->nullable();
			$table->tinyInteger('activation_status')->default(0);
			$table->timestamps();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down() {
		Schema::dropIfExists('payrolls');
	}
}
