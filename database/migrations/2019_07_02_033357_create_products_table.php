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
            $table->unsignedInteger('product_code');
            $table->string('product_name');
            $table->unsignedTinyInteger('duration')->default(0);
            $table->string('product_description');
            $table->decimal('sales_price');
            $table->decimal('price');
            $table->string('price_description');
            $table->string('tour_language');
            $table->string('pick_up_service');
            $table->string('meals');
            $table->string('policy');
            $table->boolean('is_herobanner')->nullable()->default(false);
            $table->string('travel_document');
            $table->string('flyer');
            $table->string('card_image');  
            $table->text("description_image");
            $table->text("inclusion");
            $table->text("exclusion");
            $table->text("terms_conditions");
            $table->text("ltinerary");
            $table->integer("state_id");
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
