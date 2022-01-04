<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id('id');
            $table->string('name');
            $table->string('email')->unique();
            //$table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            //$table->rememberToken();
            // $table->integer('is_splash_one');
            $table->integer('is_splash_two');
            $table->integer('is_splash_three');
            $table->integer('is_splash_four');
            $table->integer('is_splash_five');
            $table->integer('is_splash_six');
            $table->string('date_start');
            $table->string('date_end');
            $table->timestamps();
            /* Create new columns to check onboarding screens */
            /* Property for end date */
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
