<?php

use Illuminate\Database\Seeder;

class CitiesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('cities')->insert([
            "name" =>"悉尼",
            'country_id'=>"4"
        ]);

        DB::table('cities')->insert([
            "name" =>"珀斯",
            'country_id'=>"4"
        ]);

        DB::table('cities')->insert([
            "name" =>"阿德莱德",
            'country_id'=>"4"
        ]);

        DB::table('cities')->insert([
            "name" =>"黄金海岸",
            'country_id'=>"4"
        ]);

        DB::table('cities')->insert([
            "name" =>"凯恩斯",
            'country_id'=>"4"
        ]);

        DB::table('cities')->insert([
            "name" =>"布里斯班",
            'country_id'=>"4"
        ]);

        DB::table('cities')->insert([
            "name" =>"墨尔本",
            'country_id'=>"4"
        ]);
      
    }
}
