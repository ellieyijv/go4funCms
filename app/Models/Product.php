<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class Product extends Model
{
    
    public function special_deal()
    {
    	return $this->hasOne(SpecialDeal::class);
    }

    public function popular_tour()
    {
        return $this->hasOne(PopularTour::class);
    }

    public function profile()
    {
        return $this->hasOne(ProductProfile::class);
    }

    public function cities()
    {  
        return $this->belongsToMany(City::class, 'product_cities');   
    }

    public function countries()
    {
        return $this->belongsToMany(Country::class, 'product_countries');   
    }

    public function spots()
    {
        return $this->belongsToMany(Spot::class, 'product_spots');   
    }
}
