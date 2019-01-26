<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWorkingDaysTable extends Migration {
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up() {
		Schema::create('working_days', function (Blueprint $table) {
			$table->increments('id');
			$table->integer('updated_by');
			$table->string('day', 10);
			$table->tinyInteger('working_status')->comment('0 for holiday & 1 for working day');
			$table->timestamps();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down() {
		Schema::dropIfExists('working_days');
	}
}
