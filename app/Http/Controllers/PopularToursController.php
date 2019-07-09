<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PopularTour;
use App\Models\Product;

class PopularToursController extends Controller
{
    public function index(){
        $populartours = PopularTour::get()->all();
        $dataarray = array();
        $incI = 0;
        foreach($populartours as $one) {
            $data = Product::whereId($one->product_id)->first();
            $dataarray[$incI]['title'] = $data->title;
            $dataarray[$incI]['price'] = $data->price;
            $dataarray[$incI]['days'] = $data->days;
            $dataarray[$incI]['cardimage'] =$data->cardImage;
            $incI++;
        }
   
        
        return json_encode($dataarray);
    }
}