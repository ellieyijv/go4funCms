<?php

use Illuminate\Database\Seeder;

class PopularToursTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('popular_tours')->insert([
            'product_id' => 1,
        ]);

        DB::table('popular_tours')->insert([
            'product_id' => 2
        ]);
    }
}
