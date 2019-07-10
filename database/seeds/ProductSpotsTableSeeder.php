<?php

use Illuminate\Database\Seeder;

class ProductSpotsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('product_spots')->insert([
            'product_id'=>'1',
            'spot_id'=>"4",
        ]);

        DB::table('product_spots')->insert([
            'product_id'=>'1',
            'spot_id'=>"3",
        ]);

        DB::table('product_spots')->insert([
            'product_id'=>'1',
            'spot_id'=>"2",
        ]);

        DB::table('product_spots')->insert([
            'product_id'=>'1',
            'spot_id'=>"1",
        ]);
    }
}
