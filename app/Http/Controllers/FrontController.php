<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Carbon\Carbon;

class FrontController extends Controller
{
    public function addTime(Request $request){
    	$start_time = $request->start_time;
    	$days 		= $request->days;

    	$start_time = Carbon::parse($start_time);
    	
    	$end_time 	= $start_time->addDays($days);

    	if($end_time->isWeekend()){
    		$end_time->addDays(1);
    	}

    	if($end_time->isWeekend()){
    		$end_time->addDays(1);
    	}

    	$response = [
    		'status' => 200,
    		'end_date' => $end_time->toDateString(),
    	];

    	return response()->json($response);

    }
}
