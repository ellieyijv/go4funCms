<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AboutusTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('aboutus', function (Blueprint $table) {
            $table->increments('id');
            $table->text("description");
            $table->string('aboutusImg');
            $table->string('herobannerImg');
            $table->text("first_title");
            $table->text("first_description");
            $table->string('first_img_url');
            $table->text("second_title");
            $table->text("second_description");
            $table->string('second_img_url');
            $table->text("third_title");
            $table->text("third_description");
            $table->string('third_img_url');
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
        //
    }
}
