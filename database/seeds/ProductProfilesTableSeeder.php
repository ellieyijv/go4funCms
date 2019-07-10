<?php

use Illuminate\Database\Seeder;

class ProductProfilesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('product_profiles')->insert([
            'product_id' => 1,
            'description' => "description for go4fun",
            'special_price' => "special_price for go4fun",
            'rebate' => "rebate for go4fun",
            'fee_description' => "fee_description for go4fun",
            'days_plan' => "days_plan go4fun",   
     
        ]);

        DB::table('product_profiles')->insert([
            'product_id' => 2,
            'description' => "2description for go4fun",
            'special_price' => "2special_price for go4fun",
            'rebate' => "2rebate for go4fun",
            'fee_description' => "2fee_description for go4fun",
            'days_plan' => "2days_plan go4fun",          
        ]);
    }
}
