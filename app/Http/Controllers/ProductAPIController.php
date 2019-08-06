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

        $specialdeals = SpecialDeal::with(['product' => function($q){
            $q->with(['state']);
        }])->get();
        return $this->jsonResponse($specialdeals);
    }

    public function popularTours(){

        $populartours = PopularTour::with('product.state')->get();
        return $this->jsonResponse($populartours);
    }

    public function getProductWithDetails($product_code){
        $product_details = Product::with('spots','state', 'recommends')->where('product_code', '=', $product_code)->first();
        return $this->jsonResponse($product_details);
    }


    public function getProductByTerm(Request $request){
        $term = $request->input('term');
        $recommendProduct = Product::with('state')->where(function($q) use ($term){
            $q->where('product_code','like', "%$term%")
              ->orWhere('product_name', 'like', "%$term%");
        })
        ->get();
        return $this->jsonResponse($recommendProduct);
    }

    public function getStateProducts($slug){
        $item = State::where('slug','=', $slug)->first();
        if(is_null($item)){
            $error= ["error"=> "Resource not found"];
            return $this->jsonResponse($error);
        }else{
            $id = $item->id;
            $stateProducts = State::findOrFail($id)->products;
            // $paginationProducts = $this->paginateWithoutKey($stateProducts, $perPage = 9, $page=$page_id, $options = []);
            // return $this->jsonResponse($paginationProducts);
            return $this->jsonResponse($stateProducts);
        }
    
    }

    public function getCitiesProducts($city_id, Request $request){
        $sort = $request->input('sort');
        $desc = $request->input('desc');
        
        $cityProducts = Product::whereHas('cities',function($q) use ($city_id){
            $q->where('cities.id',$city_id);
        });
        
        if($sort){
            $cityProducts =$cityProducts->orderBy($sort,$desc)->get(['id','duration']);
        }else{
            $cityProducts =$cityProducts->get();
        }

        return $this->jsonResponse($cityProducts);
    }

    public function getHeroBannerProducts(){
        $records = Product::with('state')->where('is_hero_banner', '=', '1')->get();
        $total = count($records);
        return $this->jsonResponse(['records'=>$records, 'total'=>$total] );
    }
}
