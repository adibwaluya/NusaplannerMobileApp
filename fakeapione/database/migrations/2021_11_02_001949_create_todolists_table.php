<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTodolistsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('todolists', function (Blueprint $table) {
            $table->id('id');
            $table->unsignedBigInteger('user_id')->index();
            $table->integer('planning_language_one');
            $table->integer('planning_language_two');
            $table->integer('planning_language_three');
            $table->integer('planning_document_one');
            $table->integer('planning_document_two');
            $table->integer('planning_document_three');
            $table->integer('planning_bankAccount_one');
            $table->integer('planning_visa_one');
            $table->integer('planning_visa_two');
            $table->integer('planning_anp_one');
            $table->integer('planning_anp_two');
            $table->integer('planning_departure_one');
            $table->integer('planning_departure_two');
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('todolists');
    }
}
