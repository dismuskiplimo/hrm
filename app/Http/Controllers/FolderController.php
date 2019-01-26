<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Folder;
use DB;

class FolderController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $folders = DB::table('folders')
                ->join('users', 'folders.created_by', '=', 'users.id')
                ->select('folders.*', 'users.name')
                ->where('folders.deletion_status', 0)
                ->orderBy('folders.id', 'DESC')
                ->get();
        return view('administrator.folder.manage_folders', compact('folders'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        return view('administrator.folder.add_folder');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        $folder = request()->validate([
            'folder_name' => 'required|max:100',
            'folder_description' => 'required',
            'publication_status' => 'required'
                ], [
            'folder_name.required' => 'The folder name is required.',
        ]);

        $result = Folder::create($folder + ['created_by' => auth()->user()->id]);
        $inserted_id = $result->id;

        if (!empty($inserted_id)) {
            return redirect('/folders')->with('message', 'Add successfully.');
        }
        return redirect('/folders')->with('exception', 'Operation failed !');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        //
    }

}
