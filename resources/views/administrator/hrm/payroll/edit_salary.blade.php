@extends('administrator.master')
@section('title', 'Manage Salary Details')

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
      <li class="active">Manage Salary Details</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-md-12">
        <!-- Default box -->
        <div class="box box-primary">
          <div class="box-header with-border">
            <h3 class="box-title">Manage Salary Details</h3>

            <div class="box-tools pull-right">
              <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
              <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
            </div>
          </div>
          <div class="box-body">
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
            <div class="col-md-12">
              <form class="form-horizontal" name="employee_select_form" action="{{ url('/hrm/payroll/go') }}" method="post">
                {{ csrf_field() }}

                <div class="form-group{{ $errors->has('user_id') ? ' has-error' : '' }}">
                  <label for="user_id" class="col-sm-3 control-label">Employee Name</label>
                  <div class="col-sm-6">
                    <select name="user_id" class="form-control" id="user_id">
                      <option selected disabled>Select One</option>
                      @foreach($employees as $employee)
                      <option value="{{ $employee['id'] }}">{{ $employee['name'] }}</option>
                      @endforeach
                    </select>
                    @if ($errors->has('user_id'))
                    <span class="help-block">
                      <strong>{{ $errors->first('user_id') }}</strong>
                    </span>
                    @endif
                  </div>
                </div>
                <div class="form-group{{ $errors->has('basic_salary') ? ' has-error' : '' }}">
                  <div class=" col-sm-offset-3 col-sm-6">
                    <button type="submit" class="btn btn-info btn-flat"><i class="icon fa fa-arrow-right"></i> Go</button>
                  </div>
                </div>
              </form>
            </div>
            <!-- /. end col -->
          </div>
          <!-- /.box-body -->
          <div class="box-footer clearfix"></div>
          <!-- /.box-footer -->
        </div>
        <!-- /.box -->
      </div>
      <!-- /.end.col -->

      <form name="employee_salary_form" id="employee_salary_form" action="{{ url('/hrm/payroll/update/' . $salary['id']) }}" method="post">
        {{ csrf_field() }}

        <div class="col-md-12">
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Salary Details</h3>
            </div>
            <!-- /.box-header -->
            <div class="form-horizontal">
              <div class="box-body">
                <div class="form-group{{ $errors->has('employee_type') ? ' has-error' : '' }}">
                  <label for="employee_type" class="col-sm-3 control-label">Employee Type</label>
                  <div class="col-sm-6">
                    <select name="employee_type" class="form-control" id="employee_type">
                      <option selected disabled>Select One</option>
                      <option value="1">Provision</option>
                      <option value="2">Permanent</option>
                      <option value="3">Full Time</option>
                      <option value="4">Part Time</option>
                      <option value="5">Adhoc</option>
                    </select>
                    @if ($errors->has('employee_type'))
                    <span class="help-block">
                      <strong>{{ $errors->first('employee_type') }}</strong>
                    </span>
                    @endif
                  </div>
                </div>
                <div class="form-group{{ $errors->has('basic_salary') ? ' has-error' : '' }}">
                  <label for="basic_salary" class="col-sm-3 control-label">Basic Salary</label>
                  <div class="col-sm-6">
                    <input type="number" name="basic_salary" class="form-control" id="basic_salary" value="{{ $salary['basic_salary'] }}" placeholder="Enter basic salary..">
                    @if ($errors->has('basic_salary'))
                    <span class="help-block">
                      <strong>{{ $errors->first('basic_salary') }}</strong>
                    </span>
                    @endif
                  </div>
                </div>
              </div>
              <!-- /.box-body -->
            </div>
          </div>
        </div>
        <!-- /.end.col -->
        <div class="col-md-6">
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">Allowances</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="form-group{{ $errors->has('house_rent_allowance') ? ' has-error' : '' }}">
                <label for="house_rent_allowance">House Rent Allowance</label>
                <input type="number" name="house_rent_allowance" value="{{ $salary['house_rent_allowance'] }}" class="form-control" id="house_rent_allowance" placeholder="Enter house rent allowance..">
                @if ($errors->has('house_rent_allowance'))
                <span class="help-block">
                  <strong>{{ $errors->first('house_rent_allowance') }}</strong>
                </span>
                @endif
              </div>
              <div class="form-group{{ $errors->has('medical_allowance') ? ' has-error' : '' }}">
                <label for="medical_allowance">Medical Allowance</label>
                <input type="number" name="medical_allowance" value="{{ $salary['medical_allowance'] }}" class="form-control" id="medical_allowance" placeholder="Enter medical allowance..">
                @if ($errors->has('medical_allowance'))
                <span class="help-block">
                  <strong>{{ $errors->first('medical_allowance') }}</strong>
                </span>
                @endif
              </div>
              <div class="form-group{{ $errors->has('special_allowance') ? ' has-error' : '' }}">
                <label for="special_allowance">Special Allowance</label>
                <input type="number" name="special_allowance" value="{{ $salary['special_allowance'] }}" class="form-control" id="special_allowance" placeholder="Enter special allowance..">
                @if ($errors->has('special_allowance'))
                <span class="help-block">
                  <strong>{{ $errors->first('special_allowance') }}</strong>
                </span>
                @endif
              </div>
              <div class="form-group{{ $errors->has('provident_fund_contribution') ? ' has-error' : '' }}">
                <label for="provident_fund_contribution">Provident Fund Contribution</label>
                <input type="number" name="provident_fund_contribution" value="{{ $salary['provident_fund_contribution'] }}" class="form-control" id="provident_fund_contribution" placeholder="Enter special allowance..">
                @if ($errors->has('provident_fund_contribution'))
                <span class="help-block">
                  <strong>{{ $errors->first('provident_fund_contribution') }}</strong>
                </span>
                @endif
              </div>
              <div class="form-group{{ $errors->has('other_allowance') ? ' has-error' : '' }}">
                <label for="other_allowance">Other Allowance</label>
                <input type="number" name="other_allowance" value="{{ $salary['other_allowance'] }}" class="form-control" id="other_allowance" placeholder="Enter other allowance..">
                @if ($errors->has('other_allowance'))
                <span class="help-block">
                  <strong>{{ $errors->first('other_allowance') }}</strong>
                </span>
                @endif
              </div>
            </div>
            <!-- /.box-body -->
          </div>
        </div>
        <!-- /.end.col -->
        <div class="col-md-6">
          <div class="box box-warning">
            <div class="box-header with-border">
              <h3 class="box-title">Deductions</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="form-group{{ $errors->has('tax_deduction') ? ' has-error' : '' }}">
                <label for="tax_deduction">Tax Deduction</label>
                <input type="number" name="tax_deduction" value="{{ $salary['tax_deduction'] }}" class="form-control" id="tax_deduction" placeholder="Enter tax deduction..">
                @if ($errors->has('tax_deduction'))
                <span class="help-block">
                  <strong>{{ $errors->first('tax_deduction') }}</strong>
                </span>
                @endif
              </div>
              <div class="form-group{{ $errors->has('provident_fund_deduction') ? ' has-error' : '' }}">
                <label for="provident_fund_deduction">Provident Fund Deduction</label>
                <input type="number" name="provident_fund_deduction" value="{{ $salary['provident_fund_deduction'] }}" class="form-control" id="provident_fund_deduction" placeholder="Enter tax deduction..">
                @if ($errors->has('provident_fund_deduction'))
                <span class="help-block">
                  <strong>{{ $errors->first('provident_fund_deduction') }}</strong>
                </span>
                @endif
              </div>
              <div class="form-group{{ $errors->has('other_deduction') ? ' has-error' : '' }}">
                <label for="other_deduction">Other Deduction</label>
                <input type="number" name="other_deduction" value="{{ $salary['other_deduction'] }}" class="form-control" id="other_deduction" placeholder="Enter other deduction..">
                @if ($errors->has('other_deduction'))
                <span class="help-block">
                  <strong>{{ $errors->first('other_deduction') }}</strong>
                </span>
                @endif
              </div>
            </div>
            <!-- /.box-body -->
          </div>
        </div>
        <!-- /.end.col -->

        <div class="col-md-6">
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">Provident Fund</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="form-group">
                <label for="total_provident_fund">Total Provident Fund</label>
                <input type="number" class="form-control" id="total_provident_fund" readonly>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
        </div>
        <!-- /.end.col -->

        <div class="col-md-offset-6 col-md-6">
          <div class="box box-danger">
            <div class="box-header with-border">
              <h3 class="box-title">Total Salary Details</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="form-group">
                <label for="gross_salary">Gross Salary</label>
                <input type="number" disabled class="form-control" id="gross_salary">
              </div>
              <div class="form-group{{ $errors->has('total_deduction') ? ' has-error' : '' }}">
                <label for="total_deduction">Total Deduction</label>
                <input type="number" disabled class="form-control" id="total_deduction">
              </div>
              <div class="form-group">
                <label for="net_salary">Net Salary</label>
                <input type="number" disabled class="form-control" id="net_salary">
              </div>
            </div>
            <!-- /.box-body -->

            <div class="box-footer">
              <button type="submit" class="btn btn-primary btn-flat pull-right"><i class="fa fa-edit"></i> Update Details</button>
            </div>
          </div>
        </div>
        <!-- /.end.col -->

      </form>

    </div>
  </section>
  <!-- /.content -->
