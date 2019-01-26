@extends('administrator.master')
@section('title', 'Job types')

@section('main_content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            JOB TYPES
        </h1>
        <ol class="breadcrumb">
            <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li><a>Setting</a></li>
            <li class="active">Job Types</li>
        </ol>
    </section>

    <!-- Main content -->
    <section c                        lass="content">
        <!-- Default box -->
        <div class="box">
            <div class="box-header wi                                    th-border">
                <h3 class="box-title">Manage job types</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"                                                                                                     data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool"                                                                                                                        data-widget="remove" d                                                                                                                    ata-toggle="tooltip                                                                                                                    " title="Remove"><i class="fa fa-ti                                                                                                                        mes"></i></button>
                </div>
            </div>
            <div class="box-body">
                <a href="{{ url('/setting/job-types/create') }}" class="btn btn-primary btn-flat"><i class="fa fa-plus"></i> Add job type</a>
                <hr>
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
                            <th width="5%">SL#</th>
                            <th width="20%">Job Type</th>
                            <th width="40%">Job Type Description</th>
                            <th width="13%" class="text-center">Added</th>
                            <th width="10%" class="text-center">Status</th>
                            <th width="12%" class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php ($sl = 1) 
                        @foreach($job_types as $job_type)
                        <tr>
                            <td>{{ $sl++ }}</td>
                            <td>{{ $job_type['job_type'] }}</td>
                            <td>{!! str_limit($job_type['job_type_description'], 65) !!}</td>
                            <td class="text-center">{{ date("d F Y", strtotime($job_type['created_at'])) }}</td>
                            <td class="text-center">
                                @if ($job_type['publication_status'] == 1)
                                <a href="{{ url('/setting/job-types/unpublished/' . $job_type['id']) }}" class="btn btn-success btn-xs btn-flat btn-block" data-toggle="tooltip" data-original-title="Unpublished"><i class="icon fa fa-arrow-down"> Published</i></a>
                                @else
                                <a href="{{ url('/setting/job-types/published/' . $job_type['id']) }}" class="btn btn-warning btn-xs btn-flat btn-block" data-toggle="tooltip" data-original-title="Published"><i class="icon fa fa-arrow-up"></i> Unpublished</a>
                                @endif
                            </td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary btn-xs btn-flat dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                        Action <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="{{ url('/setting/job-types/details/' . $job_type['id']) }}"><i class="icon fa fa-file-text"></i> Details</a></li>
                                        <li><a href="{{ url('/setting/job-types/edit/' . $job_type['id']) }}"><i class="icon fa fa-edit"></i> Edit</a></li>
                                        <li><a href="{{ url('/setting/job-types/delete/' . $job_type['id']) }}" onclick="return confirm('Are you sure to delete this ?');"><i class="icon fa fa-trash"></i> Delete</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
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