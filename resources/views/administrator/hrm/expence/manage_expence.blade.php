@extends('administrator.master')
@section('title', 'Manage Expence')

@section('main_content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
           Manage daily accounts report
        </h1>
        <ol class="breadcrumb">
            <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li><a>{{ env('APP_NAME') }}</a></li>
            <li class="active">Manage daily accounts report</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">Manage daily accounts</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="box-body">
                <a href="{{ url('/hrm/expence/add-expence') }}" class="btn btn-primary btn-flat"><i class="fa fa-plus"></i> add new accounts</a>
                <button type="button" class="tip btn btn-primary btn-flat" title="Print" data-original-title="Label Printer" onclick="printDiv('printable_area')">
                    <i class="fa fa-print"></i>
                    <span class="hidden-sm hidden-xs"> Print</span>
                </button>
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
                <div id="printable_area">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>SL</th>
                            <th>Created at</th>
                            <th>Created By</th>
                            <th>Opening Blance</th>
                            <th>Recovery Amount On Cash</th>
                            <th>Recovery Amount by Cheque </th>
                            <th>Bank Deposit Amount</th>
                            <th>Expenses Amount </th>
                            <th>Balance amount</th>
                            <th>Remarks</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php ($sl = 1)
                        @foreach($expence_management as $v_expence_management)
                        <tr>
                            <td>{{ $sl ++ }}</td>
                            <td>
                              {{ date("D d F Y h:ia", strtotime($v_expence_management['created_at'])) }}
                            </td>
                            <td>
                                @foreach($employees as $employee)
                                @if($employee['id'] == $v_expence_management['employee_id'])
                                {{ $employee['name'] }}
                                @endif
                                @endforeach
                            </td>
                            <td>{{ $v_expence_management['opening_blance'] }}</td>
                            <td>{{ $v_expence_management['recovery_amount_on_cash'] }}</td>
                            <td>{{ $v_expence_management['recovery_amount_by_cheque'] }}</td>
                            <td>{{ $v_expence_management['bank_deposit_amount'] }}</td>
                            <td>{{ $v_expence_management['expenses_amount'] }}</td>
                            <td>{{ $v_expence_management['balance_amount'] }}</td>
                            <td>{!! $v_expence_management['remarks_if_any'] !!}</td>

                        </tr>
                        @endforeach

                    </tbody>
                </table>
            </div><!--printable-->
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </section>
    <!-- /.content -->
</div>
@endsection
