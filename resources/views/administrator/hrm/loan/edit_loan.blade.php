@extends('administrator.master')
@section('title', 'Edit Loan')

@section('main_content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            LOAN
        </h1>
        <ol class="breadcrumb">
            <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li><a href="{{ url('/hrm/loans') }}">Manage Loans</a></li>
            <li class="active">Edit Loan</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <!-- SELECT2 EXAMPLE -->
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Edit Loan</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <form action="{{ url('/hrm/loans/update/' . $loan['id']) }}" method="post" name="loan_add_form">
                {{ csrf_field() }}
                <div class="box-body">
                    <div class="row">
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
                            @else
                                <p class="text-yellow">Enter loan details. All field are required. </p>
                            @endif
                        </div>
                        <!-- /.Notification Box -->

                        <div class="col-md-6">
                            <label for="user_id">Employee Name <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('user_id') ? ' has-error' : '' }} has-feedback">
                                <select name="user_id" id="user_id" class="form-control">
                                    <option value="" selected disabled>Select one</option>
                                    @foreach($users as $user)
                                    <option value="{{ $user['id'] }}">{{ $user['name'] }}</option>
                                    @endforeach
                                </select>
                                @if ($errors->has('user_id'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('user_id') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="loan_name">Loan Name <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('loan_name') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="loan_name" id="loan_name" class="form-control" value="{{ $loan['loan_name'] }}" placeholder="Enter loan name..">
                                @if ($errors->has('loan_name'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('loan_name') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->
                            
                            <label for="loan_amount">Loan Amount <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('loan_amount') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="loan_amount" id="loan_amount" class="form-control" value="{{ $loan['loan_amount'] }}" placeholder="Enter loan name..">
                                @if ($errors->has('loan_amount'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('loan_amount') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="number_of_installments">Number of Installments <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('number_of_installments') ? ' has-error' : '' }} has-feedback">
                                    <input type="text" name="number_of_installments" class="form-control pull-right" value="{{ $loan['number_of_installments'] }}" id="number_of_installments">
                                @if ($errors->has('number_of_installments'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('number_of_installments') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="remaining_installments">Remaining Installments<span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('remaining_installments') ? ' has-error' : '' }} has-feedback">
                                    <input type="text" name="remaining_installments" class="form-control pull-right" value="{{ $loan['remaining_installments'] }}" id="remaining_installments">
                                @if ($errors->has('remaining_installments'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('remaining_installments') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->
                            
                        </div>
                        <!-- /.col -->
                        <div class="col-md-12">
                            <label for="loan_description">Loan Description <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('loan_description') ? ' has-error' : '' }} has-feedback">
                                <textarea class="textarea" name="loan_description" id="loan_description" placeholder="Enter client description.." style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">{{ $loan['loan_description'] }}</textarea>
                                @if ($errors->has('loan_description'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('loan_description') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <a href="{{ url('/hrm/loans') }}" class="btn btn-danger btn-flat"><i class="icon fa fa-close"></i> Cancel</a>
                    <button type="submit" class="btn btn-primary btn-flat"><i class="icon fa fa-edit"></i> Update loan</button>
                </div>
            </form>
        </div>
        <!-- /.box -->


    </section>
    <!-- /.content -->
</div>
<script type="text/javascript">
    document.forms['loan_add_form'].elements['user_id'].value = "{{ $loan['user_id'] }}";
</script>
@endsection
