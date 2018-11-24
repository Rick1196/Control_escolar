<?php

use Illuminate\Database\Seeder;
use SCE\User;
use SCE\Role;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
            
            $alumno = Role::where('name', 'alumno')->first();
            $admin = Role::where('name', 'admin')->first();
            $administrativo = Role::where('name', 'administrativo')->first();
            $profesor = Role::where('name', 'profesor')->first();

            /*
            $user = new User();
            $user->name = 'ricardo.admin';
            $user->email = 'ricardo.admin@gmail.com';
            $user->password = bcrypt('secret');
            $user->save();
            $user->roles()->attach($admin);

            $user = new User();
            $user->name = 'ricardo.profesor';
            $user->email = 'ricardo.profesor@gmail.com';
            $user->password = bcrypt('secret');
            $user->save();
            $user->roles()->attach($profesor);

            $user = new User();
            $user->name = 'ricardo.adminis';
            $user->email = 'ricardo.adminis@gmail.com';
            $user->password = bcrypt('secret');
            $user->save();
            $user->roles()->attach($administrativo);

            $user = new User();
            $user->name = 'abril.adminis';
            $user->email = 'abril.adminis@gmail.com';
            $user->password = bcrypt('secret');
            $user->save();
            $user->roles()->attach($administrativo);

            $user = new User();
            $user->name = 'ricardo.alumno';
            $user->email = 'ricardo.alumno@gmail.com';
            $user->password = bcrypt('secret');
            $user->save();
            $user->roles()->attach($alumno);

            $user = new User();
            $user->name = 'abril.admin';
            $user->email = 'abril.admin@gmail.com';
            $user->password = bcrypt('secret');
            $user->save();
            $user->roles()->attach($admin);

            $user = new User();
            $user->name = 'abril.profesor';
            $user->email = 'abril.profesor@gmail.com';
            $user->password = bcrypt('secret');
            $user->save();
            $user->roles()->attach($profesor);

            $user = new User();
            $user->name = 'abril.alumno';
            $user->email = 'abril.alumno@gmail.com';
            $user->password = bcrypt('secret');
            $user->save();
            $user->roles()->attach($alumno);*/

            /*
            for ($i = 30; $i < 60; $i++){

                $user = new User();
                $user->name = 'profesor'.$i;
                $user->email = 'profesor'.$i.'@gmail.com';
                $user->password = bcrypt('secret');
                $user->save();
                $user->roles()->attach($profesor);
            }*/

            for ($i = 101; $i < 110; $i++){

                $user = new User();
                $user->name = 'alumno'.$i;
                $user->email = 'alumno'.$i.'@gmail.com';
                $user->password = bcrypt('secret');
                $user->save();
                $user->roles()->attach($alumno);
            }
    }
}
