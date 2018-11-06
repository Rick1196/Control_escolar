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

    public function getTeachers(Request $params){
        $rfc = $params['rfc'];
        if(strcmp($rfc,"null") == 0){
            $teachers =  DB::select('SELECT * from teachers order by rfc');
            return $teachers;
        }else{
            $teacher =  DB::select('SELECT * from teachers where rfc = ? order by rfc',[$rfc]);
            return $teacher;
        }
    }

    public function getGroups(){
        $groups = DB::select('SELECT * from groups');
        return $groups;
    }

    public function getGroupsFullDescription(){
        $groups = DB::select('SELECT g1.id, g1.identifier, t.id, t.personal_information, s2.id, s2.name  from groups g1 inner join subjects s2 on g1.subject = s2.id inner join teachers t on g1.teacher = t.id');
        return $groups;
    }

    public function getGroupFullDescription(Request $params){
        $identifier = $params['identifier'];
        $group = DB::select('SELECT g1.id, g1.identifier, t.id, t.personal_information, s2.id, s2.name  from groups g1 inner join subjects s2 on g1.subject = s2.id inner join teachers t on g1.teacher = t.id where g1.identifier = ?',[$identifier]);
        return $group;
    }

}