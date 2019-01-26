@extends('administrator.master')
@section('title', 'Notice')

@section('main_content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            NOTICE
        </h1>
        <ol class="breadcrumb">
            <li><a href=""><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li><a href="">Notice</a></li>
            <li class="active">Details</li>
        </ol>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    @foreach($notices as $notice)
    <div class="row">

        <div class="col-md-3">

            <!-- Profile Image -->
            <div class="box box-primary">
                <div class="box-body box-profile">

                    <ul class="list-group list-group-unbordered">
                        <li class="list-group-item">
                            <b>Created At: <br> {{ date("D d F Y h:ia", strtotime($notice['created_at'])) }} </b> 
                        </li>
                        <li class="list-group-item">
                            <b>Created By: <br> {{ $notice['name'] }} </b> 
                        </li>
                       
                    </ul>
                    
                 <strong><i class="fa fa-info-circle margin-r-5"></i> Status</strong>

                 <p>
                    
                    <span class="label label-success">notice</span>

                </p>

            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </div>
    <!-- /.col -->
    <div class="col-md-9">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#job_details" data-toggle="tab" aria-expanded="true">Notice</a></li>

            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="job_details">

                    <!-- notice details -->
                    <table id="example1" class="table table-bordered table-striped">
                        <tbody>
                            <tr>
                                <td><strong>{{ $notice['notice_title'] }}</strong></td>
                            </tr>
                            
                            <tr>
                                <td style="text-align: justify;">{!! $notice['description'] !!}</td>
                                
                            </tr>
                            
                            </tbody>
                        </table>
                        <!-- /.notice details -->
                    </div>
                  
                    </div>
                    <!-- /.tab-content -->
                </div>
                <!-- /.nav-tabs-custom -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
        @endforeach

        <div style="text-align: center;">
            {{ $notices->links() }}
        </div>

    </section>
    <!-- /.content -->
</div>

@endsection