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
}
