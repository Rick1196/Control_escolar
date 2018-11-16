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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/get_genders','PersonalInfoController@getGenders');
Route::get('/get_roles','UsersController@get_roles');
Route::post('/post_user','UsersController@post_user');
Route::get('/get_num_st','UsersController@get_num_st');
Route::get('/get_num_tch','UsersController@get_num_tch');
Route::get('/get_num_users','UsersController@get_num_users');
Route::get('/get_users_all', 'UsersController@get_users_all');
Route::post('/get_user', 'UsersController@get_user');
Route::post('/delete_user', 'UsersController@delete_user');
