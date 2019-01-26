<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Department;

class DepartmentController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $departments = Department::all()
                ->sortByDesc('department')
                ->where('deletion_status', 0)
                ->toArray();
        return view('administrator.setting.department.manage_departments', compact('departments'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        return view('administrator.setting.department.add_department');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        $department = $this->validate(request(), [
            'department' => 'required|unique:departments|max:100',
            'publication_status' => 'required',
            'department_description' => 'required',
        ]);

        $result = Department::create($department + ['created_by' => auth()->user()->id]);
        $inserted_id = $result->id;

        if (!empty($inserted_id)) {
            return redirect('/setting/departments/create')->with('message', 'Add successfully.');
        }
        return redirect('/setting/departments/create')->with('exception', 'Operation failed !');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function published($id) {
        $affected_row = Department::where('id', $id)
                ->update(['publication_status' => 1]);

        if (!empty($affected_row)) {
            return redirect('/setting/departments')->with('message', 'Published successfully.');
        }
        return redirect('/setting/departments')->with('exception', 'Operation failed !');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function unpublished($id) {
        $affected_row = Department::where('id', $id)
                ->update(['publication_status' => 0]);

        if (!empty($affected_row)) {
            return redirect('/setting/departments')->with('message', 'Unpublished successfully.');
        }
        return redirect('/setting/departments')->with('exception', 'Operation failed !');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $department = DB::table('departments')
                ->join('users', 'departments.created_by', '=', 'users.id')
                ->select('departments.*', 'users.name')
                ->where('departments.id', $id)
                ->first();
        return view('administrator.setting.department.show_department', compact('department'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $department = Department::find($id)->toArray();
        return view('administrator.setting.department.edit_department', compact('department'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        $department = Department::find($id);
        $this->validate(request(), [
            'department' => 'required|max:100',
            'publication_status' => 'required',
            'department_description' => 'required',
        ]);

        $department->department = $request->get('department');
        $department->department_description = $request->get('department_description');
        $department->publication_status = $request->get('publication_status');
        $affected_row = $department->save();

        if (!empty($affected_row)) {
            return redirect('/setting/departments')->with('message', 'Update successfully.');
        }
        return redirect('/setting/departments')->with('exception', 'Operation failed !');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $affected_row = Department::where('id', $id)
                ->update(['deletion_status' => 1]);

        if (!empty($affected_row)) {
            return redirect('/setting/departments')->with('message', 'Delete successfully.');
        }
        return redirect('/setting/departments')->with('exception', 'Operation failed !');
    }

}
