<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();
Route::group(['middleware' => 'auth'], function (){
    
});
Route::get('/home', 'HomeController@index')->name('home');
Route::get('register', 'Auth\RegisterController@index')->name('register');
//Route::get('get_teachers_data', 'Auth\RegisterController@')
Route::get('/subjects', 'SubjectsController@getSubjects');
Route::get('/subjects_key/{key}', 'SubjectsController@getSubjectsByKey');
Route::get('/teachers/{rfc}', 'SubjectsController@getTeachers');
Route::get('/groups', 'SubjectsController@getGroups');
Route::get('/groups_full_description','SubjectsController@getGroupsFullDescription');
Route::get('/group_full_description/{identifier}','SubjectsController@getGroupFullDescription');
Route::get('/get_genders','PersonalInfoController@getGenders');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

