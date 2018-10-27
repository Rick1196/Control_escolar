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
Route::get('/subjects', 'SubjectsController@getSubjects');
Route::get('/subjects_key/{key}', 'SubjectsController@getSubjectsByKey');
