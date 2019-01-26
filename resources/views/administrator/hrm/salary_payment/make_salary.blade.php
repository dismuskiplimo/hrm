@extends('administrator.master')
@section('title', 'Manage Salary')

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
      <li class="active">Manage Salary</li>
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
            <div class="col-md-12">
              <a href="{{ url('/hrm/salary-payments') }}" class="btn btn-primary btn-flat"><i class="fa fa-arrow-left"></i> Back</a>
            </div>
            <!-- Notification Box -->
            <div class="col-md-offset-2 col-md-5">
              <table class="table borderless" style="font-weight: bold;">
                <tr>
                  <td>Employee Name:</td>
                  <td>{{ $user['name'] }}</td>
                </tr>
                <tr>
                  <td>Department:</td>
                  <td>{{ $user['department'] }}</td>
                </tr>
                <tr>
                  <td>Designation:</td>
                  <td>{{ $user['designation'] }}</td>
                </tr>
                <tr>
                  <td>Joining Date:</td>
                  <td>{{ date("d F Y", strtotime($user['created_at'])) }}</td>
                </tr>
              </tr>
            </table>
          </div>
          <!-- /. end col -->
          <div class="col-md-3">
            @if(!empty($user['avatar']))
            <img src="{{ url('public/profile_picture/' . $user['avatar']) }}" class="img-responsive img-thumbnail" width="250px">
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

    <div class="col-md-3">
      <div class="box box-danger">
        <div class="box-header with-border">
          <h3 class="box-title">Payment For: <strong>{{ date("F Y", strtotime($salary_month)) }}</strong></h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <form action="{{ url('/hrm/salary-payments/store') }}" method="post">
            {{ csrf_field() }}

            <input type="hidden" name="user_id" value="{{ $user_id }}">
            <input type="hidden" name="payment_month" value="{{ $salary_month }}">

            <!-- Forl loan id and remaining installment -->
            @foreach($loans as $loan)
            <input type="hidden" name="loan_id[]" value="{{ $loan['id'] }}">
            <input type="hidden" name="remaining_installments[]" value="{{ $loan['remaining_installments'] }}">
            @endforeach

            <div class="form-group">
              <label for="gross_salary">Gross Salary</label>
              <input type="number" value="" class="form-control" id="gross_salary" disabled>
              <input type="hidden" name="gross_salary" id="gross_salary_1">
            </div>
            <!-- / .end form group -->

            <div class="form-group">
              <label for="total_deduction">Total Deduction</label>
              <input type="number" value="" class="form-control" id="total_deduction" disabled>
              <input type="hidden" name="total_deduction" id="total_deduction_1">
            </div>
            <!-- / .end form group -->

            <div class="form-group">
              <label for="net_salary">Net Salary</label>
              <input type="number" value="" class="form-control" id="net_salary" disabled>
              <input type="hidden" name="net_salary" id="net_salary_1">
            </div>
            <!-- / .end form group -->

            @php($provident_fund = $salary['provident_fund_contribution'] + $salary['provident_fund_deduction'])

            <div class="form-group">
              <label for="net_salary">Provident Fund</label>
              <input type="number" value="{{ $provident_fund }}" class="form-control" disabled>
              <input type="hidden" name="provident_fund" value="{{ $provident_fund }}">
            </div>
            <!-- / .end form group -->

            <div class="form-group{{ $errors->has('payment_amount') ? ' has-error' : '' }}">
              <label for="payment_amount">Payment Amount</label>
              <input type="text" name="payment_amount" value="{{ old('payment_amount') }}" class="form-control" id="payment_amount">
              @if ($errors->has('payment_amount'))
              <span class="help-block">
                <strong>{{ $errors->first('payment_amount') }}</strong>
              </span>
              @endif
            </div>
            <!-- / .end form group -->

            <div class="form-group{{ $errors->has('payment_type') ? ' has-error' : '' }}">
              <label for="payment_type">Payment Type</label>
              <select name="payment_type" id="payment_type" class="form-control">
                <option selected disabled>Select One</option>
                <option value="1">Cash Payment</option>
                <option value="2">Chaque Payment</option>
                <option value="3">Bank Payment</option>
              </select>
              @if ($errors->has('payment_type'))
              <span class="help-block">
                <strong>{{ $errors->first('payment_type') }}</strong>
              </span>
              @endif
            </div>
            <!-- / .end form group -->

            <div class="form-group{{ $errors->has('note') ? ' has-error' : '' }}">
              <label for="note">Note</label>
              <textarea name="note" class="form-control" id="note" rows="3" placeholder="Enter note.."></textarea>
              @if ($errors->has('note'))
              <span class="help-block">
                <strong>{{ $errors->first('note') }}</strong>
              </span>
              @endif
            </div>
            <!-- / .end form group -->

            <button type="submit" class="btn btn-danger btn-flat btn-block">Make Payment</button>

        </div>
        <!-- /.box-body -->
      </div>
    </div>
    <!-- /.end.col -->
    <div class="col-md-9">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">Payment Details For: <strong>{{ date("F Y", strtotime($salary_month)) }}</strong></h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <table class="table table-bordered">
            <tr class="bg-info">
              <th>sl#</th>
              <th>Item Name</th>
              <th>Debits</th>
              <th>Credits</th>
            </tr>
            @php($sl = 1)
            @php($debits = 0)
            @php($credits = 0)
            <tr>
              <td>{{ $sl++ }}</td>
              <td>Basic Salary</td>
              <td></td>
              <td>
                @php($credits += $salary['basic_salary'])
                {{ $salary['basic_salary'] }}
                <input type="hidden" name="item_name[]" value="Basic Salary">
                <input type="hidden" name="amount[]" value="{{ $salary['basic_salary'] }}">
                <input type="hidden" name="status[]" value="credits">
              </td>
            </tr>

            @if(!empty($salary['house_rent_allowance']))
            <tr>
              <td>{{ $sl++ }}</td>
              <td>House Rent Allowance</td>
              <td></td>
              <td>
                @php($credits += $salary['house_rent_allowance'])
                {{ $salary['house_rent_allowance'] }}
                <input type="hidden" name="item_name[]" value="House Rent Allowance">
                <input type="hidden" name="amount[]" value="{{ $salary['house_rent_allowance'] }}">
                <input type="hidden" name="status[]" value="credits">
              </td>
            </tr>
            @endif

            @if(!empty($salary['medical_allowance']))
            <tr>
              <td>{{ $sl++ }}</td>
              <td>Medical Allowance</td>
              <td></td>
              <td>
                @php($credits += $salary['medical_allowance'])
                {{ $salary['medical_allowance'] }}
                <input type="hidden" name="item_name[]" value="Medical Allowance">
                <input type="hidden" name="amount[]" value="{{ $salary['medical_allowance'] }}">
                <input type="hidden" name="status[]" value="credits">
              </td>
            </tr>
            @endif

            @if(!empty($salary['special_allowance']))
            <tr>
              <td>{{ $sl++ }}</td>
              <td>Special Allowance</td>
              <td></td>
              <td>
                @php($credits += $salary['special_allowance'])
                {{ $salary['special_allowance'] }}
                <input type="hidden" name="item_name[]" value="Special Allowance">
                <input type="hidden" name="amount[]" value="{{ $salary['special_allowance'] }}">
                <input type="hidden" name="status[]" value="credits">
              </td>
            </tr>
            @endif

            @if(!empty($salary['provident_fund_contribution']))
            <tr>
              <td>{{ $sl++ }}</td>
              <td>Provident Fund Contribution</td>
              <td></td>
              <td>
                {{ $salary['provident_fund_contribution'] }}
                <input type="hidden" name="item_name[]" value="Provident Fund Contribution">
                <input type="hidden" name="amount[]" value="{{ $salary['provident_fund_contribution'] }}">
                <input type="hidden" name="status[]" value="credits">
              </td>
            </tr>
            @endif

            @if(!empty($salary['other_allowance']))
            <tr>
              <td>{{ $sl++ }}</td>
              <td>Other Allowance</td>
              <td></td>
              <td>
                @php($credits += $salary['other_allowance'])
                {{ $salary['other_allowance'] }}
                <input type="hidden" name="item_name[]" value="Other Allowance">
                <input type="hidden" name="amount[]" value="{{ $salary['other_allowance'] }}">
                <input type="hidden" name="status[]" value="credits">
              </td>
            </tr>
            @endif

            @if(!empty($salary['tax_deduction']))
            <tr>
              <td>{{ $sl++ }}</td>
              <td>Tax Deduction</td>
              <td>
                @php($debits += $salary['tax_deduction'])
                -{{ $salary['tax_deduction'] }}
                <input type="hidden" name="item_name[]" value="Tax Deduction">
                <input type="hidden" name="amount[]" value="{{ $salary['tax_deduction'] }}">
                <input type="hidden" name="status[]" value="debits">
              </td>
              <td></td>
            </tr>
            @endif

            @if(!empty($salary['provident_fund_deduction']))
            <tr>
              <td>{{ $sl++ }}</td>
              <td>Provident Fund Deduction</td>
              <td>
                @php($debits += $salary['provident_fund_deduction'])
                -{{ $salary['provident_fund_deduction'] }}
                <input type="hidden" name="item_name[]" value="Provident Fund Deduction">
                <input type="hidden" name="amount[]" value="{{ $salary['provident_fund_deduction'] }}">
                <input type="hidden" name="status[]" value="debits">
              </td>
              <td></td>
            </tr>
            @endif

            @if(!empty($salary['other_deduction']))
            <tr>
              <td>{{ $sl++ }}</td>
              <td>Other Deduction</td>
              <td>
                @php($debits += $salary['other_deduction'])
                -{{ $salary['other_deduction'] }}
                <input type="hidden" name="item_name[]" value="Other Deduction">
                <input type="hidden" name="amount[]" value="{{ $salary['other_deduction'] }}">
                <input type="hidden" name="status[]" value="debits">
              </td>
              <td></td>
            </tr>
            @endif

            @foreach($bonuses as $bonus)
            <tr>
              <td>{{ $sl++ }}</td>
              <td>{{ $bonus['bonus_name'] }}</td>
              <td></td>
              <td>
                @php($credits += $bonus['bonus_amount'])
                {{ $bonus['bonus_amount'] }}
                <input type="hidden" name="item_name[]" value="{{ $bonus['bonus_name'] }}">
                <input type="hidden" name="amount[]" value="{{ $bonus['bonus_amount'] }}">
                <input type="hidden" name="status[]" value="credits">
              </td>
            </tr>
            @endforeach

            @foreach($deductions as $deduction)
            <tr>
              <td>{{ $sl++ }}</td>
              <td>{{ $deduction['deduction_name'] }}</td>
              <td>
                @php($debits += $deduction['deduction_amount'])
                -{{ $deduction['deduction_amount'] }}
                <input type="hidden" name="item_name[]" value="{{ $deduction['deduction_name'] }}">
                <input type="hidden" name="amount[]" value="{{ $deduction['deduction_amount'] }}">
                <input type="hidden" name="status[]" value="debits">
              </td>
              <td></td>
            </tr>
            @endforeach

            @foreach($loans as $loan)
            <tr>
              <td>{{ $sl++ }}</td>
              <td>{{ $loan['loan_name'] }}</td>
              <td>
                @php($installment = $loan['loan_amount'] / $loan['number_of_installments'])
                @php($debits += $installment)
                -{{ number_format($installment, 2, '.', ',') }}
                <input type="hidden" name="item_name[]" value="{{ $loan['loan_name'] }}">
                <input type="hidden" name="amount[]" value="{{ $installment }}">
                <input type="hidden" name="status[]" value="debits">
              </td>
              <td></td>
            </tr>
            @endforeach

          </table>
        </div>
        <!-- /.box-body -->
        </form>
      </div>
    </div>
    <!-- /.end.col -->
  </div>
</section>
<!-- /.content -->
</div>

<input type="hidden" id="debits" value="{{ number_format($debits, 2, '.', '') }}">
<input type="hidden" id="credits" value="{{ number_format($credits, 2, '.', '') }}">

<script type="text/javascript">
  $(document).ready(function(){
    var debits = $("#debits").val();
    var credits = $("#credits").val();
    var net_salary = (+credits - +debits);


    $("#gross_salary").val(credits);
    $("#total_deduction").val(debits);
    $("#net_salary").val(net_salary);

    $("#gross_salary_1").val(credits);
    $("#total_deduction_1").val(debits);
    $("#net_salary_1").val(net_salary);

    $("#payment_amount").val(net_salary);
    calculation();
  });
</script>
@endsection