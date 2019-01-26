<?php

namespace App\Http\Controllers;

use App\ClientType;
use App\Designation;
use App\User;
use DB;
use Illuminate\Http\Request;
use PDF;

class ClientController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index() {
		$clients = User::query()
			->join('client_types', 'client_types.id', '=', 'users.client_type_id')
			->where('users.access_label', 5)
			->where('users.deletion_status', 0)
			->select('users.id', 'users.name', 'users.contact_no_one', 'users.present_address', 'users.created_at', 'users.activation_status', 'client_types.client_type')
			->orderBy('users.id', 'DESC')
			->get()
			->toArray();
		return view('administrator.people.client.manage_clients', compact('clients'));
	}

	public function print() {
		$clients = User::query()
			->join('client_types', 'client_types.id', '=', 'users.client_type_id')
			->where('users.access_label', 5)
			->where('users.deletion_status', 0)
			->select('users.id', 'users.name', 'users.contact_no_one', 'users.present_address', 'client_types.client_type')
			->orderBy('users.id', 'DESC')
			->get()
			->toArray();
		return view('administrator.people.client.clients_print', compact('clients'));
	}

	public function clients_pdf() {
		$clients = User::query()
			->join('client_types', 'client_types.id', '=', 'users.client_type_id')
			->where('users.access_label', 5)
			->where('users.deletion_status', 0)
			->select('users.id', 'users.name', 'users.contact_no_one', 'users.present_address', 'client_types.client_type')
			->orderBy('users.id', 'DESC')
			->get()
			->toArray();

		$pdf = PDF::loadView('administrator.people.client.clients_pdf', compact('clients'));
		$file_name = 'clients.pdf';
		return $pdf->download($file_name);
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create() {
		$client_types = ClientType::where('deletion_status', 0)
			->where('publication_status', 1)
			->orderBy('client_type', 'ASC')
			->select('id', 'client_type')
			->get()
			->toArray();
		$designations = Designation::where('deletion_status', 0)
			->where('publication_status', 1)
			->orderBy('designation', 'ASC')
			->select('id', 'designation')
			->get()
			->toArray();
		return view('administrator.people.client.add_client', compact('client_types', 'designations'));
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

		$client = request()->validate([
			'name' => 'required|max:100|regex:' . $string,
			'email' => 'nullable|email|unique:users|max:100',
			'contact_no_one' => 'required|max:20',
			'web' => 'nullable|max:150|regex:' . $url,
			'gender' => 'required',
			'date_of_birth' => 'nullable|date',
			'present_address' => 'required|max:250',
			'contact_no_two' => 'nullable|max:250',
			'client_type_id' => 'required|numeric',
		], [
			'client_type_id.required' => 'The client type field is required.',
			'contact_no_one.required' => 'The contact no field is required.',
			'web.regex' => 'The URL format is invalid.',
			'name.regex' => 'No number is allowed.',
		]);

		$result = User::create($client + ['created_by' => auth()->user()->id, 'password' => bcrypt(12345678), 'access_label' => 5]);
		$inserted_id = $result->id;

		if (!empty($inserted_id)) {
			return redirect('/people/clients/create')->with('message', 'Add successfully.');
		}
		return redirect('/people/clients/create')->with('exception', 'Operation failed !');
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
			return redirect('/people/clients')->with('message', 'Activate successfully.');
		}
		return redirect('/people/clients')->with('exception', 'Operation failed !');
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
			return redirect('/people/clients')->with('message', 'Deactive successfully.');
		}
		return redirect('/people/clients')->with('exception', 'Operation failed !');
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id) {
		$client = DB::table('users')
			->join('client_types', 'users.client_type_id', '=', 'client_types.id')
			->select('users.*', 'client_types.client_type')
			->where('users.id', $id)
			->first();
		$created_by = User::where('id', $client->created_by)
			->select('id', 'name')
			->first();
		return view('administrator.people.client.show_client', compact('client', 'created_by'));
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function pdf($id) {
		$client = DB::table('users')
			->join('client_types', 'users.client_type_id', '=', 'client_types.id')
			->select('users.*', 'client_types.client_type')
			->where('users.id', $id)
			->first();

		$created_by = User::where('id', $client->created_by)
			->select('id', 'name')
			->first();

		$pdf = PDF::loadView('administrator.people.client.pdf', compact('client', 'created_by'));
		$file_name = str_replace(' ', '', $client->name) . '.pdf';
		return $pdf->download($file_name);
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id) {
		$client = User::find($id)->toArray();
		$client_types = ClientType::where('deletion_status', 0)
			->where('publication_status', 1)
			->orderBy('client_type', 'ASC')
			->select('id', 'client_type')
			->get()
			->toArray();
		$designations = Designation::where('deletion_status', 0)
			->where('publication_status', 1)
			->orderBy('designation', 'ASC')
			->select('id', 'designation')
			->get()
			->toArray();
		return view('administrator.people.client.edit_client', compact('client', 'client_types', 'designations'));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id) {
		$client = User::find($id);

		$url = '/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/';
		$string = '/^[A-Za-z\s-_]+$/';

		request()->validate([
			'name' => 'required|max:100|regex:' . $string,
			'email' => 'nullable|email|max:100',
			'contact_no_one' => 'required|max:20',
			'web' => 'nullable|max:150|regex:' . $url,
			'gender' => 'required',
			'date_of_birth' => 'nullable|date',
			'present_address' => 'required|max:250',
			'contact_no_two' => 'nullable|max:250',
			'client_type_id' => 'required|numeric',
		], [
			'client_type_id.required' => 'The client type field is required.',
			'contact_no_one.required' => 'The contact no field is required.',
			'web.regex' => 'The URL format is invalid.',
			'name.regex' => 'No number is allowed.',
		]);

		$client->name = $request->get('name');
		$client->email = $request->get('email');
		$client->contact_no_one = $request->get('contact_no_one');
		$client->web = $request->get('web');
		$client->gender = $request->get('gender');
		$client->date_of_birth = $request->get('date_of_birth');
		$client->present_address = $request->get('present_address');
		$client->contact_no_two = $request->get('contact_no_two');
		$client->client_type_id = $request->get('client_type_id');

		$affected_row = $client->save();

		if (!empty($affected_row)) {
			return redirect('/people/clients')->with('message', 'Update successfully.');
		}
		return redirect('/people/clients')->with('exception', 'Operation failed !');
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
			return redirect('/people/clients')->with('message', 'Delete successfully.');
		}
		return redirect('/people/clients')->with('exception', 'Operation failed !');
	}

}
