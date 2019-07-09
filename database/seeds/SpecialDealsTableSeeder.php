<?php

use Illuminate\Database\Seeder;

class SpecialDealsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('special_deals')->insert([
            'product_id' => 1,
        ]);

        DB::table('special_deals')->insert([
            'product_id' => 2
        ]);
    }
}
