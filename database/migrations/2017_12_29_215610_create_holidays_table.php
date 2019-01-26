<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHolidaysTable extends Migration {
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up() {
		Schema::create('holidays', function (Blueprint $table) {
			$table->increments('id');
			$table->integer('created_by');
			$table->string('holiday_name');
			$table->date('date');
			$table->text('description');
			$table->tinyInteger('publication_status');
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
		Schema::dropIfExists('holidays');
	}
}
