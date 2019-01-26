<?php
use Carbon\Carbon;
?>
@extends('administrator.master')
@section('title', 'Show Leave Application')

@section('main_content')
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Show Leave Application
    </h1>
    <ol class="breadcrumb">
      <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
      <li><a>{{ env('APP_NAME') }}</a></li>
      <li><a href="{{ url('/hrm/leave_application') }}">Manage Leave Application</a></li>
      <li class="active">Details</li>
    </ol>
  </ol>
</section>

<!-- Main content -->
<section class="content">
  <!-- Default box -->
  <div class="box">
    <div class="box-header with-border">
      <h3 class="box-title"> Leave Application</h3>

      <div class="box-tools pull-right">
        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
      </div>
    </div>
    <div class="box-body">
      <a href="{{ url('/hrm/leave_application') }}" class="btn btn-primary btn-flat"><i class="fa fa-arrow-left"></i> Back</a>
      <button class="btn btn-default btn-flat pull-right" onclick="printDiv('printable_area')"><i class="fa fa-print"></i> Print</button>
      <hr>
      
      <div id="printable_area">
        <div class="text-center">
          <h4><strong>APPLICATION FOR LEAVE</strong></h4>
        </div>
      <table id="example1" class="table table-bordered table-striped">
        <tbody>

          <tr>
            <td width="25%">Name of Applicant</td>
            <td width="75%">{{ $leave_application['name'] }}</td>
          </tr>
          <tr>
            <td width="25%">ID No.</td>
            <td width="75%">{{ $leave_application['employee_id'] }}</td>
          </tr>
          <tr>
            <td width="25%">Designation</td>
            <td width="75%">{{ $leave_application['designation'] }}</td>
          </tr>
          <tr>
            <td>Leave Category</td>
            <td>{{ $leave_application['leave_category'] }}</td>
          </tr>
          <tr>
            <td>Start Date</td>
            <td>{{ date("d F Y", strtotime( $leave_application['start_date'] )) }}</td>
          </tr>
          <tr>
            <td>End date</td>
            <td>{{ date("d F Y", strtotime($leave_application['end_date'])) }}</td>
          </tr>
          <tr>
            <td>Leave Days</td>
            <td>
              {{ $leave_application['days'] }}
            </td>
          </tr>
          <tr>
            <td width="25%">Reason for Leave</td>
            <td width="75%">{!! $leave_application['reason'] !!}</td>
          </tr>
           <tr>
            <td width="25%">Date of return from Last Leave</td>
            <td width="75%">{{ $leave_application['last_leave_date'] ? date("d F Y", strtotime($leave_application['last_leave_date'])) : 'N/A' }}</td>
          </tr>
          <tr>
            <td width="25%">Period of Last Leave</td>
            <td width="75%">{{ $leave_application['last_leave_period'] ? $leave_application['last_leave_period'] . ' Days' : 'N/A' }}</td>
          </tr>
          <tr>
            <td width="25%">Category of Last Leave</td>
            <td width="75%">{{ $leave_application['leave_category'] ? : 'N/A' }}</td>
          </tr>
          <tr>
            <td width="25%">Leave Address</td>
            <td width="75%">{!! $leave_application['leave_address'] !!}</td>
          </tr>
          <tr>
            <td width="25%">Performing person during leave</td>
            <td width="75%">{{ $leave_application['during_leave'] }}</td>
          </tr>

          <tr>
            <td width="25%">Recommender</td>
            <td width="75%">{{ $leave_application['recommender_id'] }}</td>
          </tr>

          <tr>
            <td width="25%">Recommended?</td>
            <td width="75%">{{ $leave_application['recommended'] ? 'YES' : 'NO' }}</td>
          </tr>

          <tr>
            <td width="25%">Recommender Message</td>
            <td width="75%">{{ $leave_application['recommender_message'] }}</td>
          </tr>   
          <tr>
            <td>Apply date</td>
            <td>{{ date("D d F Y h:ia", strtotime($leave_application['created_at'])) }}</td>
          </tr>
        </tbody>
      </table>

      <div style="border: 0px solid black; margin-bottom: 30px;">
        <strong style="margin-left: 650px;">Signature of Applicant</strong>
      </div>

      <div style="border: 0px solid black;"> 
        <h4><strong>For Office Use only</strong></h4>
      </div>
     
      <table style="margin-bottom: 20px;" class="table table-bordered table-striped">

        <tbody>
        
          <tr>
            <td colspan="3" style="text-align: center;"><strong>ACTION ON APPLICATION</strong></td>
            
          </tr>

          <tr>
            <td>
              <div style="text-align: center;">
              <h4 style="letter-spacing: 5px;"> APPROVED FOR</h4>
              <p style="text-align: center;">...........Days With Pay</p>              
              <p style="text-align: center;">...........Days without pay</p>              
              <p style="text-align: center;">...........others</p>
            </div>
            </td>
            
            <td>
              <div style="text-align: center; letter-spacing: 5px;">
            <h4> DISAPPROVED DUE TO </h4>
          </div>
          </td>

          <td>
              <div style="text-align: center; letter-spacing: 5px;">
            <h4> Remarks </h4>
          </div>
          </td>


          </tr>
        </tbody>
      </table>
      <br>
      <hr style="padding-bottom: 0px; border: 1px solid black;">
      <div style="margin-top: -20px; margin-left: 750px;">
        <strong>Head of Chamber</strong>
      </div>
    </div><!--pintable-->
  </div>
  <!-- /.box-body -->
</div>
<!-- /.box -->
</section>
<!-- /.content -->
</div>
@endsection
