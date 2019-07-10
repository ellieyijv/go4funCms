<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Country;

class CountryController extends Controller
{
    public function index($country){
        $cities = Country::with('cities')->find($country);
        return $this->jsonResponse($cities);
    }


    public function getCountryProducts($country){
        $products = Country::with('products')->find($country);
        return $this->jsonResponse($products);
    }
}
