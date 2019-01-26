<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEmployeeAwardsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('employee_awards', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('created_by');
            $table->integer('employee_id');
            $table->integer('award_category_id');
      			$table->string('gift_item')->nullable();
            $table->date('select_month');
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
    public function down()
    {
        Schema::dropIfExists('employee_awards');
    }
}
