<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AssetHistory extends Model
{
    public function user(){
    	return $this->belongsTo('App\User', 'user_id');
    }

    public function clearer(){
    	return $this->belongsTo('App\User', 'cleared_by');
    }

    public function assigner(){
    	return $this->belongsTo('App\User', 'assigned_by');
    }

    public function asset(){
    	return $this->belongsTo('App\Asset', 'asset_id');
    }

}
