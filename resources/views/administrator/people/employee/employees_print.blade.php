<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Job Report</title>

    <style type="text/css">
    table {
        border-collapse: collapse
    }
    table, th, td {
        border: 1px solid black
    }
    th {
        padding: 3px 10px; font-size: 12px
    }
    td {
        padding: 3px 10px; font-size: 12px
    }
</style>

</head>
<body onload="window.print();" style="padding: 0px; margin: 0px">
    <div class="container">
     <table width="100%">
        <thead>
            <tr>
                <th>SL#</th>
                <th>ID</th>
                <th>Name</th>
                <th>Designation</th>
                <th>Email</th>
                <th>Contact No</th>
            </tr>
        </thead>
        <tbody>
            @php($sl = 1)
            @foreach($employees as $employee)
            <tr>
                <td>{{ $sl++ }}</td>
                <td>{{ $employee['employee_id'] }}</td>
                <td>{{ $employee['name'] }}</td>
                <td>{{ $employee['designation'] }}</td>
                <td>{{ $employee['email'] }}</td>
                <td>{{ $employee['contact_no_one'] }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
</body>
</html>