<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;

class ProfileController extends Controller {
	public function index() {
		$user = User::find(auth()->user()->id)->toArray();
		//return dd($user);
		return view('administrator.profile.user_profile', compact('user'));
	}

	public function update(Request $request) {
		$user = User::find(auth()->user()->id);

		$url = '/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/';
		$string = '/^[A-Za-z\s-_]+$/';

		$data = request()->validate([
			'name' => 'required|max:100|regex:' . $string,
			'contact_no_one' => 'required|max:20',
			'web' => 'nullable|max:150|regex:' . $url,
			'gender' => 'required',
			'avatar' => 'nullable|mimes:jpeg,png,jpg,gif',
			'date_of_birth' => 'required|date',
			'present_address' => 'required|max:250',
			'permanent_address' => 'required|max:250',
		], [
			'contact_no_one.required' => 'The contact no field is required.',
			'web.regex' => 'The URL format is invalid.',
			'name.regex' => 'No number is allowed.',
		]);

		if (!empty($data['avatar'])) {
			$avatar = time() . '.' . request()->avatar->getClientOriginalExtension();
			request()->avatar->move(public_path('profile_picture'), $avatar);
		} else {
			$avatar = $request->get('previous_avater');
		}

		$user->name = $request->get('name');
		$user->contact_no_one = $request->get('contact_no_one');
		$user->web = $request->get('web');
		$user->gender = $request->get('gender');
		$user->avatar = $avatar;
		$user->date_of_birth = $request->get('date_of_birth');
		$user->present_address = $request->get('present_address');
		$user->permanent_address = $request->get('permanent_address');

		$affected_row = $user->save();

		if (!empty($affected_row)) {
			return redirect('/profile/user-profile')->with('message', 'Update successfully.');
		}
		return redirect('/profile/user-profile')->with('exception', 'Operation failed !');
	}

	public function change_password() {
		return view('administrator.profile.change_password');
	}

	public function update_password(Request $request) {
		$user = User::find(auth()->user()->id);

		$data = request()->validate([
			'password' => 'required|string|min:8|confirmed',
			'password_confirmation' => '',
		], [
			'password.required' => 'The new password field is required.',
		]);

		$user->password = bcrypt($request->get('password'));

		$affected_row = $user->save();

		if (!empty($affected_row)) {
			return redirect('/profile/change-password')->with('message', 'Update successfully.');
		}
		return redirect('/profile/change-password')->with('exception', 'Operation failed !');

	}
}
