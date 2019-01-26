<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExpenceManagementsTable extends Migration {
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up() {
		Schema::create('expence_managements', function (Blueprint $table) {
			$table->increments('id');
			$table->integer('created_by');
			$table->integer('employee_id');
			$table->string('item_name');
			$table->string('purchased_from');
			$table->date('purchased_date');
			$table->integer('amount_spent');
			$table->text('purchased_details');
			$table->tinyInteger('deletion_status')->default(0);
			$table->timestamps();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down() {
		Schema::dropIfExists('expence_managements');
	}
}
