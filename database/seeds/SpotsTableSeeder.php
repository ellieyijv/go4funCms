<?php

use Illuminate\Database\Seeder;

class SpotsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      
        DB::table('spots')->insert([
            'iamge'=>'/images/popular/popular1.png',
            'name'=>"葡萄酒莊品嚐美酒",
            'status'=>"1"
        ]);

        DB::table('spots')->insert([
            'iamge'=>'/images/popular/popular2.png',
            'name'=>"巴羅莎",
            'status'=>"1"
        ]);

        DB::table('spots')->insert([
            'iamge'=>'/images/popular/popular3.png',
            'name'=>"莱特将军瞭望台",
            'status'=>"1"
        ]);

        DB::table('spots')->insert([
            'iamge'=>'/images/popular/popular4.png',
            'name'=>"戴倫堡魔方",
            'status'=>"1"
        ]);
    }
}
