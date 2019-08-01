<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    protected $fillable = [
        'id', 'name', 'state_id',
    ];
    
    public function state()
    {
        return $this->belongsTo(State::class);
    }

    public function products()
    {
        return $this->belongsToMany(Product::class, 'product_cities');
    }
}
