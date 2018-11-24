<?php

namespace SCE\Http\Controllers;

use Illuminate\Http\Request;
use DB;


class MensajesController extends Controller{
    public function send(Request $data){
        $org = $data['org'];
        $des = $data['des'];
        $texto = $data['texto'];
        $titulo = $data['titulo'];
        $res = DB::select('SELECT id from users where email = ?',[$des]);
        $des = $res[0]->id;
        DB::insert('INSERT into mensajes(titulo,mensaje,origen,destinatario,fecha) values(?,?,?,?,now())',[$titulo,$texto,$org,$des]);
    }

    public function read(Request $data){
        $user = $data['user'];
        $mensajes = DB::select('SELECT mensajes.mensaje,mensajes.titulo, mensajes.id, users.email origen from mensajes inner join users on mensajes.origen = users.id where destinatario = ? order by fecha desc',[$user]);
        return $mensajes;
    }

    public function delete(Request $data){
        $id = $data['id'];
        DB::delete('DELETE from mensajes where id = ?',[$id]);
    }

    public function get_des(Request $data){
        $mail = $data['mail'];
        $res = DB::select('SELECT * from users where email = ?',[$mail]);
        return $res;
    }
}