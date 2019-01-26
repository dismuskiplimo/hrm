<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Attendance Report</title>

    <style type="text/css">
    table {
        border-collapse: collapse
    }
    table, th, td {
        border: 1px solid black
    }
    th {
        padding: 6px 15px; font-size: 14px
    }
    td {
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
     size: 29.7cm 21cm;
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
        <thead>
            <tr>
                <th>SL</th>
                <th>Name</th>
                <th>ID</th>
                <th>Designation</th> 
                <th>Total Attendance</th>
                <th>Total Absence</th>
                <th>Casual Leave</th>
                <th>Earned Leave</th>
                <th>Advance Leave</th>
                <th>Special Leave</th>
                <th>Total Leave</th>
            </tr>
        </thead>
        <tbody>
            @php($sl = 1)
            @php($total_leave = 0)
            @foreach($users as $user)
            <tr>
                <td>{{ $sl++ }}</td>
                <td>{{ $user->name }}</td>
                <td>{{ $user->employee_id }}</td>
                <td>{{ $user->designation }}</td>
                <td>
                    @foreach($attendances as $attendance)
                    @if($user->id == $attendance->user_id)
                    {{ $attendance->total_attendances }}
                    @endif
                    @endforeach
                </td>
                                <td>
                                    @foreach($absences as $absence)
                                    @if($user->id == $absence->user_id)
                                    {{ $absence->total_absences }}
                                    @endif
                                    @endforeach
                                </td>
                <td>
                    @foreach($casual_leaves as $casual_leave)
                    @if($user->id == $casual_leave->user_id)
                    {{ $casual_leave->total_casual_leaves }}
                    @php($total_leave += $casual_leave->total_casual_leaves)
                    @endif
                    @endforeach
                </td>
                <td>
                    @foreach($earned_leaves as $earned_leave)
                    @if($user->id == $earned_leave->user_id)
                    {{ $earned_leave->total_earned_leaves }}
                    @php($total_leave += $earned_leave->total_earned_leaves)
                    @endif
                    @endforeach
                </td> 
                <td>
                    @foreach($advance_leaves as $advance_leave)
                    @if($user->id == $advance_leave->user_id)
                    {{ $advance_leave->total_advance_leave }}
                    @php($total_leave += $advance_leave->total_advance_leave)
                    @endif
                    @endforeach
                </td>
                                <td>
                                    @foreach($special_leaves as $special_leave)
                                    @if($user->id == $special_leave->user_id)
                                    {{ $special_leave->total_special_leave }}
                                    @php($total_leave += $special_leave->total_special_leave)
                                    @endif
                                    @endforeach
                                </td>
                <td>
                    {{ $total_leave }}
                    @php($total_leave = 0)
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <div style="margin-top: 100px;">
        <p style="float: left">Prepared By</p>
        <p style="float: right">Authorised Signature</p>
    </div>
</div>
</body>
</html>