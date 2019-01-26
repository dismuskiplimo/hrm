<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration {
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up() {
		Schema::create('users', function (Blueprint $table) {
			$table->increments('id');
			$table->integer('created_by')->nullable();
			$table->string('employee_id')->nullable();
			$table->string('name');
			$table->string('father_name')->nullable();
			$table->string('mother_name')->nullable();
			$table->string('spouse_name')->nullable();
			$table->string('email', 100)->unique()->nullable();
			$table->string('password');
			$table->string('present_address');
			$table->string('permanent_address')->nullable();
			$table->string('home_district')->nullable();

			$table->text('academic_qualification')->nullable();
			$table->text('professional_qualification')->nullable();
			$table->date('joining_date')->nullable();
			$table->text('experience')->nullable();
			$table->text('reference')->nullable();

			$table->tinyInteger('id_name')->nullable()->comment('1 for NID, 2 Passport, 3 for Driving License');
			$table->string('id_number')->nullable();
			$table->string('contact_no_one', 30);
			$table->string('contact_no_two', 30)->nullable();
			$table->string('emergency_contact', 30)->nullable();
			$table->string('web')->nullable();
			$table->string('gender', 1);
			$table->date('date_of_birth')->nullable();
			$table->tinyInteger('marital_status')->nullable()->comment('1 for Married, Single, 3 for Divorced, 4 for Separated, 5 for Widowed');
			$table->string('avatar')->nullable();
			$table->integer('client_type_id')->nullable();
			$table->integer('designation_id')->nullable();
			$table->integer('joining_position')->nullable();
			$table->tinyInteger('access_label')->comment('1 for superadmin, 2 for associates, 3 for employees, 4 for references and 5 for clients');
			$table->string('role')->nullable();
			$table->tinyInteger('activation_status')->default(0);
			$table->tinyInteger('deletion_status')->default(0);
			$table->rememberToken();
			$table->timestamps();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down() {
		Schema::dropIfExists('users');
	}
}
