<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\State;

class StateAPIController extends Controller
{
    public function getAllStates(){
        $states = State::all();
        return $this->jsonResponse($states);
    }


    public function getStateCities($state_slug){
        $item = State::where('slug','=', $state_slug)->first();
        if(is_null($item)){
            $error= ["error"=> "Resource not found"];
            return $this->jsonResponse($error);
        }else{
            $state_id = $item->id;
            $stateCities = State::find($state_id)->cities;
            return  $this->jsonResponse($stateCities);
        }
    }
}
