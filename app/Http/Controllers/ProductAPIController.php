<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SpecialDeal;
use App\Models\Product;
use App\Models\PopularTour;
use App\Models\State;
use App\Models\City;

class ProductAPIController extends Controller
{
    public function specialDeals(){

        $specialdeals = SpecialDeal::with('product')->get();
        return $this->jsonResponse($specialdeals);
    }

    public function popularTours(){

        $populartours = PopularTour::with('product')->get();

        return $this->jsonResponse($populartours);
    }

    public function getProductSpots($product){
        $spots = Product::with('spots')->find($product);
        return $this->jsonResponse($spots);
    }

    public function getProductRecommends($product_id){

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

    public function getStateProducts($state_id){
        $stateProducts = State::findorFail($state_id)->products;
        // $paginationProducts = $this->paginateWithoutKey($stateProducts, $perPage = 9, $page=$page_id, $options = []);
        // return $this->jsonResponse($paginationProducts);
        return $this->jsonResponse($stateProducts);
    }

    public function getCitiesProducts($city_id){
        $cityProducts = City::find($city_id)->products;
        return $this->jsonResponse($cityProducts);
    }
 
}
