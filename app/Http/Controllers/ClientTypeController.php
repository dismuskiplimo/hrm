<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use DB;
use App\ClientType;

class ClientTypeController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $client_types = ClientType::all()
                ->sortByDesc('client_type')
                ->where('deletion_status', 0)
                ->toArray();
        return view('administrator.setting.client_type.manage_client_types', compact('client_types'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        return view('administrator.setting.client_type.add_client_type');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        $client_type = $this->validate(request(), [
            'client_type' => 'required|unique:client_types|max:100',
            'publication_status' => 'required',
            'client_type_description' => 'required',
        ]);

        $result = ClientType::create($client_type + ['created_by' => auth()->user()->id]);
        $inserted_id = $result->id;

        if (!empty($inserted_id)) {
            return redirect('/setting/client-types/create')->with('message', 'Add successfully.');
        }
        return redirect('/setting/client-types/create')->with('exception', 'Operation failed !');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function published($id) {
        $affected_row = ClientType::where('id', $id)
                ->update(['publication_status' => 1]);

        if (!empty($affected_row)) {
            return redirect('/setting/client-types')->with('message', 'Published successfully.');
        }
        return redirect('/setting/client-types')->with('exception', 'Operation failed !');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function unpublished($id) {
        $affected_row = ClientType::where('id', $id)
                ->update(['publication_status' => 0]);

        if (!empty($affected_row)) {
            return redirect('/setting/client-types')->with('message', 'Unpublished successfully.');
        }
        return redirect('/setting/client-types')->with('exception', 'Operation failed !');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $client_type = DB::table('client_types')
                ->join('users', 'client_types.created_by', '=', 'users.id')
                ->select('client_types.*', 'users.name')
                ->where('client_types.id', $id)
                ->first();
        return view('administrator.setting.client_type.show_client_type', compact('client_type'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $client_type = ClientType::find($id)->toArray();
        return view('administrator.setting.client_type.edit_client_type', compact('client_type'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        $client_type = ClientType::find($id);
        $this->validate(request(), [
            'client_type' => 'required|max:100',
            'publication_status' => 'required',
            'client_type_description' => 'required',
        ]);

        $client_type->client_type = $request->get('client_type');
        $client_type->client_type_description = $request->get('client_type_description');
        $client_type->publication_status = $request->get('publication_status');
        $affected_row = $client_type->save();

        if (!empty($affected_row)) {
            return redirect('/setting/client-types')->with('message', 'Update successfully.');
        }
        return redirect('/setting/client-types')->with('exception', 'Operation failed !');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $affected_row = ClientType::where('id', $id)
                ->update(['deletion_status' => 1]);

        if (!empty($affected_row)) {
            return redirect('/setting/client-types')->with('message', 'Delete successfully.');
        }
        return redirect('/setting/client-types')->with('exception', 'Operation failed !');
    }

}
