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
            'description' => "description for go4fun",
            'special_price' => "special_price for go4fun",
            'rebate' => "rebate for go4fun",
            'fee_description' => "fee_description for go4fun",
            'days_plan' => "days_plan go4fun",  
            // 'popular_tour_id' => '1',
            // 'special_deal_id' => 1 
        ]);

        DB::table('products')->insert([
            'title' => "2travel for Sydney",
            'subtitle' => "2subtitle for go4fun",
            'price' => 1330,
            'days' => "2days for go4fun", 
            'cardImage' => "2cardImage",
            'description' => "description for go4fun",
            'special_price' => "special_price for go4fun",
            'rebate' => "rebate for go4fun",
            'fee_description' => "fee_description for go4fun",
            'days_plan' => "days_plan go4fun",  
        ]);
    }
}
