<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class SpotController extends Controller
{
    public function getProductSpots($product){
        $spots = Product::with('spots')->find($product);
        return $this->jsonResponse($spots);
    }
}
