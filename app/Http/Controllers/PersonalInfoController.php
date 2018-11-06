<?php
namespace SCE\Http\Controllers;

use Illuminate\Http\Request;
use DB;
class PersonalInfoController extends Controller
{
    public function getGenders(){
        $genders = DB::select("SELECT key, name nombre from genders");
        return $genders;
    }
}