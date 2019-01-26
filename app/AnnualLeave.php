<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AnnualLeave extends Model
{
    public function user(){
    	return $this->belongsTo('App\User', 'user_id');
    }
}
