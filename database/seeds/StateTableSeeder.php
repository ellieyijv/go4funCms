<?php

use Illuminate\Database\Seeder;

class StateTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('countries')->insert([
            "country" =>"亞洲"
            
        ]);

        DB::table('countries')->insert([
            "country" =>"美洲"
          
        ]);

        DB::table('countries')->insert([
            "country" =>"非洲"
          
        ]);

        DB::table('countries')->insert([
            "country" =>"澳大利亞"
          
        ]);

        DB::table('countries')->insert([
            "country" =>"歐洲"
           
        ]);
    }
}
