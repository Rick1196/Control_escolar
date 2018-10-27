<?php

namespace SCE\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class SubjectsController extends Controller
{

    public function getSubjects(){
        $subjects = DB::select('SELECT * from subjects order by name');
        return $subjects;
    }

    public function getSubjectsByKey(Request $params){
        $key = $params['key'];
        $subject = DB::select('SELECT * from subjects where key = ? order by name',[$key]);
        return $subject;
    }
}