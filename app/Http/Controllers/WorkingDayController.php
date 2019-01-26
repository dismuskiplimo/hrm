<?php

namespace App\Http\Controllers;
use App\WorkingDay;
use Illuminate\Http\Request;

class WorkingDayController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index() {
		$working_days = WorkingDay::get()
			->toArray();
		return view('administrator.setting.working_day.manage_working_days', compact('working_days'));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request) {
		$id = 1;
		for ($i = 0; $i < count($request->day); $i++) {
			$affected_row = WorkingDay::where('id', $id++)
				->update(['working_status' => $request->day[$i]]);
		}
		return redirect('/setting/working-days')->with('message', 'Update successfully.');
	}

}
