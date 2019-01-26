<?php

namespace App\Http\Controllers;

use App\LeaveApplication;
use App\LeaveCategory;
use App\User;
use DB;
use PDF;
use Auth;
use App\Attendances;
use App\AnnualLeave;
use Carbon\Carbon;
use Illuminate\Http\Request;

class LeaveApplicationController extends Controller {

	protected function annual_leave(){

		$user = Auth::user();

		$today = Carbon::now();

		$annual_leave = $user->annual_leaves()->where('year', $today->year)->first();

		if(!$annual_leave){
			$days = 30;
			$previous_leave = $user->annual_leaves()->where('year', $today->year - 1)->first();

			if($previous_leave){
				if($previous_leave->days_left > 0){
					if($previous_leave->days_left <= 15){
						$days += $previous_leave->days_left;
					}else{
						$days += 15;
					}
				}
			}

			$annual_leave 					= new AnnualLeave;
			$annual_leave->user_id 			= $user->id;
			$annual_leave->year 			= $today->year;
			$annual_leave->days_used 		= 0;
			$annual_leave->days_left 		= $days;
			$annual_leave->save();
		}

		return $annual_leave;

	}

	public function reports(){
		$carbon = Carbon::now();
		$nowInDhakaTz = Carbon::now('Asia/Dhaka');
		//$today = $nowInDhakaTz->format('Y-m-d');
		$year = $nowInDhakaTz->format('Y');

		$users = User::query()
		->leftjoin('designations as designations', 'users.designation_id', 'designations.id')
		->whereBetween('users.access_label',array(2, 3))
		->where('users.deletion_status', 0)
		->orderBy('users.employee_id', 'asc')
		->get(['users.id', 'users.name', 'users.employee_id', 'designations.designation' ]);

		$attendances = DB::table('attendances')
		->select(DB::raw('count(attendances.attendance_status) AS total_attendances'), 'attendances.user_id')
		->whereYear('attendances.attendance_date', $year)
		->where('attendance_status', 1)
		->groupBy('attendances.user_id')
		->get();

		$absences = DB::table('attendances')
		->select(DB::raw('count(attendances.attendance_status) AS total_absences'), 'attendances.user_id')
		->whereYear('attendances.attendance_date', $year)
		->where('attendance_status', 0)
		->where('leave_category_id', 0)
		->groupBy('attendances.user_id')
		->get();

		$casual_leaves = DB::table('attendances')
		->select(DB::raw('count(attendances.attendance_status) AS total_casual_leaves'), 'attendances.user_id')
		->whereYear('attendances.attendance_date', $year)
		->where('attendance_status', 0)
		->where('leave_category_id', 1)
		->groupBy('attendances.user_id')
		->get();

		$earned_leaves = DB::table('attendances')
		->select(DB::raw('count(attendances.attendance_status) AS total_earned_leaves'), 'attendances.user_id')
		->whereYear('attendances.attendance_date', $year)
		->where('attendance_status', 0)
		->where('leave_category_id', 2)
		->groupBy('attendances.user_id')
		->get();

		$advance_leaves = DB::table('attendances')
		->select(DB::raw('count(attendances.attendance_status) AS total_advance_leave'), 'attendances.user_id')
		->whereYear('attendances.attendance_date', $year)
		->where('attendance_status', 0)
		->where('leave_category_id', 3)
		->groupBy('attendances.user_id')
		->get();

		$special_leaves = DB::table('attendances')
		->select(DB::raw('count(attendances.attendance_status) AS total_special_leave'), 'attendances.user_id')
		->whereYear('attendances.attendance_date', $year)
		->where('attendance_status', 0)
		->where('leave_category_id', 4)
		->groupBy('attendances.user_id')
		->get();

		return view('administrator.hrm.leave_application.leave_report', compact('users', 'attendances', 'casual_leaves', 'earned_leaves', 'earned_leaves', 'advance_leaves', 'special_leaves', 'absences'));
	}

