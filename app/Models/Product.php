<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    //
    public function special_deal()
    {
    	return $this->belongsTo('App\Models\SpecialDeal');
    }

    public function popular_tour()
    {
        return $this->belongsTo('App\Models\PopularTour');
    }
}
