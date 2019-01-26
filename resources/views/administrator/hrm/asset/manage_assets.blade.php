<?php
use Carbon\Carbon;
?>
@extends('administrator.master')
@section('title', $title)

@section('main_content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            {{ $title }}
        </h1>
        <ol class="breadcrumb">
            <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li><a>{{ env('APP_NAME') }}</a></li>
            <li class="active">{{ $title }}</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">Assets</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                        <i class="fa fa-minus"></i>
                    </button>

                    <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                        <i class="fa fa-times"></i>
                    </button>
                </div>
            </div>
            <div class="box-body">
                <a href="{{ route('assets.create') }}" class="btn btn-primary btn-flat"><i class="fa fa-plus"></i> Add Asset</a>
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
                            <th>Asset Type</th>
                            <th>Brand</th>
                            <th>Model</th>
                            <th>S/N</th>
                            <th>Assigned ?</th>
                            <th>Assigned To</th>
                            <th>Created at</th>
                            <th class="text-center">Status</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    @php ($sl = 1)
                    @foreach($assets as $asset)
                      <tr>
                        <td>{{ $sl++ }}</td>
                        <td>{{ $asset->asset_type }}</td>
                        <td>{{ $asset->brand }}</td>
                        <td>{{ $asset->model }}</td>
                        <td>{{ $asset->serial_number }}</td>
                        <td>{{ $asset->assigned ? 'YES' : 'NO' }}</td>
                        <td>{{ $asset->user ? $asset->user->name : 'N/A' }}</td>
                        <td>{{ $asset->created_at }}</td>

                        <td class="text-center">
                            @if($asset->assigned)
                                <a href="" class="btn btn-success btn-xs btn-flat btn-block" data-toggle="tooltip" data-original-title="Assigned"><i class="icon fa fa-smile-o"> Assigned </i></a>
                            @elseif($asset->disposed)
                                <a href="" class="btn btn-danger btn-xs btn-flat btn-block" data-toggle="tooltip" data-original-title="Disposed"><i class="icon fa fa-flag"></i> Disposed</a>
                            @else
                                <a href="" class="btn btn-warning btn-xs btn-flat btn-block" data-toggle="tooltip" data-original-title="Not Assigned"><i class="icon fa fa-flag"></i> Not Assigned</a>
                            @endif
                        </td>

                        <td>

                            <div class="btn-group">
                                <button type="button" class="btn btn-primary btn-xs btn-flat dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    Action <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="{{ url('/hrm/assets/' . $asset->id . '/view') }}"><i class="icon fa fa-file-text"></i> Details</a></li>

                                    

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
