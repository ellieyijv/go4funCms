<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SpecialDeal;
use App\Models\Product;
use App\Models\PopularTour;
use App\Models\State;
use App\Models\City;
use App\Models\HeroBanner;

class ProductAPIController extends Controller
{
    public function specialDeals(){

        $special_deals = SpecialDeal::with(['product' => function($q){
            $q->with(['state']);
        }])->get();
        if(!$special_deals){
            $msg = ["error"=> "special_deals not found"];
            return $this->jsonResponse($msg);
        }else{
            return $this->jsonResponse($special_deals);
        }
    }

    public function popularTours(){

        $popular_tours = PopularTour::with('product.state')->get();
        if(!$popular_tours){
            $msg = ["error"=> "popular_tours not found"];
            return $this->jsonResponse($msg);
        }else{
            return $this->jsonResponse($popular_tours);
        }
    }

    public function getProductWithDetails($product_code){
        $product_details = Product::with('spots','state', 'recommends')->where('product_code', '=', $product_code)->first();
        if(!$product_details){
            $msg = ["error"=> "product_details not found"];
            return $this->jsonResponse($msg);
        }else{
            return $this->jsonResponse($product_details);
        }    
    
    }


    public function getProductByTerm(Request $request){
        $term = $request->input('term');
        $recommend_product = Product::with('state')->where(function($q) use ($term){
            $q->where('product_code','like', "%$term%")
              ->orWhere('product_name', 'like', "%$term%");
        })
        ->get();
        if(!$recommend_product){
            $msg = ["error"=> "recommend_product not found"];
            return $this->jsonResponse($msg);
        }else{
            return $this->jsonResponse($recommend_product);
        }        
    }

    public function getStateProducts($slug){
        $item = State::where('slug','=', $slug)->first();
        if(is_null($item)){
            $msg= ["error"=> "state slug not found"];
            return $this->jsonResponse($msg);
        }else{
            $id = $item->id;
            $state_products = State::findOrFail($id)->products;
            // $paginationProducts = $this->paginateWithoutKey($stateProducts, $perPage = 9, $page=$page_id, $options = []);
            // return $this->jsonResponse($paginationProducts);
            if(!$state_products){
                $msg = ["error"=> "state_products not found"];
                return $this->jsonResponse($msg);
            }else{
                return $this->jsonResponse($state_products);
            }                
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

    // public function getHeroBannerProducts(){
    //     $records = Product::with('state')->where('is_hero_banner', '=', '1')->get();
    //     $total = count($records);
    //     return $this->jsonResponse(['records'=>$records, 'total'=>$total] );
    // }

    public function getHeroBannerProducts(){
        
        $hero_banner_info = HeroBanner::with('product.state')->get();
        if(!$hero_banner_info){
            $msg = ["error"=> "hero_banner_info not found"];
            return $this->jsonResponse($msg);
        }else{
            return $this->jsonResponse($hero_banner_info);
        }          
    }
}