	public function pdf_reports(){
		$carbon = Carbon::now();
		$nowInDhakaTz = Carbon::now('Asia/Dhaka');
		//$today = $nowInDhakaTz->format('Y-m-d');
		$year = $nowInDhakaTz->format('Y');

		$users = User::query()
		->leftjoin('designations as designations', 'users.designation_id', 'designations.id')
		->whereBetween('users.access_label',array(2, 3))
		->where('users.deletion_status', 0)
		->orderBy('users.employee_id', 'asc')
		->get(['users.id', 'users.name', 'users.employee_id', 'designations.designation' ]);

		$attendances = DB::table('attendances')
		->select(DB::raw('count(attendances.attendance_status) AS total_attendances'), 'attendances.user_id')
		->whereYear('attendances.attendance_date', $year)
		->where('attendance_status', 1)
		->groupBy('attendances.user_id')
		->get();

		$absences = DB::table('attendances')
		->select(DB::raw('count(attendances.attendance_status) AS total_absences'), 'attendances.user_id')
		->whereYear('attendances.attendance_date', $year)
		->where('attendance_status', 0)
		->where('leave_category_id', 0)
		->groupBy('attendances.user_id')
		->get();

		$casual_leaves = DB::table('attendances')
		->select(DB::raw('count(attendances.attendance_status) AS total_casual_leaves'), 'attendances.user_id')
		->whereYear('attendances.attendance_date', $year)
		->where('attendance_status', 0)
		->where('leave_category_id', 1)
		->groupBy('attendances.user_id')
		->get();

		$earned_leaves = DB::table('attendances')
		->select(DB::raw('count(attendances.attendance_status) AS total_earned_leaves'), 'attendances.user_id')
		->whereYear('attendances.attendance_date', $year)
		->where('attendance_status', 0)
		->where('leave_category_id', 2)
		->groupBy('attendances.user_id')
		->get();

		$advance_leaves = DB::table('attendances')
		->select(DB::raw('count(attendances.attendance_status) AS total_advance_leave'), 'attendances.user_id')
		->whereYear('attendances.attendance_date', $year)
		->where('attendance_status', 0)
		->where('leave_category_id', 3)
		->groupBy('attendances.user_id')
		->get();

		$special_leaves = DB::table('attendances')
		->select(DB::raw('count(attendances.attendance_status) AS total_special_leave'), 'attendances.user_id')
		->whereYear('attendances.attendance_date', $year)
		->where('attendance_status', 0)
		->where('leave_category_id', 4)
		->groupBy('attendances.user_id')
		->get();

		$pdf = PDF::loadView('administrator.hrm.leave_application.pdf_reports', compact('users', 'attendances', 'casual_leaves', 'earned_leaves', 'earned_leaves', 'advance_leaves', 'special_leaves', 'absences'));
		$file_name = 'attendance_report.pdf';
		return $pdf->download($file_name);
	}

	public function index() {
		$leave_applications = LeaveApplication::query()
		->leftjoin('users as users', 'users.id', '=', 'leave_applications.created_by')
		->leftjoin('leave_categories as leave_categories', 'leave_categories.id', '=', 'leave_applications.leave_category_id')
		->orderBy('leave_applications.id', 'DESC')
		->where('leave_applications.deletion_status', 0)
		->get([
			'leave_applications.*',
			'users.name',
			'leave_categories.leave_category',
		])
		->toArray();

		$annual_leave = $this->annual_leave();

		return view('administrator.hrm.leave_application.manage_application', compact('leave_applications'));
	}

