<?php

namespace SCE\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use SCE\User;
use SCE\Role;


class UsersController extends Controller
{

    //Get all the roles
    function get_roles(){
        $roles =  DB::select('SELECT * from roles order by id');
        return $roles;
    }

    function post_user(Request $data){
        $rol = $data['rol'];
        $name_user = $data['name_user'];
        $email = $data['email'];
        $password = $data['password'];
        $p_name = $data['p_name'];
        $p_last = $data['p_last'];
        $age = $data['age'];
        $add = $data['add'];
        $phone = $data['phone'];
        $gen = $data['gen'];
        $role_user = Role::where('name', $rol)->first();
        $user = new User();
        $user->name = $name_user;
        $user->email = $email;
        $user->password = bcrypt($password);
        $user->save();
        $user->roles()->attach($role_user);
        $nuevo = DB::table('users')->where('name', $name_user)->value('id');
        $id = DB::table('personal_information')->insertGetId(
            ['name' => $p_name,'last_name' => $p_last, 'age' => $age, 'address' => $add,'phone_number' => $phone,
                'gender' => $gen, 'user_info'=>$nuevo
            ]
        );
        if($rol === "alumno"){
            $curp = $data['curp'];
            $this->post_al($curp,$id);
        }
        else{
            $rfc = $data['rfc'];
            $salary = $data['sal'];
            $worker = DB::table('workers')->insertGetId( ['rfc' => $rfc,'salary' => $salary, 'person_info' => $id]);
            if($rol === "profesor"){
                DB::table('teachers')->insert(['worker_id' => $worker]);
            }
        }
    }

    function post_al($curp,$info){
        $mat = substr($curp,0,11);
        $cuenta = DB::table('students')->count();
        $mat = $mat.$cuenta;
        DB::table('students')->insert(['curp' => $curp,'mat' => $mat, 'personal_information'=>$info]);
    }

    function get_num_st(){
        $cuenta = DB::table('students')->count();
        return $cuenta;
    }

    function get_num_users(){
        $cuenta = DB::table('users')->count();
        return $cuenta;
    }

    function get_num_tch(){
        $cuenta = DB::table('teachers')->count();
        return $cuenta;
    }

    function get_users_all(){
        $users = DB::table('users')
            ->get();
        return $users;
    }

    function get_user(Request $data){
        $mail = $data['mail'];
        $us = DB::select('select * from users where email = ?',[$mail]);
        return $us;
    }

    function delete_user(Request $data){
        $id = $data['id'];
        DB::delete('delete from users where id = ?',[$id]);
        return $id;
    }


}
