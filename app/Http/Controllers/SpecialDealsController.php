<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SpecialDeal;
use App\Models\Product;

class SpecialDealsController extends Controller
{
    
    public function index(){

        $specialdeals = SpecialDeal::with('product')->get();
        return $this->jsonResponse($specialdeals);
        }
}
