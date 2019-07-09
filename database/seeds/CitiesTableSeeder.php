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
            'countryId'=>"1"
        ],
        [
            "name" =>"珀斯",
            'countryId'=>"1"
        ],
        [
            "name" =>"阿德莱德",
            'countryId'=>"1"
        ],
        [
            "name" =>"黄金海岸",
            'countryId'=>"1"
        ],
        [
            "name" =>"凯恩斯",
            'countryId'=>"1"
        ],
        [
            "name" =>"布里斯班",
            'countryId'=>"1"
        ],
        [
            "name" =>"墨尔本",
            'countryId'=>"1"
        ]
        );
    }
}
