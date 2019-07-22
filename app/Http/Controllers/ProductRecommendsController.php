<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class ProductRecommendsController extends Controller
{
    public function index($product_id){

        $recommends = Product::with('recommends')->find($product_id)->recommends->all();

        return $this->jsonResponse($recommends);
    }

    public function getProductByTerm(Request $request){
        $term = $request->input('term');
        $recommendProduct = Product::where(function($q) use ($term){
            $q->where('product_code','like', "%$term%")
              ->orWhere('product_name', 'like', "%$term%");
        })
        ->get();
        return $this->jsonResponse($recommendProduct);
    }


}
