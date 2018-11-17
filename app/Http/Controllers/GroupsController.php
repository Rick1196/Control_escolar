<?php

namespace SCE\Http\Controllers;

use Illuminate\Http\Request;
use DB;


class GroupsController extends Controller
{
    public function get_groups(Request $data){
        $per = $data['per'];
        if($per === 'todos') {
            $grupos = DB::select('select groups.id gid,groups.subject sid ,t.id tid, groups.identifier, u.email, s2.name subject from groups inner join teachers t on groups.teacher = t.id inner join workers w2 on t.worker_id = w2.id inner join users u on w2.user_info = u.id inner join subjects s2 on groups.subject = s2.id');
        }
        else{
            $groups = DB::select('select groups.id,groups.subject, groups.identifier, u.email, s2.name from groups inner join teachers t on groups.teacher = t.id inner join workers w2 on t.worker_id = w2.id inner join users u on w2.user_info = u.id inner join subjects s2 on groups.subject = s2.id inner join group_period period2 on groups.id = period2."group" inner join periods p on period2.period = p.id where p."desc"= ?',[$per]);
        }
        return $grupos;
    }

    public function get_profesores(Request $data){
        $profs = DB::select('select users.id, users.name, users.email from users inner join role_user user2 on users.id = user2.user_id inner join roles r on user2.role_id = r.id where r.name = ? ',['profesor']);
        return $profs;
    }

    public function get_materias(Request $data){
        $mats = DB::select("select * from subjects");
        return $mats;
    }

    public function get_periods(){
        $per = DB::select('select id,"desc" from periods');
        return $per;
    }


    public function post_grupo(Request $data){
        $idProf = $data['profesor'];
        $materia = $data['materia'];
        $identificador = $data['iden'];
        $per = $data['per'];
        $profesor = DB::select('select teachers.id idi from teachers inner join workers w2 on teachers.worker_id = w2.id where w2.user_info = ?',[$idProf]);
        $profesor = $profesor[0]->idi;
        $id = DB::table('groups')->insertGetId(
            ['subject' => $materia, 'teacher' => $profesor, 'identifier'=>$identificador]
        );
        DB::insert('insert into segments_group(segment, "group") select segments.id, ? from segments',[$id]);
        DB::insert('insert into group_period("group", period) values(?,?)',[$id,$per]);

    }

}