<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SpecialDeal;
use App\Models\Product;

class SpecialDealsController extends Controller
{
    
    public function index(){
        //Illuminate/Database/QueryException with message 'SQLSTATE[42S22]: Column not found: 1054 Unknown column 'products.special_deal_id' in 'where clause' (SQL: select * from `products` where `products`.`special_deal_id` = 1 and `products`.`special_deal_id` is not null limit 1)'>>> $specialdeal = SpecialDeal::find(1)->product
        $specialdeals = SpecialDeal::get()->all();
        $dataarray = array();
        $incI = 0;
        foreach($specialdeals as $one) {
            $data = Product::whereId($one->product_id)->first();
            $dataarray[$incI]['title'] = $data->title;
            $dataarray[$incI]['subtitle'] = $data->subtitle;
            $dataarray[$incI]['price'] = $data->price;
            $dataarray[$incI]['days'] = $data->days;
            $dataarray[$incI]['cardimage'] =$data->cardImage;
            $incI++;
          
        }
        // $data = SpecialDeal::find(1)->product;
        
        return json_encode($dataarray);
    }

}
