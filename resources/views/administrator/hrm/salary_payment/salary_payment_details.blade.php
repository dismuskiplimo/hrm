@extends('administrator.master')
@section('title', 'Salary Payment Details')

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
      <li class="active">Salary Payment Details</li>
    </ol>
  </section>

  <!-- Main content -->
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
            <a href="{{ url('/hrm/salary-payments') }}" class="btn btn-primary btn-flat"><i class="fa fa-arrow-left"></i> Back</a>
            <button type="button" class="tip btn btn-info btn-flat pull-right" title="Print" data-original-title="Label Printer" onclick="printDiv('printable_area')"><i class="fa fa-print"></i><span class="hidden-sm hidden-xs"> Print</span></button>
            <a href="{{ url('/hrm/salary-payments/pdf/'.$user_id.'/'.$salary_month) }}" class="tip btn btn-default btn-flat pull-right" title="PDF"><i class="fa fa-file-pdf-o"></i><span class="hidden-sm hidden-xs"> PDF</span></a>
            <hr>
            <div id="printable_area">
              <table class="table table-bordered">
                <tr>
                  <td>
                    <p style="padding-top: 40px; font-weight: bold;">
                      {{ $user['employee_id'] }}
                      <br>
                      {{ $user['name'] }}
                      <br>
                      ({{ $user['designation'] }})
                      <br>
                      Department of {{ $user['department'] }}
                      <br>
                      Joining Date: {{ date("d F Y", strtotime($user['created_at'])) }}
                    </p>
                  </td>
                  <td width="160px">
                    @if(!empty($user['avatar']))
                    <img src="{{ url('public/profile_picture/' . $user['avatar']) }}" class="img-responsive img-thumbnail" width="250px">
                    @else
                    <img src="{{ url('public/profile_picture/blank_profile_picture.png') }}" alt="blank_profile_picture" class="img-responsive img-thumbnail" width="160px">
                    @endif
                  </td>
                </tr>
              </table>
              <hr>

              <table class="table table-bordered">
                <tr class="bg-info">
                  <th>sl#</th>
                  <th>Description</th>
                  <th>Debits</th>
                  <th>Credits</th>
                </tr>
                @php($sl = 1)
                @foreach($salary_payment_details as $data)
                <tr>
                  <td>{{ $sl++ }}</td>
                  <td>{{ $data->item_name }}</td>
                  <td>
                    @if($data->status == 'debits')
                    -{{ $data->amount }}
                    @endif
                  </td>
                  <td>
                    @if($data->status == 'credits')
                    {{ $data->amount }}
                    @endif
                  </td>
                </tr>
                @endforeach
                <tr>
                  <td colspan="4"> &nbsp; </td>
                </tr>
                <tr class="success">
                  <td colspan="3"><strong class="pull-right">Gross Salary:</strong></td>
                  <td>
                    <strong>
                      {{ number_format($salary_payment->gross_salary, 2, '.', '') }}
                    </strong>
                  </td>
                </tr>
                <tr class="success">
                  <td colspan="3"><strong class="pull-right">Total Deduction:</strong></td>
                  <td><strong>{{ number_format($salary_payment->total_deduction, 2, '.', '') }}</strong></td>
                </tr>
                <tr class="success">
                  <td colspan="3"><strong class="pull-right">Net Salary:</strong></td>
                  <td><strong>{{ number_format($salary_payment->net_salary, 2, '.', '') }}</strong></td>
                </tr>
                <tr class="success">
                  <td colspan="3"><strong class="pull-right">Provident Fund:</strong></td>
                  <td><strong>{{ number_format($salary_payment->provident_fund, 2, '.', '') }}</strong></td>
                </tr>
              </table>
            </div>
          </div>
          <!-- /.box-body -->
        </div>
      </div>
      <!-- /.end.col -->

      <div class="col-md-12">
        <div class="box box-warning">
          <div class="box-header with-border">
            <h3 class="box-title"><strong>Payment History</strong></h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <table class="table table-bordered">
             <tr class="bg-info">
              <th>sl#</th>
              <th>Salary Month</th>
              <th>Gross Salary</th>
              <th>Total Deduction</th>
              <th>Net Salary</th>
              <th>Provident Fund</th>
              <th>Payment Amount</th>
              <th>Payment Type</th>
              <th>Note</th>
            </tr>
            @php($sl = 1)
            @foreach($employee_salaries as $employee_salary)
            <tr>
              <td>{{ $sl++ }}</td>
              <td>{{ date("F Y", strtotime($employee_salary['payment_month'])) }}</td>
              <td>{{ $employee_salary['gross_salary'] }}</td>
              <td>{{ $employee_salary['total_deduction'] }}</td>
              <td>{{ $employee_salary['net_salary'] }}</td>
              <td>{{ $employee_salary['provident_fund'] }}</td>
              <td>{{ $employee_salary['payment_amount'] }}</td>
              <td style="color: #5cb85c">
                @if($employee_salary['payment_type'] == 1)
                Cash Payment
                @elseif($employee_salary['payment_type'] == 2)
                Chaque Payment
                @else
                Bank Payment
                @endif
              </td>
              <td>{{ $employee_salary['note'] }}</td>
            </tr>
            @endforeach
          </table>
        </div>
        <!-- /.box-body -->
      </div>
    </div>
    <!-- /.end.col -->
  </div>
  <!-- /.end.row -->
</section>
<!-- /.content -->
</div>
@endsection