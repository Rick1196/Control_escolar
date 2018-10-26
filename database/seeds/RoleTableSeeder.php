<?php

use Illuminate\Database\Seeder;
use SCE\Role;

class RoleTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $role = new Role();
        $role->name = 'admin';
        $role->description = 'Administrador';
        $role->save();

        $role = new Role();
        $role->name = 'alumno';
        $role->description = 'Alumno';
        $role->save();

        $role = new Role();
        $role->name = 'directivo';
        $role->description = 'Directivo';
        $role->save();

        $role = new Role();
        $role->name = 'profesor';
        $role->description = 'Profesor';
        $role->save();

        $role = new Role();
        $role->name = 'administrativo';
        $role->description = 'Administrativo';
        $role->save();
    }
}
