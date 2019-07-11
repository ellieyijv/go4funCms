<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title');
            $table->string('subtitle');
            $table->decimal('price');
            $table->string('days');
            $table->string('cardImage');  
            $table->text('description');
            $table->string('special_price');
            $table->string('rebate');
            $table->text('fee_description');
            $table->text('days_plan');    
            // $table->unsignedInteger('popular_tour_id');
            // $table->unsignedInteger('special_deal_id');
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
        Schema::dropIfExists('products');
    }
}
