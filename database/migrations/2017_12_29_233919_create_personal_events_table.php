<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePersonalEventsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('personal_events', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('created_by');
            $table->string('personal_event',100);
            $table->text('personal_event_description');
            $table->date('start_date');
            $table->date('end_date');
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
        Schema::dropIfExists('personal_events');
    }
}
