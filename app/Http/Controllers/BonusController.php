<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Bonus;
use App\User;

class BonusController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $bonuses = Bonus::query()
        ->leftjoin('users as users','users.id', '=', 'bonuses.user_id')
        ->leftjoin('designations','users.designation_id', '=', 'designations.id')
        ->orderBy('bonuses.id', 'DESC')
        ->where('bonuses.deletion_status', 0)
        ->get([
            'bonuses.*',
            'users.name',
            'designations.designation'
        ])
        ->toArray();
        return view('administrator.hrm.bonus.manage_bonuses', compact('bonuses'));
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
        return view('administrator.hrm.bonus.add_bonus', compact('users'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        $bonus = $this->validate(request(), [
            'user_id' => 'required',
            'bonus_name' => 'required|max:100',
            'bonus_month' => 'required',
            'bonus_amount' => 'required|numeric',
            'bonus_description' => 'required',
        ],[
            'user_id.required' => 'The employee name field is required.',
        ]);

        $result = Bonus::create([
            'created_by' => auth()->user()->id,
            'user_id' => $request->user_id,
            'bonus_name' => $request->bonus_name,
            'bonus_month' => $request->bonus_month .'-01',
            'bonus_amount' => $request->bonus_amount,
            'bonus_description' => $request->bonus_description,
        ]);
        $inserted_id = $result->id;

        if (!empty($inserted_id)) {
            return redirect('/hrm/bonuses/create')->with('message', 'Add successfully.');
        }
        return redirect('/hrm/bonuses/create')->with('exception', 'Operation failed !');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $bonus = Bonus::query()
        ->leftjoin('users as users','users.id', '=', 'bonuses.user_id')
        ->leftjoin('designations','users.designation_id', '=', 'designations.id')
        ->orderBy('bonuses.id', 'DESC')
        ->where('bonuses.deletion_status', 0)
        ->first([
            'bonuses.*',
            'users.name',
            'designations.designation'
        ])
        ->toArray();

        $users = User::where('deletion_status', 0)
        ->orderBy('name')
        ->get()
        ->toArray();

        return view('administrator.hrm.bonus.show_bonus', compact('bonus', 'users'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $bonus = Bonus::find($id)->toArray();

        $users = User::where('deletion_status', 0)
        ->orderBy('name')
        ->get()
        ->toArray();

        return view('administrator.hrm.bonus.edit_bonus', compact('bonus', 'users'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        $bonus = Bonus::find($id);
        $this->validate(request(), [
            'user_id' => 'required',
            'bonus_name' => 'required|max:100',
            'bonus_month' => 'required',
            'bonus_amount' => 'required|numeric',
            'bonus_description' => 'required',
        ],[
            'user_id.required' => 'The employee name field is required.',
        ]);

        $bonus->user_id = $request->get('user_id');
        $bonus->bonus_name = $request->get('bonus_name');
        $bonus->bonus_month = $request->get('bonus_month') . '-01';
        $bonus->bonus_amount = $request->get('bonus_amount');
        $bonus->bonus_description = $request->get('bonus_description');
        $affected_row = $bonus->save();

        if (!empty($affected_row)) {
            return redirect('/hrm/bonuses')->with('message', 'Update successfully.');
        }
        return redirect('/hrm/bonuses')->with('exception', 'Operation failed !');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $affected_row = Bonus::where('id', $id)
        ->update(['deletion_status' => 1]);

        if (!empty($affected_row)) {
            return redirect('/hrm/bonuses')->with('message', 'Delete successfully.');
        }
        return redirect('/hrm/bonuses')->with('exception', 'Operation failed !');
    }

}

