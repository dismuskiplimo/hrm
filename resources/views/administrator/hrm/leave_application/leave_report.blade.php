@extends('administrator.master')
@section('title', 'Leave Application Lists')

@section('main_content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Leave Reports
        </h1>
        <ol class="breadcrumb">
            <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li><a>{{ env('APP_NAME') }}</a></li>
            <li class="active">Leave Application lists</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">Leave Application lists</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="box-body">
                <div class="col-md-12">
                    <button class="btn btn-default btn-flat pull-right" onclick="printDiv('printable_area')"><i class="fa fa-print"></i> Print</button>
                    <a href="{{ url('/hrm/leave-reports/pdf-reports') }}" class="btn btn-info btn-flat pull-right"><i class="fa fa-print"></i> PDF</a>
                </div>
                <br><br>
                <div id="printable_area">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>SL</th>
                                <th>Name</th>
                                <th>ID</th>
                                <th>Designation</th> 
                                <th>Total Attendance</th>
                                <th>Total Absence</th>
                                <th>On Casual Leave</th>
                                <th>On Earned Leave</th>
                                <th>On Advance Leave</th>
                                <th>On Special Leave</th>
                                <th>Total Leave</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php($sl = 1)
                            @php($total_leave = 0)
                            @foreach($users as $user)
                            <tr>
                                <td>{{ $sl++ }}</td>
                                <td>{{ $user->name }}</td>
                                <td>{{ $user->employee_id }}</td>
                                <td>{{ $user->designation }}</td>
                                <td>
                                    @foreach($attendances as $attendance)
                                    @if($user->id == $attendance->user_id)
                                    {{ $attendance->total_attendances }}
                                    @endif
                                    @endforeach
                                </td>
                                <td>
                                    @foreach($absences as $absence)
                                    @if($user->id == $absence->user_id)
                                    {{ $absence->total_absences }}
                                    @endif
                                    @endforeach
                                </td>
                                <td>
                                    @foreach($casual_leaves as $casual_leave)
                                    @if($user->id == $casual_leave->user_id)
                                    {{ $casual_leave->total_casual_leaves }}
                                    @php($total_leave += $casual_leave->total_casual_leaves)
                                    @endif
                                    @endforeach
                                </td>
                                <td>
                                    @foreach($earned_leaves as $earned_leave)
                                    @if($user->id == $earned_leave->user_id)
                                    {{ $earned_leave->total_earned_leaves }}
                                    @php($total_leave += $earned_leave->total_earned_leaves)
                                    @endif
                                    @endforeach
                                </td> 
                                <td>
                                    @foreach($advance_leaves as $advance_leave)
                                    @if($user->id == $advance_leave->user_id)
                                    {{ $advance_leave->total_advance_leave }}
                                    @php($total_leave += $advance_leave->total_advance_leave)
                                    @endif
                                    @endforeach
                                </td> 
                                <td>
                                    @foreach($special_leaves as $special_leave)
                                    @if($user->id == $special_leave->user_id)
                                    {{ $special_leave->total_special_leave }}
                                    @php($total_leave += $special_leave->total_special_leave)
                                    @endif
                                    @endforeach
                                </td>
                                <td>
                                    {{ $total_leave }}
                                    @php($total_leave = 0)
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </section>
    <!-- /.content -->
</div>
@endsection
