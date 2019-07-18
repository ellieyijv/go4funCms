<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class State extends Model
{
    public function cities()
    {
        return $this->hasMany(City::class, 'city_id');
    }

    public function products()
    {
        return $this->hasMany(Product::class);
    }
}
