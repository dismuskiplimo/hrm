@extends('administrator.master')
@section('title', 'Salary List')

@section('main_content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            PAYROLL
        </h1>
        <ol class="breadcrumb">
            <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li><a>{{ env('APP_NAME') }}</a></li>
            <li class="active">Salary List</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">Salary List</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="box-body">
                <a href="{{ url('/hrm/payroll') }}" class="btn btn-primary btn-flat"><i class="fa fa-edit"></i> Manage Salary</a>
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
                            <th>Employee Name</th>
                            <th>Designation</th>
                            <th>Employee Type</th>
                            <th>Gross Salary</th>
                            <th>Deductions</th>
                            <th>Net Salary</th>
                            <th class="text-center">Updated At</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php ($sl = 1)
                        @foreach($salaries as $salary)
                        <tr>
                            <td>{{ $sl++ }}</td>
                            <td>{{ $salary['name'] }}</td>
                            <td>{{ $salary['designation'] }}</td>
                            <td>
                                @if($salary['employee_type'] == 1)
                                Provision
                                @elseif($salary['employee_type'] == 2)
                                Permanent
                                @elseif($salary['employee_type'] == 3)
                                Full Time
                                @elseif($salary['employee_type'] == 4)
                                Part Time
                                @else
                                Adhoc
                                @endif
                            </td>
                            <td>
                            @php($gross_salary = $salary['basic_salary'] + $salary['house_rent_allowance'] + $salary['medical_allowance'] + $salary['special_allowance'] + $salary['other_allowance'])
                            {{ $gross_salary }}
                            </td>
                            <td>
                            @php($total_deduction = $salary['tax_deduction'] + $salary['provident_fund_deduction'] + $salary['other_deduction'])
                            {{ $total_deduction }}
                            </td>
                            <td>{{ $gross_salary - $total_deduction }}</td>

                            <td class="text-center">{{ date("d F Y", strtotime($salary['updated_at'])) }}</td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary btn-xs btn-flat dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                        Action <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="{{ url('/hrm/payroll/details/' . $salary['id']) }}"><i class="icon fa fa-file-text"></i> Details</a></li>
                                        <li><a href="{{ url('/hrm/payroll/manage-salary/' . $salary['user_id']) }}"><i class="icon fa fa-edit"></i> Edit</a></li>
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