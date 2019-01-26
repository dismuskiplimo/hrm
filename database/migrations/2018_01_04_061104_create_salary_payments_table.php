<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSalaryPaymentsTable extends Migration {
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up() {
		Schema::create('salary_payments', function (Blueprint $table) {
			$table->increments('id');
			$table->integer('created_by');
			$table->integer('user_id');
			$table->string('gross_salary');
			$table->string('total_deduction');
			$table->string('net_salary');
			$table->string('provident_fund')->nullable();
			$table->string('payment_amount');
			$table->date('payment_month');
			$table->tinyInteger('payment_type')->comment('1 for cash payment, 2 for chaque payment & 3 for bank payment');
			$table->text('note')->nullable();
			$table->timestamps();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down() {
		Schema::dropIfExists('salary_payments');
	}
}
