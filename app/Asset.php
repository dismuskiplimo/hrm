<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Asset extends Model
{
    public function user(){
    	return $this->belongsTo('App\User', 'assigned_to');
    }

    public function creator(){
    	return $this->belongsTo('App\User', 'created_by');
    }

    public function assigner(){
    	return $this->belongsTo('App\User', 'assigned_by');
    }

    public function disposer(){
    	return $this->belongsTo('App\User', 'disposed_by');
    }

    public function history(){
    	return $this->hasMany('App\AssetHistory', 'asset_id');
    }

    public function previous(){
    	return $this->belongsTo('App\AssetHistory', 'previous_id');
    }
}
