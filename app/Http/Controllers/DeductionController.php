<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Deduction;
use App\User;

class DeductionController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $deductions = Deduction::query()
        ->leftjoin('users as users','users.id', '=', 'deductions.user_id')
        ->leftjoin('designations','users.designation_id', '=', 'designations.id')
        ->orderBy('deductions.id', 'DESC')
        ->where('deductions.deletion_status', 0)
        ->get([
            'deductions.*',
            'users.name',
            'designations.designation'
        ])
        ->toArray();
        return view('administrator.hrm.deduction.manage_deductions', compact('deductions'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
         $users = User::where('deletion_status', 0)
         ->where('access_label', '>=', 2)
         ->where('access_label', '<=', 3)
        ->orderBy('name')
        ->get()
        ->toArray();
        return view('administrator.hrm.deduction.add_deduction', compact('users'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        $deduction = $this->validate(request(), [
            'user_id' => 'required',
            'deduction_name' => 'required|max:100',
            'deduction_month' => 'required',
            'deduction_amount' => 'required|numeric',
            'deduction_description' => 'required',
        ],[
            'user_id.required' => 'The employee name field is required.',
        ]);

        $result = Deduction::create([
            'created_by' => auth()->user()->id,
            'user_id' => $request->user_id,
            'deduction_name' => $request->deduction_name,
            'deduction_month' => $request->deduction_month .'-01',
            'deduction_amount' => $request->deduction_amount,
            'deduction_description' => $request->deduction_description,
        ]);
        $inserted_id = $result->id;

        if (!empty($inserted_id)) {
            return redirect('/hrm/deductions/create')->with('message', 'Add successfully.');
        }
        return redirect('/hrm/deductions/create')->with('exception', 'Operation failed !');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $deduction = Deduction::query()
        ->leftjoin('users as users','users.id', '=', 'deductions.user_id')
        ->leftjoin('designations','users.designation_id', '=', 'designations.id')
        ->orderBy('deductions.id', 'DESC')
        ->where('deductions.deletion_status', 0)
        ->first([
            'deductions.*',
            'users.name',
            'designations.designation'
        ])
        ->toArray();

        $users = User::where('deletion_status', 0)
        ->orderBy('name')
        ->get()
        ->toArray();

        return view('administrator.hrm.deduction.show_deduction', compact('deduction', 'users'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $deduction = Deduction::find($id)->toArray();

        $users = User::where('deletion_status', 0)
        ->orderBy('name')
        ->get()
        ->toArray();

        return view('administrator.hrm.deduction.edit_deduction', compact('deduction', 'users'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        $deduction = Deduction::find($id);
        $this->validate(request(), [
            'user_id' => 'required',
            'deduction_name' => 'required|max:100',
            'deduction_month' => 'required',
            'deduction_amount' => 'required|numeric',
            'deduction_description' => 'required',
        ],[
            'user_id.required' => 'The employee name field is required.',
        ]);

        $deduction->user_id = $request->get('user_id');
        $deduction->deduction_name = $request->get('deduction_name');
        $deduction->deduction_month = $request->get('deduction_month') . '-01';
        $deduction->deduction_amount = $request->get('deduction_amount');
        $deduction->deduction_description = $request->get('deduction_description');
        $affected_row = $deduction->save();

        if (!empty($affected_row)) {
            return redirect('/hrm/deductions')->with('message', 'Update successfully.');
        }
        return redirect('/hrm/deductions')->with('exception', 'Operation failed !');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $affected_row = Deduction::where('id', $id)
        ->update(['deletion_status' => 1]);

        if (!empty($affected_row)) {
            return redirect('/hrm/deductions')->with('message', 'Delete successfully.');
        }
        return redirect('/hrm/deductions')->with('exception', 'Operation failed !');
    }

}



