<?php

use Illuminate\Database\Seeder;

class ProductCountriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('product_countries')->insert([
            'product_id'=>'1',
            'country_id'=>"4",
        ]);

        DB::table('product_countries')->insert([
            'product_id'=>'2',
            'country_id'=>"4"
        ]); 

    }
}
