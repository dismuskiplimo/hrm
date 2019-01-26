<?php

namespace App\Http\Controllers;

use App\ExpenceManagement;
use App\User;
use Illuminate\Http\Request;

class ExpenceManagementController extends Controller {
	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index() {
		$expence_management = ExpenceManagement::query()
			->leftjoin('users as users', 'users.id', '=', 'expence_managements.created_by')
			->orderBy('expence_managements.id', 'ASC')
			->where('expence_managements.deletion_status', 0)
			->get([
				'expence_managements.*',
				'users.name',
			])
			->toArray();

		$employees = User::where('deletion_status', 0)
			->where('access_label', '>=', 2)
			->where('access_label', '<=', 3)
			->get(['name', 'id'])
			->toArray();
		//return dd($employees);
		return view('administrator.hrm.expence.manage_expence', compact('expence_management', 'employees'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create() {
		$employees = User::whereBetween('access_label', [2, 3])
			->where('deletion_status', 0)
			->select('id', 'name')
			->orderBy('id', 'DESC')
			->get()
			->toArray();
		return view('administrator.hrm.expence.add_expence', compact('employees'));
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request) {
		// return ($request->all());
		$expence_manages = $this->validate($request, [
			'employee_id' => 'required',
			'opening_blance' => 'required',
			'recovery_amount_on_cash' => 'required',
			'recovery_amount_by_cheque' => 'required',
			'bank_deposit_amount' => 'required',
			'expenses_amount' => 'required',
			'balance_amount' => 'required',
			'remarks_if_any' => 'required',

		]);
		$result = ExpenceManagement::create($expence_manages + ['created_by' => auth()->user()->id]);
		$inserted_id = $result->id;
		if (!empty($inserted_id)) {
			return redirect('/hrm/expence/manage-expence')->with('message', 'Add successfully.');
		}
		return redirect('/hrm/expence/manage-expence')->with('exception', 'Operation failed !');

	}

	/**
	 * Display the specified resource.
	 *
	 * @param  \App\ExpenceManagement  $expenceManagement
	 * @return \Illuminate\Http\Response
	 */
	public function show(ExpenceManagement $expenceManagement) {
		//
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  \App\ExpenceManagement  $expenceManagement
	 * @return \Illuminate\Http\Response
	 */
	public function edit(ExpenceManagement $expenceManagement) {
		//
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \App\ExpenceManagement  $expenceManagement
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, ExpenceManagement $expenceManagement) {
		//
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  \App\ExpenceManagement  $expenceManagement
	 * @return \Illuminate\Http\Response
	 */
	public function destroy(ExpenceManagement $expenceManagement) {
		//
	}
}
