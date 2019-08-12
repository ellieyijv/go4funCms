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

    public function hero_banner(){
        return $this->hasOne(HeroBanner::class);
    }

    public function cities()
    {  
        return $this->belongsToMany(City::class, 'product_cities');   
    }

    public function state()
    {
        return $this->belongsTo(State::class);   
    }

    public function spots()
    {
        return $this->belongsToMany(Spot::class, 'product_spots');   
    }

    public function recommends(){
        $recommends = $this->belongsToMany(Product::class, 'product_recommends', 'product_id', 'recommend_id');
        return $recommends;
    }

    
}
