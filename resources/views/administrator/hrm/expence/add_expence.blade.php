@extends('administrator.master')
@section('title', 'Add Expence')

@section('main_content')
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      ADD EXPENSES
    </h1>
    <ol class="breadcrumb">
      <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
      <li><a>{{ env('APP_NAME') }}</a></li>
      <li><a href="{{ url('/hrm/expence/manage-expence') }}">Add new expeses</a></li>
      <li class="active">Add expeses</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">

    <!-- SELECT2 EXAMPLE -->
    <div class="box box-default">
      <div class="box-header with-border">
        <h3 class="box-title">Add expeses</h3>

        <div class="box-tools pull-right">
          <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
        </div>
      </div>
      <!-- /.box-header -->
      <form action="{{ url('/hrm/expence/store') }}" method="post" name="add_form_expence">
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
              <p class="text-yellow">Enter New Accounts details. All field are required. </p>
              @endif
            </div>
            <!-- /.Notification Box -->

            <div class="col-md-6">

              <label for="opening_blance">Opening Blance <span class="text-danger">*</span></label>
             <div class="form-group{{ $errors->has('opening_blance') ? ' has-error' : '' }} has-feedback">
              <input type="text" name="opening_blance" id="opening_blance" class="form-control" value="{{ old('opening_blance') }}" placeholder="Enter Opening Blance..">
              @if ($errors->has('opening_blance'))
              <span class="help-block">
                <strong>{{ $errors->first('opening_blance') }}</strong>
              </span>
              @endif
            </div>
            <!-- /.form-group -->

            <label for="recovery_amount_on_cash">Recovery Amount On Cash <span class="text-danger">*</span></label>
             <div class="form-group{{ $errors->has('recovery_amount_on_cash') ? ' has-error' : '' }} has-feedback">
              <input type="text" name="recovery_amount_on_cash" id="recovery_amount_on_cash" class="form-control" value="{{ old('recovery_amount_on_cash') }}" placeholder="Enter Recovery Amount On Cash..">
              @if ($errors->has('recovery_amount_on_cash'))
              <span class="help-block">
                <strong>{{ $errors->first('recovery_amount_on_cash') }}</strong>
              </span>
              @endif
            </div>
            <!-- /.form-group -->

            <label for="recovery_amount_by_cheque">Recovery Amount by Cheque <span class="text-danger">*</span></label>
             <div class="form-group{{ $errors->has('recovery_amount_by_cheque') ? ' has-error' : '' }} has-feedback">
              <input type="text" name="recovery_amount_by_cheque" id="recovery_amount_by_cheque" class="form-control" value="{{ old('recovery_amount_by_cheque') }}" placeholder="Enter Recovery Amount by Cheque..">
              @if ($errors->has('recovery_amount_by_cheque'))
              <span class="help-block">
                <strong>{{ $errors->first('recovery_amount_by_cheque') }}</strong>
              </span>
              @endif
            </div>
            <!-- /.form-group -->

            <label for="bank_deposit_amount">Bank Deposit Amount <span class="text-danger">*</span></label>
             <div class="form-group{{ $errors->has('bank_deposit_amount') ? ' has-error' : '' }} has-feedback">
              <input type="text" name="bank_deposit_amount" id="bank_deposit_amount" class="form-control" value="{{ old('bank_deposit_amount') }}" placeholder="Enter Bank Deposit Amount..">
              @if ($errors->has('bank_deposit_amount'))
              <span class="help-block">
                <strong>{{ $errors->first('bank_deposit_amount') }}</strong>
              </span>
              @endif
            </div>
            <!-- /.form-group -->

            <label for="expenses_amount">Expenses Amount <span class="text-danger">*</span></label>
            <div class="form-group{{ $errors->has('expenses_amount') ? ' has-error' : '' }} has-feedback">
              <input type="text" name="expenses_amount" id="expenses_amount" class="form-control" value="{{ old('expenses_amount') }}" placeholder="Enter Expenses Amount..">
              @if ($errors->has('expenses_amount'))
              <span class="help-block">
                <strong>{{ $errors->first('expenses_amount') }}</strong>
              </span>
              @endif
            </div>
            <!-- /.form-group -->

            <label for="balance_amount">Balance amount <span class="text-danger">*</span></label>
            <div class="form-group{{ $errors->has('balance_amount') ? ' has-error' : '' }} has-feedback">
              <input type="text" name="balance_amount" id="balance_amount" class="form-control" value="{{ old('balance_amount') }}" placeholder="Enter Balance amount..">
              @if ($errors->has('balance_amount'))
              <span class="help-block">
                <strong>{{ $errors->first('balance_amount') }}</strong>
              </span>
              @endif
            </div>
            <!-- /.form-group -->


            <label for="employee_id">Employee Name <span class="text-danger">*</span></label>
            <div class="form-group{{ $errors->has('employee_id') ? ' has-error' : '' }} has-feedback">
              <select name="employee_id"  class="form-control">
                <option value="" selected disabled>Select one</option>
                @foreach( $employees as $employee )
                <option value="{{ $employee['id'] }}"> {{ $employee['name'] }} </option>
                @endforeach
              </select>
              @if ($errors->has('employee_id'))
              <span class="help-block">
                <strong>{{ $errors->first('employee_id') }}</strong>
              </span>
              @endif
            </div>
            <!-- /.form-group -->


            </div>
            <!-- /.col -->
            <div class="col-md-12">
              <label for="remarks_if_any">Remarks, if any <span class="text-danger"></span></label>
              <div class="form-group{{ $errors->has('remarks_if_any') ? ' has-error' : '' }} has-feedback">
                <textarea class="textarea" name="remarks_if_any"  placeholder="Enter Purchased Details.." style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">{{ old('remarks_if_any') }}</textarea>
                @if ($errors->has('remarks_if_any'))
                <span class="help-block">
                  <strong>{{ $errors->first('remarks_if_any') }}</strong>
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
          <a href="{{ url('/hrm/expence/manage-expence') }}" class="btn btn-danger btn-flat"><i class="icon fa fa-close"></i> Cancel</a>
          <button type="submit" class="btn btn-primary btn-flat"><i class="icon fa fa-plus"></i> Add expeses</button>
        </div>
      </form>
    </div>
    <!-- /.box -->


  </section>
  <!-- /.content -->
</div>
<script type="text/javascript">
document.forms['add_form_expence'].elements['publication_status'].value = "{{ old('publication_status') }}";
</script>
@endsection
