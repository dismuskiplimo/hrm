@extends('administrator.master')
@section('title', 'Details of job type')

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
            <li><a href="{{ url('/setting/job-types') }}">Job types</a></li>
            <li class="active">Details</li>
        </ol>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">Details of job type</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="box-body">
                <a href="{{ url('/setting/job-types') }}" class="btn btn-primary btn-flat"><i class="fa fa-arrow-left"></i> Back</a>
                <hr>
                <table id="example1" class="table table-bordered table-striped">
                    <tbody>
                        <tr>
                            <td width="25%">Job Type</td>
                            <td width="75%">{{ $job_type->job_type }}</td>
                        </tr>
                        <tr>
                            <td>Job Type Description</td>
                            <td>{!! $job_type->job_type_description !!}</td>
                        </tr>
                        <tr>
                            <td>Create By</td>
                            <td>{{ $job_type->name }}</td>
                        </tr>
                        <tr>
                            <td>Date Added</td>
                            <td>{{ date("D d F Y h:ia", strtotime($job_type->created_at)) }}</td>
                        </tr>
                        <tr>
                            <td>Last Updated</td>
                            <td>{{ date("D d F Y h:ia", strtotime($job_type->updated_at)) }}</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="btn-group btn-group-justified">
                                    @if ($job_type->publication_status == 1)
                                        <div class="btn-group">
                                            <a href="{{ url('/setting/job-types/unpublished/' . $job_type->id)}}" class="tip btn btn-success btn-flat" data-toggle="tooltip" data-original-title="Unpublished">
                                                <i class="fa fa-arrow-down"></i>
                                                <span class="hidden-sm hidden-xs"> Published</span>
                                            </a>
                                        </div>
                                   @else
                                        <div class="btn-group">
                                            <a href="{{ url('/setting/job-types/published/' . $job_type->id)}}" class="tip btn btn-warning btn-flat" data-toggle="tooltip" data-original-title="Published">
                                                <i class="fa fa-arrow-up"></i>
                                                <span class="hidden-sm hidden-xs"> Unpublished</span>
                                            </a>
                                        </div>
                                    @endif
                                    <div class="btn-group">
                                        <a href="#" class="tip btn btn-primary btn-flat" title="" data-original-title="Label Printer">
                                            <i class="fa fa-print"></i>
                                            <span class="hidden-sm hidden-xs"> Print</span>
                                        </a>
                                    </div>
                                    <div class="btn-group">
                                        <a href="#" class="tip btn btn-primary btn-flat" title="" data-original-title="PDF">
                                            <i class="fa fa-file-pdf-o"></i>
                                            <span class="hidden-sm hidden-xs"> PDF</span>
                                        </a>
                                    </div>
                                    <div class="btn-group">
                                        <a href="{{ url('/setting/job-types/edit/' . $job_type->id) }}" class="tip btn btn-warning tip btn-flat" title="" data-original-title="Edit Product">
                                            <i class="fa fa-edit"></i>
                                            <span class="hidden-sm hidden-xs"> Edit</span>
                                        </a>
                                    </div>
                                    <div class="btn-group">
                                        <a href="{{ url('/setting/job-types/delete/' . $job_type->id) }}" onclick="return confirm('Are you sure to delete this ?');" class="tip btn btn-danger bpo btn-flat" title="" data-content="<div style='width:150px;'><p>Are you sure?</p><a class='btn btn-danger' href='https://btrc.gunitok.com/products/delete/1'>Yes I'm sure</a> <button class='btn bpo-close'>No</button></div>" data-html="true" data-placement="top" data-original-title="<b>Delete Product</b>">
                                            <i class="fa fa-trash-o"></i>
                                            <span class="hidden-sm hidden-xs"> Delete</span>
                                        </a>
                                    </div>
                                </div>
                            </td>
                        </tr>
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