	public function apllicationLists() {
		$leave_applications = LeaveApplication::query()
		->leftjoin('users as users', 'users.id', '=', 'leave_applications.created_by')
		->leftjoin('leave_categories as leave_categories', 'leave_categories.id', '=', 'leave_applications.leave_category_id')
		->orderBy('leave_applications.id', 'DESC')
		->where('leave_applications.deletion_status', 0)
		->get([
			'leave_applications.*',
			'users.name',
			'leave_categories.leave_category',
		])
		->toArray();

		$annual_leave = $this->annual_leave();

		return view('administrator.hrm.leave_application.manage_application_lists', compact('leave_applications'));

	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create() {
		$user = auth()->user();

		$leave_applications = $user->leave_applications()->where('publication_status', 0)->count();

		if($leave_applications){
			return redirect()->back()->with('exception', 'You cannot apply for a leave because you have a leave application that is pending');
		}

		$annual_leave = $this->annual_leave();

		$leave_categorys = LeaveCategory::where('deletion_status', 0)
		->where('publication_status', 1)
		->select('id', 'leave_category')
		->get();
		// dd($leave_categorys);
		return view('administrator.hrm.leave_application.add_leave_application', compact('leave_categorys'));
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request) {
		$user 	= auth()->user();
		
		$today 	= Carbon::now();

		$this->validate($request, [
			'leave_category_id' => 'required',
			'start_date' 		=> 'required',
			'end_date' 			=> 'required',
		]);

		$start_date = Carbon::parse(request('start_date'));
		$end_date 	= Carbon::parse(request('end_date'));
		
		//$days = $start_date->diffInDays($end_date);

		$days = $start_date->diffInDaysFiltered(function(Carbon $date){
			return !$date->isWeekend();
		},$end_date);

		$pending_leaves = $user->leave_applications()->where('publication_status', 0)->get();

		if(count($pending_leaves)){
			$message = 'Sorry, you can not apply for a leave because you have one pending approval';

			return redirect()->back()->with('exception', $message);
		}

		$annual_leave = $this->annual_leave();

		$leave_category = LeaveCategory::findOrFail($request->leave_category_id);
		
		if($leave_category->leave_category != 'Paternity' && $leave_category->leave_category != 'Maternity' ){
			if($annual_leave->days_used >= 45){
				$message = 'You Can not Apply for a leave because you have used all 45 days for the year.';

				return redirect()->back()->with('exception', $message);
			}elseif($days > $annual_leave->days_left){
				$message = 'Leave application failed because you requested ' . $days . ' days While you only have ' . $annual_leave->days_left . ' days left for the year ' . $today->year;

				return redirect()->back()->with('exception', $message);
			}
		}

		$leave_application 							= new LeaveApplication;
		$leave_application->last_leave_date 		= $request->last_leave_date;
		$leave_application->start_date 				= $request->start_date;
		$leave_application->end_date 				= $request->end_date;
		$leave_application->last_leave_period 		= $request->last_leave_period;
		$leave_application->last_leave_category_id 	= $request->last_leave_category_id;
		$leave_application->leave_category_id 		= $request->leave_category_id;
		$leave_application->leave_address 			= $request->leave_address;
		$leave_application->during_leave 			= $request->during_leave;
		$leave_application->reason 					= $request->reason;
		$leave_application->recommender_id 			= $request->recommender_id;
		$leave_application->created_by 				= $user->id;
		$leave_application->days 					= $days;
		$leave_application->save();

		
		return redirect()->route('leave-application.index')->with('message', 'Add successfully.');
		
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  \App\LeaveApplication  $leaveApplication
	 * @return \Illuminate\Http\Response
	 */
	public function show($id) {
		$leave_application = LeaveApplication::query()
		->leftjoin('users as users', 'users.id', '=', 'leave_applications.created_by')
		->leftjoin('designations as designations', 'users.designation_id', '=', 'designations.id')
		->leftjoin('leave_categories as leave_categories', 'leave_categories.id', '=', 'leave_applications.leave_category_id')
		->orderBy('leave_applications.id', 'DESC')
		->where('leave_applications.id', $id)
		->where('leave_applications.deletion_status', 0)
		->first([
			'leave_applications.*',
			'users.name',
			'users.employee_id',
			'designations.designation',
			'leave_categories.leave_category',
		])
		->toArray();

		$annual_leave = $this->annual_leave();

		return view('administrator.hrm.leave_application.show_leave_application', compact('leave_application'));
	}

	public function approved($id) {
		$today = Carbon::now();

		$leave_application = LeaveApplication::findOrFail($id);
		$user = $leave_application->user;
		$leave_application->publication_status = 1;
		$leave_application->approved_by = $user->id;
		$leave_application->update();

		
		$leave_category = $leave_application->leave_category;

		$start_date = Carbon::parse($leave_application->start_date);
		$end_date 	= Carbon::parse($leave_application->end_date);
		
		$days = $start_date->diffInDaysFiltered(function(Carbon $date){
			return !$date->isWeekend();
		},$end_date);

		$annual_leave = $this->annual_leave();

		if($leave_category->leave_category != 'Paternity' && $leave_category->leave_category != 'Maternity' ){
			$annual_leave->days_used += $days;
			$annual_leave->days_left -= $days;
			$annual_leave->update();
		}

		return redirect('/hrm/application_lists/')->with('message', 'Leave Approved.');
		
	}

	public function not_approved($id) {
		$affected_row = LeaveApplication::where('id', $id)
		->update(['publication_status' => 2]);

		$annual_leave = $this->annual_leave();

		if (!empty($affected_row)) {
			return redirect('/hrm/application_lists/')->with('message', 'Not Accepted.');
		}
		return redirect('/hrm/application_lists/')->with('exception', 'Operation failed !');
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  \App\LeaveApplication  $leaveApplication
	 * @return \Illuminate\Http\Response
	 */
	public function edit(LeaveApplication $leaveApplication) {
		//
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \App\LeaveApplication  $leaveApplication
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, LeaveApplication $leaveApplication) {
		//
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  \App\LeaveApplication  $leaveApplication
	 * @return \Illuminate\Http\Response
	 */
	public function destroy(LeaveApplication $leaveApplication) {
		//
	}

}
