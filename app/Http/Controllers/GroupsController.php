<?php

namespace SCE\Http\Controllers;

use Illuminate\Http\Request;
use DB;


class GroupsController extends Controller
{
    public function get_groups(Request $data){
        $per = $data['per'];
        if($per === 'todos') {
            $grupos = DB::select('select groups.id gid,groups.subject sid ,t.id tid, groups.identifier, u.email, s2.name subject from groups inner join teachers t on groups.teacher = t.id inner join workers w2 on t.worker_id = w2.id inner join users u on w2.user_info = u.id inner join subjects s2 on groups.subject = s2.id order by u.email');
        }
        else{
            $grupos = DB::select('select groups.id,groups.subject, groups.identifier, u.email, s2.name subject  from groups inner join teachers t on groups.teacher = t.id inner join workers w2 on t.worker_id = w2.id inner join users u on w2.user_info = u.id inner join subjects s2 on groups.subject = s2.id inner join group_period period2 on groups.id = period2."group" inner join periods p on period2.period = p.id where p."desc"= ?',[$per]);
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

    public function get_als_gr(Request $data){
        $gr = $data['gr'];
        $res = DB::select('SELECT student_group_period.student,student_group_period.id pgs, mat, grade from student_group_period inner join students s2 on student_group_period.student = s2.id inner join group_period period on student_group_period.group_period = period.id where period."group" = ?',[$gr]);
        return $res;
    }

    public function delete_al_gr(Request $data){
        $la = $data['id'];
        DB::delete('delete from student_group_period where student =?',[$la]);
    }

    public function post_std_gr(Request $data){
        $al = $data['al'];
        $gr = $data['gr'];
        $per = $data['per'];
        $grpr = DB::select('select id from group_period where "group" = ?',[$gr]);
        $grpr = $grpr[0]->id;
        DB::insert('insert into student_group_period(student,grade, group_period) values(?,0,?)',[$al,$grpr]);
    }

    public function  get_all_students(){
        $res = DB::select('select * from students order by mat');
        return $res;
    }

    public function get_al_mat(Request $data){
        $mat = $data['mat'];
        $res = DB::select('SELECT * from students where mat = ?',[$mat]);
        return $res;
    }

    public function up_al_gr(Request $data){
        $al = $data['std'];
        $grade = $data['grade'];
        $materia = $data['mat'];
        DB::update('UPDATE student_group_period set grade = ? where student = ? and id = ? ',[$grade,$al,$materia]);
    }

    public function get_groups_pr(Request $data){
        $user = $data['user'];
        $groups = DB::select('SELECT groups.id id, groups.identifier grupo, s2.name from groups inner join teachers t on groups.teacher = t.id inner join workers w2 on t.worker_id = w2.id inner join users u on w2.user_info = u.id inner join subjects s2 on groups.subject = s2.id where u.id = ?',[$user]);
        return $groups;
    }

    public function get_groups_al(Request $data){
        $user = $data['user'];
        $groups = DB::select('SELECT g.identifier, s3.name, student_group_period.grade from student_group_period inner join group_period period on student_group_period.group_period = period.id inner join groups g on period."group" = g.id inner join students s2 on student_group_period.student = s2.id inner join subjects s3 on g.subject = s3.id inner join users u on s2.user_info = u.id where u.id = ?',[$user]);
        return $groups;
    }
    
    public function get_prom_gr(Request $data){
        $pr = $data['id'];
        $res = DB::select('SELECT g.identifier, s2.name, avg(student_group_period.grade) calificacion from student_group_period inner join group_period period on student_group_period.group_period = period.id inner join groups g on period."group" = g.id inner join teachers t on g.teacher = t.id inner join workers w2 on t.worker_id = w2.id inner join users u on w2.user_info = u.id inner join subjects s2 on g.subject = s2.id where u.id = ? group by (g.identifier, s2.name)',[$pr]);
        return $res;
    }

}