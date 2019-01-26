<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAssetHistoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('asset_histories', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('asset_id');
            $table->integer('user_id');
            $table->integer('assigned_by');
            $table->text('condition_before')->nullable();
            $table->text('condition_after')->nullable();
            $table->boolean('cleared')->default(0);
            $table->integer('cleared_by')->nullable();
            $table->timestamp('cleared_at')->nullable();
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
        Schema::dropIfExists('asset_histories');
    }
}
