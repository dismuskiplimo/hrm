<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Carbon\Carbon;

use Auth;

use Session;

use App\Asset;

use App\AssetHistory;

use App\User;

class AssetController extends Controller
{
    public function index(){
    	$assets = Asset::where('deletion_status', 0)->orderBy('brand', 'ASC')->orderBy('model', 'ASC')->get();

    	return view('administrator.hrm.asset.manage_assets', [
    		'assets' => $assets,
    		'title'	 => 'Asset Management',
    	]);
    }

    public function my_assets(){
    	$user = Auth::user();

    	$assets = $user->assets()->where('deletion_status', 0)->orderBy('brand', 'ASC')->orderBy('model', 'ASC')->get();

    	return view('administrator.hrm.asset.my_assets', [
    		'assets' => $assets,
    		'title'	 => 'My Assets',
    	]);
    }

    public function add_asset(){
    	$asset = new \StdClass;
    	$asset->asset_type = null;
    	$asset->brand = null;
    	$asset->model = null;
    	$asset->serial_number = null;
    	$asset->description = null;

    	return view('administrator.hrm.asset.add_asset', [
    		'title' => 'Add Asset',
    		'page'	=> 'create',
    		'asset' => $asset,
    	]);
    }

    public function update_asset($id){
    	$asset = Asset::find($id);

    	if(!$asset || $asset->deletion_status){
    		Session::flash('exception', 'Asset not Found');
    		return redirect()->back();
    	}

    	return view('administrator.hrm.asset.add_asset', [
    		'title' => 'Update Asset',
    		'page'	=> 'update',
    		'asset'	=> $asset,
    	]);
    }

    public function store(Request $request){
    	$user = Auth::user();

    	$this->validate($request, [
    		'asset_type' 	=> 'required|max:255',
    		'brand' 		=> 'required|max:255',
    		'model' 		=> 'required|max:255',
    		'serial_number' => 'required|max:255',
    		'description' 	=> 'required',
    	]);

    	$asset 					= new Asset;
    	$asset->asset_type		= $request->asset_type;
    	$asset->brand			= $request->brand;
    	$asset->model			= $request->model;
    	$asset->serial_number	= $request->serial_number;
    	$asset->description		= $request->description;
    	$asset->created_by		= $user->id;
    	$asset->save();

    	Session::flash('message', 'Asset Added');

    	return redirect()->route('assets.view', ['id' => $asset->id]);
    }

    public function view($id){
    	$asset = Asset::find($id);

    	$users = User::where('deletion_status', 0)->orderBy('name', 'ASC')->get();

    	if(!$asset || $asset->deletion_status){
    		Session::flash('exception', 'Asset not Found');
    		return redirect()->back();
    	}

    	return view('administrator.hrm.asset.view_asset',[
    		'asset' => $asset,
    		'title' => $asset->brand . ' ' . $asset->model,
    		'users'	=> $users,
    	]);
    }

    public function update(Request $request, $id){
    	$user = Auth::user();

    	$asset = Asset::find($id);

    	if(!$asset){
    		Session::flash('exception', 'Asset not found');

    		return redirect()->back();
    	}



    	$this->validate($request, [
    		'asset_type' 	=> 'required|max:255',
    		'brand' 		=> 'required|max:255',
    		'model' 		=> 'required|max:255',
    		'serial_number' => 'required|max:255',
    		'description' 	=> 'required',
    	]);

    	$asset->asset_type		= $request->asset_type;
    	$asset->brand			= $request->brand;
    	$asset->model			= $request->model;
    	$asset->serial_number	= $request->serial_number;
    	$asset->description		= $request->description;
    	$asset->created_by		= $user->id;
    	$asset->update();

    	Session::flash('message', 'Asset Updated');

    	return redirect()->back();
    }

    public function report(){

    }

    public function get_report(){

    }

    public function assign(Request $request, $id){
    	$this->validate($request, [
    		'condition_before' 	=> 'required',
    		'user_id'			=> 'required|numeric|min:1',
    	]);

    	$asset = Asset::find($id);

    	$user = Auth::user();

    	if(!$asset){
    		Session::flash('exception', 'Asset not found');

    		return redirect()->back();
    	}

    	if($asset->assigned){
    		Session::flash('exception', 'Asset already assigned. Please Clear First before re-assigning');

    		return redirect()->back();
    	}

    	$asset_history 						= new AssetHistory;
		$asset_history->user_id 			= $request->user_id;
		$asset_history->condition_before	= $request->condition_before;
		$asset_history->asset_id 			= $asset->id;
		$asset_history->assigned_by 		= $user->id;
		$asset_history->save();
    	
    	$asset->assigned = 1;
    	$asset->assigned_to = $request->user_id;
    	$asset->assigned_by = $user->id;
    	$asset->assigned_at = Carbon::now();
    	$asset->previous_id = $asset_history->id;
    	$asset->update();

    	Session::flash('message', 'Asset Assigned');

    	return redirect()->back();
    }

    public function clear(Request $request, $id){

    	$this->validate($request, [
    		'condition_after' => 'required',
    	]);

    	$asset = Asset::find($id);

    	$user = Auth::user();

    	if(!$asset){
    		Session::flash('exception', 'Asset not found');

    		return redirect()->back();
    	}

    	if(!$asset->assigned){
    		Session::flash('exception', 'Asset has not been assigned to anyone.');

    		return redirect()->back();
    	}

    	if($asset->previous){
    		$previous 					= $asset->previous;
    		$previous->condition_after 	= $request->condition_after;
    		$previous->cleared_by 		= $user->id;
    		$previous->cleared_at 		= Carbon::now();
    		$previous->cleared 			= 1;
    		$previous->update();
    	}

    	$asset->assigned = 0;
    	$asset->assigned_to = null;
    	$asset->assigned_by = null;
    	$asset->assigned_at = null;
    	$asset->update();

    	Session::flash('message', 'Asset Cleared');

    	return redirect()->back();
    }

    public function dispose(Request $request, $id){
    	$this->validate($request, [
    		'disposed_reason' 	=> 'required',
    	]);

    	$asset = Asset::find($id);

    	$user = Auth::user();

    	if(!$asset){
    		Session::flash('exception', 'Asset not found');

    		return redirect()->back();
    	}

    	if($asset->disposed){
    		Session::flash('exception', 'Asset already disposed.');

    		return redirect()->back();
    	}

    	if($asset->assigned){
    		Session::flash('exception', 'Asset assigned, please clear first.');

    		return redirect()->back();
    	}
    	
    	$asset->assigned = 0;
    	$asset->assigned_to = null;
    	$asset->assigned_by = null;
    	$asset->assigned_at = null;
    	$asset->previous_id = null;

    	$asset->disposed = 1;
    	$asset->disposed_by = $user->id;
    	$asset->disposed_at = Carbon::now();
    	$asset->disposed_reason = $request->disposed_reason;
    	$asset->update();

    	Session::flash('message', 'Asset Disposed');

    	return redirect()->back();
    }

    public function delete(Request $request, $id){
    	$asset = Asset::find($id);

    	if(!$asset){
    		Session::flash('exception', 'Asset not found');

    		return redirect()->back();
    	}

    	$asset->deletion_status = 1;
    	$asset->update();

    	Session::flash('message', 'Asset deleted');

    	return redirect()->route('assets.manage');
    }
}
