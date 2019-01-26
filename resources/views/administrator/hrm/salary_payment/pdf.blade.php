<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>{{ $user['name'] }} Details</title>

  <style type="text/css">
  table {
    border-collapse: collapse
  }
  table, th, td {
    border: 1px solid black
  }
  td {
    padding: 3px 15px; font-size: 16px
  }
  th {
    padding: 6px 15px; font-size: 14px
  }
  container {
    page-break-after: always
  }
  .header {
    position: fixed; top: 0px; margin: 100px 0px
  }
  .footer {
    position: fixed; bottom: 0px
  }
  .pagenum:before {content: counter(page);}
  @page {
   size: 21cm 29.7cm;
   margin-top: 1.27cm;
   margin-left: 1.27cm;
   margin-right: 1.27cm;
 }
</style>

</head>
<body>
  <div class="header">
    <img src="{{ url('public/backend/img/logo.png') }}">
  </div>
  <div class="footer"><p style="font-size: 14px;">Page: <span class="pagenum"></span></p></div>
  <div class="container">
    <table width="100%">
      <tr>
        <td>
          <h3>MONTHLY PAYROLL</h3>
          <p style="font-weight: bold;">
            {{ $user['employee_id'] }}
            <br>
            {{ $user['name'] }}
            <br>
            ({{ $user['designation'] }})
            <br>
            Department of {{ $user['department'] }}
            <br>
            Date: {{ date("d F Y", strtotime(now())) }}
          </p>
        </td>
        <td width="15%">
          @if(!empty($user['avatar']))
          <img src="{{ url('public/profile_picture/' . $user['avatar']) }}" class="img-responsive img-thumbnail" width="140px">
          @else
          <img src="{{ url('public/profile_picture/blank_profile_picture.png') }}" alt="blank_profile_picture" class="img-responsive img-thumbnail" width="160px">
          @endif
        </td>
      </tr>
    </table>
    <br>
    <table width="100%">
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

    <table width="100%" style="margin-top: 75px; border: 0px;">
      <tr>
        <td style="border: 0px; text-align: left">Prepared By</td>
        <td style="border: 0px; text-align: center">Receiver Signature</td>
        <td style="border: 0px; text-align: right">Approval Signature</td>
      </tr>
    </table>

  </div>
</body>
</html>