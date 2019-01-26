@extends('administrator.master')
@section('title', 'Salary Details')

@section('main_content')
<style type="text/css">
.borderless td, .borderless th {
  border: none;
}
</style>
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      PAYROLL
    </h1>
    <ol class="breadcrumb">
      <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
      <li><a>{{ env('APP_NAME') }}</a></li>
      <li class="active">Salary Details</li>
    </ol>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-md-12">
        <!-- Default box -->
        <div class="box box-primary">
          <div class="box-header with-border">
            <h3 class="box-title">Employee Details</h3>

            <div class="box-tools pull-right">
              <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
              <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
            </div>
          </div>
          <div class="box-body">
            <!-- Notification Box -->
            <div class="col-md-offset-2 col-md-5">
              <table class="table borderless" style="font-weight: bold;">
                <tr>
                  <td>Employee Name:</td>
                  <td>{{ $salary['name'] }}</td>
                </tr>
                <tr>
                  <td>Employee Type:</td>
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
                  <tr>
                    <td>Department:</td>
                    <td>{{ $salary['department'] }}</td>
                  </tr>
                  <tr>
                    <td>Designation:</td>
                    <td>{{ $salary['designation'] }}</td>
                  </tr>
                </tr>
              </table>
            </div>
            <!-- /. end col -->
            <div class="col-md-3">
              @if(!empty($salary['avatar']))
              <img src="{{ url('public/profile_picture/' . $salary['avatar']) }}" class="img-responsive img-thumbnail" width="250px">
              @else
              <img src="{{ url('public/profile_picture/blank_profile_picture.png') }}" alt="blank_profile_picture" class="img-responsive img-thumbnail" width="160px">
              @endif
            </div>
            <!-- /. end col -->
          </div>
          <!-- /.box-body -->
        </div>
        <!-- /.box -->
      </div>
      <!-- /.end.col -->

      <div class="col-md-12">
        <div class="box box-info">
          <div class="box-header with-border">
            <h3 class="box-title">Salary Details</h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <table class="table table-bordered">
              <tr>
                <th>#SL</th>
                <th>Transection Type</th>
                <th>Debits</th>
                <th>Credits</th>
              </tr>
              <tr>
                <td>01.</td>
                <td>Basic Salary</td>
                <td></td>
                <td>{{ $salary['basic_salary']}}</td>
              </tr>
              <tr>
                <td>02.</td>
                <td>House Rent Allowance</td>
                <td></td>
                <td>{{ $salary['house_rent_allowance'] }}</td>
              </tr>
              <tr>
                <td>03.</td>
                <td>Medical Allowance</td>
                <td></td>
                <td>{{ $salary['medical_allowance']}}</td>
              </tr>
              <tr>
                <td>04.</td>
                <td>Special Allowance</td>
                <td></td>
                <td>{{ $salary['special_allowance'] }}</td>
              </tr>
              <tr>
                <td>05.</td>
                <td>Provident Fund Contribution</td>
                <td></td>
                <td>{{ $salary['provident_fund_contribution'] }}</td>
              </tr>
              <tr>
                <td>06.</td>
                <td>Other Allowance</td>
                <td></td>
                <td>{{ $salary['other_allowance']}}</td>
              </tr>
              <tr>
                <td>07.</td>
                <td>Tax Deduction</td>
                <td>
                  @if(!empty($salary['tax_deduction']))
                -{{ $salary['tax_deduction']}}
                @endif
              </td>
                <td></td>
              </tr>
              <tr>
                <td>08.</td>
                <td>Provident Fund Deduction</td>
                <td>-{{ $salary['provident_fund_deduction']}}</td>
                <td></td>
              </tr>
              <tr>
                <td>09.</td>
                <td>Other Deduction</td>
                <td>-{{ $salary['other_deduction']}}</td>
                <td></td>
              </tr>
            </table>
          </div>
          <!-- /.box-body -->
        </div>
        <!-- /.end.col -->
      </div>
      <!-- /.end.col -->

      <div class="col-md-12">
        <div class="box box-danger">
          <div class="box-header with-border">
            <h3 class="box-title">Total Salary Details</h3>
          </div>
          <!-- /.box-header -->

          @php($total_deduction = $salary['tax_deduction'] + $salary['other_deduction']+ $salary['provident_fund_deduction'])

          @php($gross_salary = $salary['basic_salary'] + $salary['house_rent_allowance'] + $salary['medical_allowance'] + $salary['special_allowance'] + $salary['other_allowance'])

          @php($total_provident_fund = $salary['provident_fund_contribution'] + $salary['provident_fund_deduction'])

          <div class="box-body">
            <table class="table table-bordered">
              <tr>
                <td>Gross Salary</td>
                <td>
                  {{ $gross_salary }}
                </td>
              </tr>
              <tr>
                <td>Total Deduction</td>
                <td>
                  {{ $total_deduction }}
                </td>
              </tr>
              <tr>
                <td><strong>Provident Fund</strong></td>
                <td>{{ $total_provident_fund }}</td>
              </tr>
              <tr>
                <td><strong>Net Salary</strong></td>
                <td>{{ $gross_salary - $total_deduction }}</td>
              </tr>
            </table>
          </div>
          <!-- /.box-body -->
        </div>
      </div>
      <!-- /.end.col -->
    </div>
  </section>
  <!-- /.content -->
</div>
@endsection