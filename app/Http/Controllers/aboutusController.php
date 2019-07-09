<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\AboutUs;


class aboutusController extends Controller
{
    public function index(){
        $data = AboutUs::get()->all();
        return $this->jsonResponse($data);
       
    }
}
