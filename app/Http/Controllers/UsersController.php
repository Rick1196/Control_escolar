<?php

namespace SCE\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class UsersController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    //Get all the roles
    function get_roles(){
        $roles =  DB::select('SELECT * from roles order by id');
        return $roles;
    }
}
