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
                <h3 class="box-title">My Payslips</h3>

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
                
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>SL#</th>
                            <th>Employee Name</th>
                            <th>Designation</th>
                            <th>Salary Month</th>
                            <th>Gross Salary</th>
                            <th>Total Deduction</th>
                            <th>Net Salary</th>
                            <th>Provident Fund</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    @php ($sl = 1)
                    @foreach($salary_payments as $payment)
                      <tr>
                        <td>{{ $sl++ }}</td>
                        <td>{{ $payment->user->name }}</td>
                        <td>{{ $payment->user->designation ? $payment->user->designation->designation : 'N/A' }}</td>
                        <td>{{ $payment->payment_month }}</td>
                        <td>{{ $payment->gross_salary }}</td>
                        <td>{{ $payment->total_deduction }}</td>
                        <td>{{ $payment->net_salary }}</td>
                        <td>{{ $payment->provident_fund }}</td>
                        <td><a href="{{ route('payroll.details.view', ['id' => $payroll]) }}"><i class="fa fa-eye"></i></a></td>
                        

                        
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
