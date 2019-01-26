<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\File;
class FileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id)
    {
        $files = DB::table('files')
        ->join('users', 'files.created_by', '=', 'users.id')
        ->join('folders', 'files.folder_id', '=', 'folders.id')
        ->select('files.*', 'users.name')
        ->where('files.folder_id', $id)
        ->where('files.deletion_status', 0)
        ->orderBy('files.id', 'DESC')
        ->get();
        $folder_id = $id;

        return view('administrator.file.manage_files', compact('files', 'folder_id'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($id)
    {
        $folder_id = $id;
        return view('administrator.file.add_file', compact('folder_id'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, $id)
    {
        $file = request()->validate([
            'caption' => 'required|max:250',
            'file_name' => 'required|mimes:jpeg,png,jpg,gif,txt,pdf,doc,docx,zip',
            'publication_status' => 'required',
        ]);

        $file_name = time().'.'.request()->file_name->getClientOriginalExtension();
        request()->file_name->move(public_path('uploaded_files'), $file_name);

        $result = File::create([
            'folder_id' => $id,
            'caption' => $file['caption'],
            'publication_status' => $file['publication_status'],
            'file_name' => $file_name,
            'created_by' => auth()->user()->id,
        ]);
        $inserted_id = $result->id;

        if (!empty($inserted_id)) {
            return redirect('/files/'.$id)->with('message', 'Add successfully.');
        }
        return redirect('/files/'.$id)->with('exception', 'Operation failed !');
    }

/**
 * Return Downloadable File 
 */
public function download($file_name) {
    $file_path = public_path('uploaded_files/' . $file_name);
    return response()->download($file_path);

    /*$file= public_path('uploaded_files/' . $file_name);
    $headers = array(
              'Content-Type: application/pdf',
              'Content-Type: application/zip',
            );
    return response()->download($file, $file_name, $headers);*/

/*    $file_path = public_path('uploaded_files/' . $file_name);
return response()->download($file_path, 'new_name.docx');*/
}

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
