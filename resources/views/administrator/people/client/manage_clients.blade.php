@extends('administrator.master')
@section('title', 'Clients')

@section('main_content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            CLIENTS
        </h1>
        <ol class="breadcrumb">
            <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li><a>People</a></li>
            <li class="active">Clients</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">Manage clients</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="box-body">
                <a href="{{ url('/people/clients/create') }}" class="btn btn-primary btn-flat"><i class="fa fa-plus"></i> Add client</a>
                <a href="{{ url('/people/clients/print') }}" class="tip btn btn-info btn-flat pull-right" title="Print" data-original-title="Label Printer"> <i class="fa fa-print"></i><span class="hidden-sm hidden-xs"> Print</span>
                </a>
                <a href="{{ url('/people/clients/clients-pdf') }}" class="tip btn btn-default btn-flat pull-right" title="PDF" data-original-title="Label Printer"> <i class="fa fa-file-pdf-o"></i><span class="hidden-sm hidden-xs"> PDF</span>
                </a>
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
                            <th>SL#</th>
                            <th>Client Name</th>
                            <th>Client Type</th>
                            <th>Contact No</th>
                            <th>Address</th>
                            <th class="text-center">Added</th>
                            <th class="text-center">Status</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        {{ $sl = 1 }}
                        @foreach($clients as $client)
                        <tr>
                            <td>{{ $sl++ }}</td>
                            <td>{{ $client['name'] }}</td>
                            <td>{{ $client['client_type'] }}</td>
                            <td>{{ $client['contact_no_one'] }}</td>
                            <td>{{ $client['present_address'] }}</td>
                            <td class="text-center">{{ date("d F Y", strtotime($client['created_at'])) }}</td>
                            <td class="text-center">
                                @if ($client['activation_status'] == 1)
                                <a href="{{ url('/people/clients/deactive/' . $client['id']) }}" class="btn btn-success btn-xs btn-flat btn-block" data-toggle="tooltip" data-original-title="Click to deactive"><i class="icon fa fa-arrow-down"> Active</i></a>
                                @else
                                <a href="{{ url('/people/clients/active/' . $client['id']) }}" class="btn btn-warning btn-xs btn-flat btn-block" data-toggle="tooltip" data-original-title="Click to active"><i class="icon fa fa-arrow-up"></i> Deactive</a>
                                @endif
                            </td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary btn-xs btn-flat dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> Action <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="{{ url('/people/clients/details/' . $client['id']) }}"><i class="icon fa fa-file-text"></i> Details</a></li>
                                        <li><a href="{{ url('/people/clients/edit/' . $client['id']) }}"><i class="icon fa fa-edit"></i> Edit</a></li>
                                        <li><a href="{{ url('/people/clients/delete/' . $client['id']) }}" onclick="return confirm('Are you sure to delete this ?');"><i class="icon fa fa-trash"></i> Delete</a></li>
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