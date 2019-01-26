<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAwardCategoriesTable extends Migration {
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up() {
		Schema::create('award_categories', function (Blueprint $table) {
			$table->increments('id');
			$table->integer('created_by');
			$table->string('award_title');
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
		Schema::dropIfExists('award_categories');
	}
}
