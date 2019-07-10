<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });


Route::get("/specialdeals", "SpecialDealsController@index");

Route::get("/populartours", "PopularToursController@index");

Route::get("/aboutus", "AboutUsController@index");

Route::get("{country}/cities", "CountryController@index");

Route::get("{country}/products", "CountryController@getCountryProducts");

Route::get("/{product}/spots", "SpotController@getProductSpots");