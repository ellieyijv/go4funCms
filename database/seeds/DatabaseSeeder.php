<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        // $this->call(ProductsTableSeeder::class);
        // $this->call(SpecialDealsTableSeeder::class);
        // $this->call(PopularToursTableSeeder::class);
        // $this->call(AboutUsTableSeeder::class);
        // $this->call(CitiesTableSeeder::class);
        // $this->call(CountryTableSeeder::class);
        // $this->call(ProductProfilesTableSeeder::class);
        // $this->call(ProductCitiesTableSeeder::class);
        // $this->call(ProductCountriesTableSeeder::class);
        // $this->call(SpotsTableSeeder::class);
        $this->call(ProductSpotsTableSeeder::class);
    }
}
