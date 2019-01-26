<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\PersonalEvent;

class PersonalEventController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $personal_events = PersonalEvent::query()
        ->leftjoin('users as users','users.id', '=', 'personal_events.created_by')
        ->orderBy('personal_events.personal_event', 'ASC')
        ->where('personal_events.deletion_status', 0)
        ->get([
            'personal_events.*',
            'users.name',
        ])
        ->toArray();
        //return dd($personal_events);
        return view('administrator.setting.personal_event.manage_personal_events', compact('personal_events'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        return view('administrator.setting.personal_event.add_personal_event');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        $personal_event = $this->validate(request(), [
            'personal_event' => 'required|unique:personal_events|max:100',
            'start_date' => 'required',
            'end_date' => 'required',
            'publication_status' => 'required',
            'personal_event_description' => 'required',
        ]);

        $result = PersonalEvent::create($personal_event + ['created_by' => auth()->user()->id]);
        $inserted_id = $result->id;

        if (!empty($inserted_id)) {
            return redirect('/setting/personal-events/create')->with('message', 'Add successfully.');
        }
        return redirect('/setting/personal-events/create')->with('exception', 'Operation failed !');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function published($id) {
        $affected_row = PersonalEvent::where('id', $id)
        ->update(['publication_status' => 1]);

        if (!empty($affected_row)) {
            return redirect('/setting/personal-events/')->with('message', 'Published successfully.');
        }
        return redirect('/setting/personal-events/')->with('exception', 'Operation failed !');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function unpublished($id) {
        $affected_row = PersonalEvent::where('id', $id)
        ->update(['publication_status' => 0]);

        if (!empty($affected_row)) {
            return redirect('/setting/personal-events/')->with('message', 'Unpublished successfully.');
        }
        return redirect('/setting/personal-events/')->with('exception', 'Operation failed !');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $personal_event = PersonalEvent::query()
        ->leftjoin('users as users','users.id', '=', 'personal_events.created_by')
        ->orderBy('personal_events.personal_event', 'ASC')
        ->where('personal_events.id', $id)
        ->where('personal_events.deletion_status', 0)
        ->first([
            'personal_events.*',
            'users.name',
        ])
        ->toArray();
        return view('administrator.setting.personal_event.show_personal_event', compact('personal_event'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $personal_event = PersonalEvent::find($id)->toArray();
        return view('administrator.setting.personal_event.edit_personal_event', compact('personal_event'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        $personal_event = PersonalEvent::find($id);
        $this->validate(request(), [
            'personal_event' => 'required|max:100',
            'start_date' => 'required',
            'end_date' => 'required',
            'publication_status' => 'required',
            'personal_event_description' => 'required',
        ]);

        $personal_event->personal_event = $request->get('personal_event');
        $personal_event->start_date = $request->get('start_date');
        $personal_event->end_date = $request->get('end_date');
        $personal_event->personal_event_description = $request->get('personal_event_description');
        $personal_event->publication_status = $request->get('publication_status');
        $affected_row = $personal_event->save();

        if (!empty($affected_row)) {
            return redirect('/setting/personal-events/')->with('message', 'Update successfully.');
        }
        return redirect('/setting/personal-events/')->with('exception', 'Operation failed !');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $affected_row = PersonalEvent::where('id', $id)
        ->update(['deletion_status' => 1]);

        if (!empty($affected_row)) {
            return redirect('/setting/personal-events/')->with('message', 'Delete successfully.');
        }
        return redirect('/setting/personal-events/')->with('exception', 'Operation failed !');
    }

}
