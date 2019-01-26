@extends('administrator.master')
@section('title', 'Show Employee Award')

@section('main_content')
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Show Employee Award
    </h1>
    <ol class="breadcrumb">
      <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
      <li><a>{{ env('APP_NAME') }}</a></li>
      <li><a href="{{ url('/hrm/employee-awards') }}">Show Employee Award</a></li>
      <li class="active">Details</li>
    </ol>
  </ol>
</section>

<!-- Main content -->
<section class="content">
  <!-- Default box -->
  <div class="box">
    <div class="box-header with-border">
      <h3 class="box-title">Show Employee Award</h3>

      <div class="box-tools pull-right">
        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
      </div>
    </div>
    <div class="box-body">
      <a href="{{ url('/hrm/employee-awards') }}" class="btn btn-primary btn-flat"><i class="fa fa-arrow-left"></i> Back</a>

      <button type="button" class="btn btn-default btn-flat pull-right" onclick="printDiv('printable_area')">
          <i class="fa fa-print"></i> Print</button>

      <hr>
      <div id="printable_area">
        <table class="table table-bordered table-striped">
          <tbody>
            <tr>
              <td width="25%">Employee Name</td>
              <td width="75%">
               @foreach($employees as $employee)
               @if($employee['id'] == $employee_aword['employee_id'])
               {{ $employee['name'] }}
               @endif
               @endforeach
             </td>
           </tr>
           <tr>
            <td>Award Category</td>
            <td>{{  $employee_aword['award_title']  }}</td>
          </tr>
          <tr>
            <td>Gift Item</td>
            <td>{{  $employee_aword['gift_item']  }}</td>
          </tr>
          <tr>
            <td>Month </td>
            <td>{{ date("d F Y", strtotime($employee_aword['select_month'])) }}</td>
          </tr>
          <tr>
            <td>Award Details</td>
            <td>{!! $employee_aword['description'] !!}</td>
          </tr>

          <tr>
            <td>Created at</td>
            <td>{{ date("D d F Y h:ia", strtotime($employee_aword['created_at'])) }}</td>
          </tr>
        </tr>
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
