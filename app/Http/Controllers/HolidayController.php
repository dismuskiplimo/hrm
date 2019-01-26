<?php

namespace App\Http\Controllers;

use App\Holiday;
use App\WorkingDay;
use Illuminate\Http\Request;

class HolidayController extends Controller {
	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index() {
		$holidays = Holiday::query()
			->leftjoin('users as users', 'users.id', '=', 'holidays.created_by')
			->orderBy('holidays.holiday_name', 'ASC')
			->where('holidays.deletion_status', 0)
			->get([
				'holidays.*',
				'users.name',
			])
			->toArray();
		return view('administrator.setting.holiday.manage-holidays', compact('holidays'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create() {
		return view('administrator.setting.holiday.add-holidays');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request) {
		$holidays = $this->validate($request, [
			'holiday_name' => 'required',
			'date' => 'required',
			'publication_status' => 'required',
			'description' => 'required',
		]);

		$date = strtolower(date("D", strtotime($request->date)));

		$weekly_holidays = WorkingDay::where('working_status', 0)
			->get(['day']);

		foreach ($weekly_holidays as $weekly_holiday) {
			if ($date == strtolower(date("D", strtotime($weekly_holiday['day'])))) {
				return redirect()->back()->with('exception', 'You select a day, Which is already holiday!');
			}
		}

		$result = Holiday::create($holidays + ['created_by' => auth()->user()->id]);
		$inserted_id = $result->id;
		if (!empty($inserted_id)) {
			return redirect('/setting/holidays/create')->with('message', 'Add successfully.');
		}
		return redirect('/setting/holidays/create')->with('exception', 'Operation failed !');
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function published($id) {
		$affected_row = Holiday::where('id', $id)
			->update(['publication_status' => 1]);

		if (!empty($affected_row)) {
			return redirect('/setting/holidays/')->with('message', 'Published successfully.');
		}
		return redirect('/setting/holidays/')->with('exception', 'Operation failed !');
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function unpublished($id) {
		$affected_row = Holiday::where('id', $id)
			->update(['publication_status' => 0]);

		if (!empty($affected_row)) {
			return redirect('/setting/holidays/')->with('message', 'Unpublished successfully.');
		}
		return redirect('/setting/holidays/')->with('exception', 'Operation failed !');
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  \App\Holiday  $holidays
	 * @return \Illuminate\Http\Response
	 */
	public function show($id) {

		$holidays = Holiday::query()
			->leftjoin('users as users', 'users.id', '=', 'holidays.created_by')
			->orderBy('holidays.holiday_name', 'ASC')
			->where('holidays.id', $id)
			->where('holidays.deletion_status', 0)
			->first([
				'holidays.*',
				'users.name',
			])
			->toArray();
		return view('administrator.setting.holiday.show-holidays', compact('holidays'));
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  \App\Holiday  $holidays
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id) {
		$holidays = Holiday::find($id)->toArray();
		return view('administrator.setting.holiday.edit-holidays', compact('holidays'));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \App\Holiday  $holidays
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id) {
		$holidays = Holiday::find($id);
		$this->validate($request, [
			'holiday_name' => 'required',
			'date' => 'required',
			'publication_status' => 'required',
			'description' => 'required',
		]);

		$holidays->holiday_name = $request->get('holiday_name');
		$holidays->date = $request->get('date');
		$holidays->description = $request->get('description');
		$holidays->description = $request->get('description');
		$holidays->publication_status = $request->get('publication_status');
		$affected_row = $holidays->save();

		if (!empty($affected_row)) {
			return redirect('/setting/holidays/')->with('message', 'Update successfully.');
		}
		return redirect('/setting/holidays/')->with('exception', 'Operation failed !');
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  \App\Holiday  $holidays
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id) {
		$affected_row = Holiday::where('id', $id)
			->update(['deletion_status' => 1]);

		if (!empty($affected_row)) {
			return redirect('/setting/holidays/')->with('message', 'Delete successfully.');
		}
		return redirect('/setting/holidays/')->with('exception', 'Operation failed !');
	}
}
