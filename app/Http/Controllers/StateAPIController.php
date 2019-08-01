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


    public function getStateCities($state_id){
        $stateCities = State::find($state_id)->cities;
        return  $this->jsonResponse($stateCities);
    }
}
