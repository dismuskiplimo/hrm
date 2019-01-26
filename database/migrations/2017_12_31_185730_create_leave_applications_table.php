<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLeaveApplicationsTable extends Migration {
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up() {
		Schema::create('leave_applications', function (Blueprint $table) {
			$table->increments('id');
			$table->integer('created_by');
			$table->integer('leave_category_id');
			$table->date('start_date');
			$table->date('end_date');
			$table->text('reason');
			$table->tinyInteger('publication_status')->default(0);
			$table->tinyInteger('deletion_status')->default(0);

			$table->integer('recommender_id')->nullable();
			$table->boolean('recommended')->nullable();
			$table->text('recommender_message')->nullable();
			$table->timestamps();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down() {
		Schema::dropIfExists('leave_applications');
	}
}
