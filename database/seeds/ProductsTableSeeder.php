<?php

use Illuminate\Database\Seeder;

class ProductsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('products')->insert([
            'title' => "travel for Sydney",
            'subtitle' => "subtitle for go4fun",
            'price' => 2330,
            'days' => "days for go4fun",
         
            'cardImage' => "cardImage",
         
            // 'popular_tour_id' => '1',
            // 'special_deal_id' => 1 
        ]);

        DB::table('products')->insert([
            'title' => "2travel for Sydney",
            'subtitle' => "2subtitle for go4fun",
            'price' => 1330,
            'days' => "2days for go4fun",
          
            'cardImage' => "2cardImage",
          
            // 'popular_tour_id' => '2',
            // 'special_deal_id' => 2  
            
        ]);
    }
}
