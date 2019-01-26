<?php

namespace App\Http\Controllers;

use App\File;
use App\PersonalEvent;
use App\User;
use Carbon;

class HomeController extends Controller {

/**
 * Create a new controller instance.
 *
 * @return void
 */
	public function __construct() {
		$this->middleware('auth');
	}

/**
 * Show the application dashboard.
 *
 * @return \Illuminate\Http\Response
 */
	public function index() {
		$today = Carbon\Carbon::now();
		$date_today = $today->toDateString();

		$personal_events = PersonalEvent::query()
			->leftjoin('users as users', 'users.id', '=', 'personal_events.created_by')
			->orderBy('personal_events.start_date', 'ASC')
			->where('personal_events.deletion_status', 0)
			->where('personal_events.start_date', '>=', $date_today)
			->get([
				'personal_events.*',
				'users.name',
			]);

		$clients = User::where('access_label', 5)
			->where('deletion_status', 0)
			->get();

		$references = User::where('access_label', 4)
			->where('deletion_status', 0)
			->get();

		$employees = User::where('access_label', '>=', 2)
			->where('access_label', '<=', 3)
			->where('deletion_status', 0)
			->get();

		$files = File::where('deletion_status', 0)
			->get();

		return view('administrator.dashboard.dashboard', compact('clients', 'references', 'employees', 'personal_events', 'files'));
	}

}
