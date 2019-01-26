<?php

namespace App\Http\Controllers;

use App\AwardCategory;
use Illuminate\Http\Request;

class AwardCategoryController extends Controller {
	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index() {
		$award_categorys = AwardCategory::query()
			->leftjoin('users as users', 'users.id', '=', 'award_categories.created_by')
			->orderBy('award_categories.id', 'ASC')
			->where('award_categories.deletion_status', 0)
			->get([
				'award_categories.*',
				'users.name',
			])
			->toArray();
		return view('administrator.setting.employee_award.award_category.manage_award_category', compact('award_categorys'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create() {
		return view('administrator.setting.employee_award.award_category.add_award_category');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request) {
		//return ($request->all());
		$award_categorys = $this->validate($request, [
			'award_title' => 'required',
			'publication_status' => 'required',
		]);
		$result = AwardCategory::create($award_categorys + ['created_by' => auth()->user()->id]);
		$inserted_id = $result->id;
		if (!empty($inserted_id)) {
			return redirect('/setting/award_categories')->with('message', 'add success.');
		}
		return redirect('/setting/award_categories')->with('exception', 'Operation failed !');

	}
	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function published($id) {
		$affected_row = AwardCategory::where('id', $id)
			->update(['publication_status' => 1]);

		if (!empty($affected_row)) {
			return redirect('/setting/award_categories/')->with('message', 'Published successfully.');
		}
		return redirect('/setting/award_categories/')->with('exception', 'Operation failed !');
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function unpublished($id) {
		$affected_row = AwardCategory::where('id', $id)
			->update(['publication_status' => 0]);

		if (!empty($affected_row)) {
			return redirect('/setting/award_categories/')->with('message', 'Unpublished successfully.');
		}
		return redirect('/setting/award_categories/')->with('exception', 'Operation failed !');
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  \App\AwardCategory  $awardCategory
	 * @return \Illuminate\Http\Response
	 */
	public function show(AwardCategory $awardCategory) {
		//
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  \App\AwardCategory  $awardCategory
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id) {
		$award_categorys = AwardCategory::find($id)->toArray();
		return view('administrator.setting.employee_award.award_category.edit_award_category', compact('award_categorys'));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \App\AwardCategory  $awardCategory
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id) {
		$award_categorys = AwardCategory::find($id);
		$this->validate($request, [
			'award_title' => 'required',
			'publication_status' => 'required',
		]);
		$award_categorys->award_title = $request->get('award_title');
		$award_categorys->publication_status = $request->get('publication_status');
		$affected_row = $award_categorys->save();
		if (!empty($affected_row)) {
			return redirect('/setting/award_categories')->with('message', 'Update success.');
		}
		return redirect('/setting/award_categories')->with('exception', 'Operation failed !');
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  \App\AwardCategory  $awardCategory
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id) {
		$affected_row = AwardCategory::where('id', $id)
			->update(['deletion_status' => 1]);
		if (!empty($affected_row)) {
			return redirect('/setting/award_categories')->with('message', 'Delete success.');
		}
		return redirect('/setting/award_categories')->with('exception', 'Operation failed !');
	}
}
