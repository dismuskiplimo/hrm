<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RoleUser extends Model
{
    protected $table = 'role_user';

    public function users(){
    	return $this->hasMany('App\User', 'user_id');
    }

    public function role(){
    	return $this->belongsTo('App\Role', 'role_id');
    }
}
