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


Route::get("/specialdeals", "ProductAPIController@specialDeals");

Route::get("/populartours", "ProductAPIController@popularTours");

Route::get("/{product}/spots", "ProductAPIController@getProductSpots");

Route::get("/{product}/recommends", "ProductAPIController@getProductRecommends");

Route::get("/products", "ProductAPIController@getProductByTerm");

Route::get("/aboutus", "AboutUsController@index");

// Route::get("{country}/cities", "CountryController@index");

Route::get("/states", "StateAPIController@getAllStates");

// Route::get("{state}/products/page={page_id}", "ProductAPIController@getStateProducts");
Route::get("{state}/products", "ProductAPIController@getStateProducts");


Route::get("{state}/cities", "StateAPIController@getStateCities");

Route::get("state/{cities}/products", "ProductAPIController@getCitiesProducts");