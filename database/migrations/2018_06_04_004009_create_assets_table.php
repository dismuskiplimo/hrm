<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAssetsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('assets', function (Blueprint $table) {
            $table->increments('id');
            $table->string('asset_type')->nullable();
            $table->string('brand')->nullable();
            $table->string('model')->nullable();
            $table->string('serial_number')->nullable();
            $table->text('description')->nullable();
            
            $table->boolean('assigned')->default(0);
            $table->integer('assigned_to')->nullable();
            $table->integer('assigned_by')->nullable();
            $table->timestamp('assigned_at')->nullable();
            
            $table->boolean('disposed')->default(0);
            $table->integer('disposed_by')->nullable();
            $table->text('disposed_reason')->nullable();

            $table->boolean('deletion_status')->default(0);
            $table->integer('created_by')->default(0);
            $table->integer('previous_id')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('assets');
    }
}
