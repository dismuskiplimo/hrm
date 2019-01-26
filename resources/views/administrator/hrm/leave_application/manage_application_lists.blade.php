<?php
use Carbon\Carbon;
?>
@extends('administrator.master')
@section('title', 'Leave Application Lists')

@section('main_content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Leave Application
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

                <!-- Notification Box -->
                <div class="col-md-12">
                    @if (!empty(Session::get('message')))
                    <div class="alert alert-success alert-dismissible" id="notification_box">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <i class="icon fa fa-check"></i> {{ Session::get('message') }}
                    </div>
                    @elseif (!empty(Session::get('exception')))
                    <div class="alert alert-warning alert-dismissible" id="notification_box">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <i class="icon fa fa-warning"></i> {{ Session::get('exception') }}
                    </div>
                    @endif
                </div>
                <!-- /.Notification Box -->
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>SL#</th>
                            <th>Employee Name</th>
                            <th>Reason</th>
                            <th>Starts Date</th>
                            <th>End Date</th>
                            <th>Leave Days</th>
                            <th>Leave category</th>
                            <th>Created at</th>
                            <th class="text-center">Status</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    @php ($sl = 1)
                    @foreach($leave_applications as $leave_application)
                      <tr>
                        <td>{{  $sl++ }}</td>
                        <td>{{ $leave_application['name'] }}</td>
                        <td>{!! str_limit($leave_application['reason'], 65) !!}</td>
                        <td>{{ date('d/m/Y', strtotime($leave_application['start_date'])) }}</td>
                        <td>{{ date('d/m/Y', strtotime($leave_application['end_date'])) }}</td>
                        <td class="text-center">
                           
                            {{ $leave_application['days'] }}
                        </td>
                        <td>{{ $leave_application['leave_category'] }}</td>
                        <td>{{ date("D d F Y h:ia", strtotime($leave_application['created_at'])) }}</td>

                        <td class="text-center">
                        @if($leave_application['publication_status'] == 0)
                        <a href="" class="btn btn-warning btn-xs btn-flat btn-block" data-toggle="tooltip" data-original-title="Pending"><i class="icon fa fa-hourglass-2"></i> Pending</a>
                        @elseif($leave_application['publication_status'] == 1)
                          <a href="" class="btn btn-success btn-xs btn-flat btn-block" data-toggle="tooltip" data-original-title="Accepted"><i class="icon fa fa-smile-o"> Accepted</i></a>
                        @else
                          <a href="" class="btn btn-danger btn-xs btn-flat btn-block" data-toggle="tooltip" data-original-title="Not Accepted"><i class="icon fa fa-flag"></i> Not Accepted</a>
                        @endif
                      </td>

                        <td>
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary btn-xs btn-flat dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                Action <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="{{ url('/hrm/application_lists/' .$leave_application['id']) }}"><i class="icon fa fa-file-text"></i> Details</a></li>

                                <li><a  href="{{ url('/hrm/leave_application/approved/' .$leave_application['id']) }}"><i class="icon fa fa-file-text"></i> Approved</a></li>

                                <li><a href="{{ url('/hrm/leave_application/not_approved/' .$leave_application['id']) }}"><i class="icon fa fa-file-text"></i> Not Approed</a></li>

                            </ul>
                        </div>
                    </td>
                @endforeach



            </tbody>
        </table>
    </div>
    <!-- /.box-body -->
</div>
<!-- /.box -->
</section>
<!-- /.content -->
</div>
@endsection
