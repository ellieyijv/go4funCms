<?php

use Illuminate\Database\Seeder;

class ProductCitiesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      
        DB::table('product_cities')->insert([
            'product_id'=>'1',
            'city_id'=>"1",
        ]);

        DB::table('product_cities')->insert([
            'product_id'=>'1',
            'city_id'=>"2"
        ]);

        DB::table('product_cities')->insert([
            'product_id'=>'2',
            'city_id'=>"2"
        ]);

        DB::table('product_cities')->insert([
            'product_id'=>'2',
            'city_id'=>"3"
        ]);
    }
}
