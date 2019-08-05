<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\AboutUs;
use App\Models\BasicInfo;

class SiteInfoAPIController extends Controller
{
    public function aboutUSInfo(){
        $data = AboutUs::get()->first();
        return $this->jsonResponse($data);  
    }

    public function basicInfos(){
        $data = BasicInfo::get()->first();
        return $this->jsonResponse($data);  
    }
}