</div>
<script type="text/javascript">
  // For Kepp Data After Reload
  document.forms['employee_select_form'].elements['user_id'].value = "{{ $employee_id }}";
  document.forms['employee_salary_form'].elements['employee_type'].value = "{{ $salary['employee_type'] }}";

  $(document).ready(function(){
    calculation();
  });


  //For Calculation
  $(document).on("keyup", "#employee_salary_form", function() {
    calculation();
  });

  function calculation() {
    var sum = 0;
    var basic_salary = $("#basic_salary").val();
    var house_rent_allowance = $("#house_rent_allowance").val();
    var medical_allowance = $("#medical_allowance").val();
    var special_allowance = $("#special_allowance").val();
    var provident_fund_contribution = $("#provident_fund_contribution").val();
    var provident_fund = $("#provident_fund").val();
    var other_allowance = $("#other_allowance").val();
    var tax_deduction = $("#tax_deduction").val();
    var provident_fund_deduction = $("#provident_fund_deduction").val();
    var other_deduction = $("#other_deduction").val();

    var gross_salary = (+basic_salary + +house_rent_allowance + +medical_allowance + +special_allowance + +other_allowance);

    var total_deduction = (+tax_deduction + +provident_fund_deduction + +other_deduction);

    $("#total_provident_fund").val(+provident_fund_contribution + +provident_fund_deduction);

    $("#gross_salary").val(gross_salary);
    $("#total_deduction").val(total_deduction);
    $("#net_salary").val(+gross_salary - +total_deduction);
  }
</script>
@endsection