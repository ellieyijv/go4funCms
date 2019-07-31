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
}
