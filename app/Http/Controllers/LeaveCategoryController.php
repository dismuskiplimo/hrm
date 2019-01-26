<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\LeaveCategory;

class LeaveCategoryController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $leave_categories = LeaveCategory::query()
        ->leftjoin('users as users','users.id', '=', 'leave_categories.created_by')
        ->orderBy('leave_categories.leave_category', 'ASC')
        ->where('leave_categories.deletion_status', 0)
        ->get([
            'leave_categories.*',
            'users.name',
        ])
        ->toArray();
        return view('administrator.setting.leave_category.manage_leave_categories', compact('leave_categories'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        return view('administrator.setting.leave_category.add_leave_category');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        $leave_category = $this->validate(request(), [
            'leave_category' => 'required|unique:leave_categories|max:100',
            'publication_status' => 'required',
            'leave_category_description' => 'required',
        ]);

        $result = LeaveCategory::create($leave_category + ['created_by' => auth()->user()->id]);
        $inserted_id = $result->id;

        if (!empty($inserted_id)) {
            return redirect('/setting/leave_categories/create')->with('message', 'Add successfully.');
        }
        return redirect('/setting/leave_categories/create')->with('exception', 'Operation failed !');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function published($id) {
        $affected_row = LeaveCategory::where('id', $id)
        ->update(['publication_status' => 1]);

        if (!empty($affected_row)) {
            return redirect('/setting/leave_categories')->with('message', 'Published successfully.');
        }
        return redirect('/setting/leave_categories')->with('exception', 'Operation failed !');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function unpublished($id) {
        $affected_row = LeaveCategory::where('id', $id)
        ->update(['publication_status' => 0]);

        if (!empty($affected_row)) {
            return redirect('/setting/leave_categories')->with('message', 'Unpublished successfully.');
        }
        return redirect('/setting/leave_categories')->with('exception', 'Operation failed !');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $leave_category = LeaveCategory::query()
        ->leftjoin('users as users','users.id', '=', 'leave_categories.created_by')
        ->orderBy('leave_categories.leave_category', 'ASC')
        ->where('leave_categories.id', $id)
        ->where('leave_categories.deletion_status', 0)
        ->first([
            'leave_categories.*',
            'users.name',
        ])
        ->toArray();
        return view('administrator.setting.leave_category.show_leave_category', compact('leave_category'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $leave_category = LeaveCategory::find($id)->toArray();
        return view('administrator.setting.leave_category.edit_leave_category', compact('leave_category'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        $leave_category = LeaveCategory::find($id);
        $this->validate(request(), [
            'leave_category' => 'required|max:100',
            'publication_status' => 'required',
            'leave_category_description' => 'required',
        ]);

        $leave_category->leave_category = $request->get('leave_category');
        $leave_category->leave_category_description = $request->get('leave_category_description');
        $leave_category->publication_status = $request->get('publication_status');
        $affected_row = $leave_category->save();

        if (!empty($affected_row)) {
            return redirect('/setting/leave_categories')->with('message', 'Update successfully.');
        }
        return redirect('/setting/leave_categories')->with('exception', 'Operation failed !');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $affected_row = LeaveCategory::where('id', $id)
        ->update(['deletion_status' => 1]);

        if (!empty($affected_row)) {
            return redirect('/setting/leave_categories')->with('message', 'Delete successfully.');
        }
        return redirect('/setting/leave_categories')->with('exception', 'Operation failed !');
    }

}
