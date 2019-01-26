<?php

namespace App\Http\Controllers;

use App\Permission;
use App\Role;
use DB;
use Illuminate\Http\Request;

class RoleController extends Controller {
	public function __construct() {
		$this->middleware('auth');
		//$this->middleware('permission:role-read', ['only' => ['index']]);
		//$this->middleware('permission:role-create', ['only' => ['create']]);
		//$this->middleware('permission:role-edit', ['only' => ['edit']]);
		//$this->middleware('permission:role-delete', ['only' => ['destroy']]);
		//$this->middleware('permission:view-posts',   ['only' => ['show', 'index']]);
	}

	public function index() {
		$roles = Role::all();
		return view('administrator.setting.role.index', compact('roles'));
	}

	public function create() {
		$permissions = Permission::all();
		return view('administrator.setting.role.create', compact('permissions'));
	}

	public function store(Request $request) {
		$role = Role::create($request->except(['permission', '_token']));

		foreach ($request->permission as $key => $value) {
			$role->attachPermission($value);
		}

		return redirect()->route('setting.role.index')->with('message', 'Role create successfully.');
	}

	public function edit($id) {
		$role = Role::find($id);
		$permissions = Permission::all();
		$role_permissions = $role->perms()->pluck('id', 'id')->toArray();

		return view('administrator.setting.role.edit', compact(['role', 'role_permissions', 'permissions']));
	}

	public function update(Request $request, $id) {
		$role = Role::find($id);
		$role->name = $request->name;
		$role->display_name = $request->display_name;
		$role->description = $request->description;
		$role->save();

		DB::table('permission_role')->where('role_id', $id)->delete();

		foreach ($request->permission as $key => $value) {
			$role->attachPermission($value);
		}

		return redirect()->route('setting.role.index')->with('message', 'Role updated successfully.');
	}

	public function destroy(Role $role) {
		DB::table("roles")->where('id', $id)->delete();
		return back()->with('message', 'Role Deleted');
	}
}
