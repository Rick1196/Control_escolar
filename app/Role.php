<?php

namespace SCE;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    public function users()
    {
        return $this
            ->belongsToMany('SCE\User')
            ->withTimestamps();
    }
}
