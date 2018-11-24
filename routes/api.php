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
Route::post('/get_users', 'UsersController@get_users');
Route::post('/get_groups', 'GroupsController@get_groups');
Route::get('/get_profesores', 'GroupsController@get_profesores');
Route::get('/get_materias', 'GroupsController@get_materias');
Route::post('/post_group', 'GroupsController@post_grupo');
Route::get('/get_peridos', 'GroupsController@get_periods');
Route::post('/get_als_gr', 'GroupsController@get_als_gr');
Route::post('/delete_al_gr', 'GroupsController@delete_al_gr');
Route::post('/post_std_gr', 'GroupsController@post_std_gr');
Route::get('/get_all_students', 'GroupsController@get_all_students');
Route::get('/get_notificaciones', 'UsersController@get_notificaciones');
Route::post('/post_notificacion','UsersController@post_notificacion');
Route::post('/put_notificacion','UsersController@put_notificacion');
Route::post('/delete_notificacion','UsersController@delete_notificacion');
Route::post('/get_al_mat','GroupsController@get_al_mat');
Route::post('/up_al_gr','GroupsController@up_al_gr');
Route::post('/get_groups_pr','GroupsController@get_groups_pr');
Route::post('/get_groups_al','GroupsController@get_groups_al');
Route::post('/send','MensajesController@send');
Route::post('/read','MensajesController@read');
Route::post('/delete','MensajesController@delete');
Route::post('/get_des','MensajesController@get_des');
Route::post('get_prom_gr','GroupsController@get_prom_gr');
