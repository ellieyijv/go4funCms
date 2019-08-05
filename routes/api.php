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

Route::get("/{product}/withDetails", "ProductAPIController@getProductWithDetails");

Route::get("state/{cities}/products", "ProductAPIController@getCitiesProducts");

// Route::get("{state}/products/page={page_id}", "ProductAPIController@getStateProducts");
Route::get("{slug}/products", "ProductAPIController@getStateProducts");

Route::get("/getHeroBannerProducts", "ProductAPIController@getHeroBannerProducts");

Route::get("{slug}/cities", "StateAPIController@getStateCities");

Route::get("/states", "StateAPIController@getAllStates");

Route::get("/aboutus", "SiteInfoAPIController@aboutUSInfo");
Route::get("/basicInfos", "SiteInfoAPIController@basicInfos");

//this is for voyager spots search
Route::get("/products", "ProductAPIController@getProductByTerm");