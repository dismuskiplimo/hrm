<?php

namespace App\Http\Controllers;

use App\Designation;
use App\User;
use DB;
use Illuminate\Http\Request;
use PDF;

class ReferenceController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index() {
		$references = User::where('access_label', 4)
			->where('deletion_status', 0)
			->select('id', 'name', 'present_address', 'contact_no_one', 'created_at', 'activation_status')
			->orderBy('id', 'DESC')
			->get()
			->toArray();
		return view('administrator.people.reference.manage_references', compact('references'));
	}

	public function print() {
		$references = User::where('access_label', 4)
			->where('deletion_status', 0)
			->select('id', 'name', 'present_address', 'contact_no_one', 'created_at', 'activation_status')
			->orderBy('id', 'DESC')
			->get()
			->toArray();
		return view('administrator.people.reference.references_print', compact('references'));
	}

	public function references_pdf() {
		$references = User::where('access_label', 4)
			->where('deletion_status', 0)
			->select('id', 'name', 'present_address', 'contact_no_one', 'created_at', 'activation_status')
			->orderBy('id', 'DESC')
			->get()
			->toArray();

		$pdf = PDF::loadView('administrator.people.reference.references_pdf', compact('references'));
		$file_name = 'References.pdf';
		return $pdf->download($file_name);
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create() {
		$designations = Designation::where('deletion_status', 0)
			->where('publication_status', 1)
			->orderBy('designation', 'ASC')
			->select('id', 'designation')
			->get()
			->toArray();
		return view('administrator.people.reference.add_reference', compact('reference_types', 'designations'));
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request) {
		$url = '/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/';
		$string = '/^[A-Za-z\s-_]+$/';

		$reference = request()->validate([
			'name' => 'required|max:100|regex:' . $string,
			'email' => 'nullable|email|unique:users|max:100',
			'contact_no_one' => 'required|max:20',
			'web' => 'nullable|max:150|regex:' . $url,
			'gender' => 'required',
			'date_of_birth' => 'nullable|date',
			'present_address' => 'required|max:250',
			'contact_no_two' => 'nullable|max:250',
		], [
			'present_address.required' => 'The address field is required.',
			'web.regex' => 'The URL format is invalid.',
			'name.regex' => 'No number is allowed.',
		]);

		$result = User::create($reference + ['created_by' => auth()->user()->id, 'password' => bcrypt(12345678), 'access_label' => 4]);
		$inserted_id = $result->id;

		if (!empty($inserted_id)) {
			return redirect('/people/references/create')->with('message', 'Add successfully.');
		}
		return redirect('/people/references/create')->with('exception', 'Operation failed !');
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function active($id) {
		$affected_row = User::where('id', $id)
			->update(['activation_status' => 1]);

		if (!empty($affected_row)) {
			return redirect('/people/references')->with('message', 'Activate successfully.');
		}
		return redirect('/people/references')->with('exception', 'Operation failed !');
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function deactive($id) {
		$affected_row = User::where('id', $id)
			->update(['activation_status' => 0]);

		if (!empty($affected_row)) {
			return redirect('/people/references')->with('message', 'Deactive successfully.');
		}
		return redirect('/people/references')->with('exception', 'Operation failed !');
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id) {
		$reference = DB::table('users')
			->select('users.*')
			->where('users.id', $id)
			->first();
		$created_by = User::where('id', $reference->created_by)
			->select('id', 'name')
			->first();
		return view('administrator.people.reference.show_reference', compact('reference', 'created_by'));
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function pdf($id) {
		$reference = DB::table('users')
			->select('users.*')
			->where('users.id', $id)
			->first();

		$created_by = User::where('id', $reference->created_by)
			->select('id', 'name')
			->first();

		$pdf = PDF::loadView('administrator.people.reference.pdf', compact('reference', 'created_by'));
		$file_name = str_replace(' ', '', $reference->name) . '.pdf';
		return $pdf->download($file_name);
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id) {
		$reference = User::find($id)->toArray();
		$designations = Designation::where('deletion_status', 0)
			->where('publication_status', 1)
			->orderBy('designation', 'ASC')
			->select('id', 'designation')
			->get()
			->toArray();
		return view('administrator.people.reference.edit_reference', compact('reference', 'reference_types', 'designations'));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id) {
		$reference = User::find($id);

		$url = '/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/';
		$string = '/^[A-Za-z\s-_]+$/';

		request()->validate([
			'name' => 'required|max:100|regex:' . $string,
			'email' => 'required|email|max:100',
			'contact_no_one' => 'required|max:20',
			'web' => 'nullable|max:150|regex:' . $url,
			'gender' => 'required',
			'date_of_birth' => 'nullable|date',
			'present_address' => 'required|max:250',
			'contact_no_two' => 'nullable|max:250',
		], [
			'present_address.required' => 'The address field is required.',
			'web.regex' => 'The URL format is invalid.',
			'name.regex' => 'No number is allowed.',
		]);

		$reference->name = $request->get('name');
		$reference->email = $request->get('email');
		$reference->contact_no_one = $request->get('contact_no_one');
		$reference->web = $request->get('web');
		$reference->gender = $request->get('gender');
		$reference->date_of_birth = $request->get('date_of_birth');
		$reference->present_address = $request->get('present_address');
		$reference->contact_no_two = $request->get('contact_no_two');

		$affected_row = $reference->save();

		if (!empty($affected_row)) {
			return redirect('/people/references')->with('message', 'Update successfully.');
		}
		return redirect('/people/references')->with('exception', 'Operation failed !');
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id) {
		$affected_row = User::where('id', $id)
			->update(['deletion_status' => 1]);

		if (!empty($affected_row)) {
			return redirect('/people/references')->with('message', 'Delete successfully.');
		}
		return redirect('/people/references')->with('exception', 'Operation failed !');
	}

}
