<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Loan;
use App\User;

class LoanController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $loans = Loan::query()
        ->leftjoin('users as users','users.id', '=', 'loans.user_id')
        ->leftjoin('designations','users.designation_id', '=', 'designations.id')
        ->orderBy('loans.id', 'DESC')
        ->where('loans.deletion_status', 0)
        ->get([
            'loans.*',
            'users.name',
            'designations.designation'
        ])
        ->toArray();
        return view('administrator.hrm.loan.manage_loans', compact('loans'));
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
        return view('administrator.hrm.loan.add_loan', compact('users'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        $loan = $this->validate(request(), [
            'user_id' => 'required',
            'loan_name' => 'required|max:100',
            'number_of_installments' => 'required',
            'loan_amount' => 'required|numeric',
            'loan_description' => 'required',
        ],[
            'user_id.required' => 'The employee name field is required.',
        ]);

        $result = Loan::create([
            'created_by' => auth()->user()->id,
            'user_id' => $request->user_id,
            'loan_name' => $request->loan_name,
            'loan_amount' => $request->loan_amount,
            'number_of_installments' => $request->number_of_installments,
            'remaining_installments' => $request->number_of_installments,
            'loan_description' => $request->loan_description,
        ]);
        $inserted_id = $result->id;

        if (!empty($inserted_id)) {
            return redirect('/hrm/loans/create')->with('message', 'Add successfully.');
        }
        return redirect('/hrm/loans/create')->with('exception', 'Operation failed !');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $loan = Loan::query()
        ->leftjoin('users as users','users.id', '=', 'loans.user_id')
        ->leftjoin('designations','users.designation_id', '=', 'designations.id')
        ->orderBy('loans.id', 'DESC')
        ->where('loans.deletion_status', 0)
        ->first([
            'loans.*',
            'users.name',
            'designations.designation'
        ])
        ->toArray();

        $users = User::where('deletion_status', 0)
        ->orderBy('name')
        ->get()
        ->toArray();

        return view('administrator.hrm.loan.show_loan', compact('loan', 'users'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $loan = Loan::find($id)->toArray();

        $users = User::where('deletion_status', 0)
        ->orderBy('name')
        ->get()
        ->toArray();

        return view('administrator.hrm.loan.edit_loan', compact('loan', 'users'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        $loan = Loan::find($id);
        $this->validate(request(), [
            'user_id' => 'required',
            'loan_name' => 'required|max:100',
            'loan_amount' => 'required|numeric',
            'number_of_installments' => 'required',
            'remaining_installments' => 'required',
            'loan_description' => 'required',
        ],[
            'user_id.required' => 'The employee name field is required.',
        ]);

        $loan->user_id = $request->get('user_id');
        $loan->loan_name = $request->get('loan_name');
        $loan->loan_amount = $request->get('loan_amount');
        $loan->number_of_installments = $request->get('number_of_installments');
        $loan->remaining_installments = $request->get('remaining_installments');
        $loan->loan_description = $request->get('loan_description');
        $affected_row = $loan->save();

        if (!empty($affected_row)) {
            return redirect('/hrm/loans')->with('message', 'Update successfully.');
        }
        return redirect('/hrm/loans')->with('exception', 'Operation failed !');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $affected_row = Loan::where('id', $id)
        ->update(['deletion_status' => 1]);

        if (!empty($affected_row)) {
            return redirect('/hrm/loans')->with('message', 'Delete successfully.');
        }
        return redirect('/hrm/loans')->with('exception', 'Operation failed !');
    }

}

