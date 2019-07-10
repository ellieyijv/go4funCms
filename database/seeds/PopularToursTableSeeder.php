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
            'description' => 'first popular tour',
        ]);

        DB::table('popular_tours')->insert([
            'product_id' => 2,
            'description' => 'second popular tour',
        ]);
    }
}
