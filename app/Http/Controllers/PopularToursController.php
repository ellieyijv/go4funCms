<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PopularTour;
use App\Models\Product;

class PopularToursController extends Controller
{
    public function index(){

        $populartours = PopularTour::with('product')->get();

        return $this->jsonResponse($populartours);
    }
}