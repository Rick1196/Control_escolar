<?php

namespace SCE\Http\Controllers;

use Illuminate\Http\Request;
use DB;


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
        $password = $data['pass'];
        $tipo = DB::select('SELECT id from roles where name  = ?',[$rol]);
        $tipo = $tipo[0]->id;
        $pass = bcrypt($password);
        DB::insert('INSERT into users(name,email,password,created_at,updated_at) values(?,?,?,now(),now())',[$name_user,$email,$pass]);
        $usr = DB::select('SELECT id  from users where name = ?',[$name_user]);
        $usr = $usr[0]->id;
        DB::insert('INSERT into role_user(role_id,user_id,created_at,updated_at)  values(?,?,now(),now())',[$tipo,$usr]);
        $nombre = $data['p_name'];
        $apellido = $data['p_last'];
        $edad = $data['age'];
        $genero = $data['gen'];
        $phone = $data['phone'];
        $addr = $data['add'];
        DB::insert('INSERT into personal_information(name,last_name,age,address,phone_number,user_info,gender) values(?,?,?,?,?,?,?)',[$nombre,$apellido,$edad,$addr,$phone,$usr,$genero]);
        if($rol === 'alumno'){
            $curp = $data['curp'];
            $this->post_al($curp,$usr);
        }
        else{
            $rfc = $data['rfc'];
            $salario = $data['sal'];
            $this->post_worker($rfc,$salario,$rol,$usr);
        }
    }

    function post_worker($rfc,$salario,$tipo,$usuario){
        DB::table('workers')->insert(['rfc' => $rfc,'salary' => $salario, 'user_info'=>$usuario]);
        if($tipo === 'profesor'){
            $id = DB::select('SELECT id from workers where rfc = ?',[$rfc]);
            $id = $id[0]->id;
            DB::table('teachers')->insert(['worker_id' => $id]);
        }
    }

    function post_al($curp,$info){
        $mat = substr($curp,0,11);
        $cuenta = DB::table('students')->count();
        $mat = $mat.$cuenta;
        DB::table('students')->insert(['curp' => $curp,'mat' => $mat, 'user_info'=>$info]);
    }

    function get_num_st(){
        $als = DB::select('select count(*) cantidad from users inner join role_user user2 on users.id = user2.user_id inner join roles r on user2.role_id = r.id where r.name = ?',['alumno']);
        $als = $als[0]->cantidad;
        return $als;
    }

    function get_num_users(){
        $cuenta = DB::table('users')->count();
        return $cuenta;
    }

    function get_num_tch(){
        $als = DB::select('select count(*) cantidad from users inner join role_user user2 on users.id = user2.user_id inner join roles r on user2.role_id = r.id where r.name = ?',['profesor']);
        $als = $als[0]->cantidad;
        return $als;
    }

    function get_users(Request $data){
        $tipo = $data['tipo'];
        if($tipo != 'todos'){
            $res = DB::select('select users.id, users.name, users.email from users inner join role_user user2 on users.id = user2.user_id inner join roles r on user2.role_id = r.id where r.name = ?',[$tipo]);
        }
        else{
            $res = DB::select('select users.id, users.name, users.email from users inner join role_user user2 on users.id = user2.user_id inner join roles r on user2.role_id = r.id');
        }
        return $res;

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

    function get_notificaciones(){
        $nots = DB::select('SELECT * from notificaciones order by fecha asc');
        return $nots;
    }

    function post_notificacion(Request $data){
        $texto = $data['texto'];
        $titulo = $data['titulo'];
        DB::insert('INSERT into notificaciones(titulo, texto, fecha) values(?,?, now())',[$titulo,$texto]);
        $cuenta = DB::select('SELECT count(*) cuenta from notificaciones');
        $cuenta = $cuenta[0]->cuenta;
        if($cuenta > 30){
            $eliminar = DB::select('SELECT id  from notificaciones order by fecha desc');
            $eliminar = $eliminar[0]->id;
            DB::delete('DELETE from notificaciones where id = ?', [$eliminar]);
        }
    }

    function put_notificacion(Request $data){
        $texto = $data['texto'];
        $titulo = $data['titulo'];
        DB::update('UPDATE notificaciones set titulo = ?, texto = ?',[$titulo,$texto]);
    }

    function delete_notificacion(Request $data){
        $id = $data['id'];
        DB::delete('DELETE from notificaciones where id = ?',[$id]);
    }


}
