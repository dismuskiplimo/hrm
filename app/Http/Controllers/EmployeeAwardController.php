<?php

namespace App\Http\Controllers;

use App\EmployeeAward;
use App\User;
use App\AwardCategory;
use Illuminate\Http\Request;

class EmployeeAwardController extends Controller {
	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index() {
		$employee_awords = EmployeeAward::query()
		->leftjoin('users as users', 'users.id', '=', 'employee_awards.created_by')
		->leftjoin('award_categories as award_categories', 'award_categories.id', '=', 'employee_awards.award_category_id')
		->orderBy('employee_awards.id', 'ASC')
		->where('employee_awards.deletion_status', 0)
		->get([
			'employee_awards.*',
			'users.name',
			'award_categories.award_title'

		])
		->toArray();
		$employees = User::query()
		->where('deletion_status', 0)
		->get(['name', 'id'])
		->toArray();

		return view('administrator.hrm.employee_awards.manage_employee_award', compact('employee_awords', 'employees'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create() {
		$employees = User::where('deletion_status', 0)
		->get([
			'name', 'id'
		])
		->toArray();

		$award_categorys = AwardCategory::where('deletion_status', 0)
		->where('publication_status', 1)
		->get([
			'award_title', 'id'
		])
		->toArray();
		return view('administrator.hrm.employee_awards.add_employee_award', compact('employees', 'award_categorys'));
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request) {
		//return ($request->all());
		$employee_award = $this->validate($request,[
			'employee_id'	=> 'required',
			'award_category_id'	=> 'required',
			'select_month'	=> 'required',
			'description'	=> 'required',
			'publication_status'	=> 'required',
		]);
		$result = EmployeeAward::create($employee_award + ['gift_item'=>$request->gift_item]  + ['created_by' => auth()->user()->id]);

		$inserted_id = $result->id;
		if(!empty($inserted_id)){
			return redirect('/hrm/employee-awards')->with('message', 'Add successfully.');
		}
		return redirect('/hrm/employee-awards')->with('exception', 'Operation failed !');
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function published($id) {
			$affected_row = EmployeeAward::where('id', $id)
			->update(['publication_status' => 1]);

			if (!empty($affected_row)) {
					return redirect('/hrm/employee-awards')->with('message', 'Published successfully.');
			}
			return redirect('/hrm/employee-awards')->with('exception', 'Operation failed !');
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function unpublished($id) {
			$affected_row = EmployeeAward::where('id', $id)
			->update(['publication_status' => 0]);

			if (!empty($affected_row)) {
					return redirect('/hrm/employee-awards')->with('message', 'Unpublished successfully.');
			}
			return redirect('/hrm/employee-awards')->with('exception', 'Operation failed !');
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  \App\EmployeeAward  $employeeAward
	 * @return \Illuminate\Http\Response
	 */
	public function show($id) {
		$employee_aword = EmployeeAward::query()
		->leftjoin('users as users', 'users.id', '=', 'employee_awards.created_by')
		->leftjoin('award_categories as award_categories', 'award_categories.id', '=', 'employee_awards.award_category_id')
		->orderBy('employee_awards.id', 'ASC')
		->where('employee_awards.deletion_status', 0)
		->first([
			'employee_awards.*',
			'users.name',
			'award_categories.award_title'

		])
		->toArray();
		$employees = User::where('deletion_status', 0)
		->get(['name', 'id'])
		->toArray();

		return view('administrator.hrm.employee_awards.show_employee_award', compact('employee_aword', 'employees'));
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  \App\EmployeeAward  $employeeAward
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id) {
		$employee_award = EmployeeAward::find($id)->toArray();
		$employees = User::where('deletion_status', 0)
		->get([
			'name', 'id'
		])
		->toArray();

		$award_categorys = AwardCategory::where('deletion_status', 0)
		->where('publication_status', 1)
		->get([
			'award_title', 'id'
		])
		->toArray();
		return view('administrator.hrm.employee_awards.edit_employee_award', compact('employee_award', 'employees', 'award_categorys'));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \App\EmployeeAward  $employeeAward
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id) {
		$employee_award = EmployeeAward::find($id);
		$this->validate($request,[
			'employee_id'	=> 'required',
			'award_category_id'	=> 'required',
			'select_month'	=> 'required',
			'description'	=> 'required',
			'publication_status'	=> 'required',
		]);
		$employee_award->employee_id = $request->get('employee_id');
		$employee_award->award_category_id = $request->get('award_category_id');
		$employee_award->select_month = $request->get('select_month');
		$employee_award->description = $request->get('description');
		$employee_award->publication_status = $request->get('publication_status');
		$employee_award->gift_item = $request->get('gift_item');
		$affected_row = $employee_award->save();
		if(!empty($affected_row)){
			  return redirect('/hrm/employee-awards')->with('message', 'Update successfully.');
		}
		return redirect('/hrm/employee-awards')->with('exception', 'Operation failed !');
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  \App\EmployeeAward  $employeeAward
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id) {
		$affected_row = EmployeeAward::where('id', $id)
		->update(['deletion_status' => 1]);

		if (!empty($affected_row)) {
				return redirect('/hrm/employee-awards')->with('message', 'Delete successfully.');
		}
		return redirect('/hrm/employee-awards')->with('exception', 'Operation failed !');
	}
}
