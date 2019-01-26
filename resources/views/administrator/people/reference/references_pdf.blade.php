<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>References</title>

    <style type="text/css">
    table {
        border-collapse: collapse
    }
    table, th, td {
        border: 1px solid black
    }
    th {
        padding: 6px 15px; font-size: 16px
    }
    td {
        padding: 6px 15px; font-size: 16px
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
        <thead>
            <tr>
                <th>SL#</th>
                <th>Reference Name</th>
                <th>Address</th>
                <th>Contact No</th>
            </tr>
        </thead>
        <tbody>
            @php($sl = 1)
            @foreach($references as $reference)
            <tr>
                <td>{{ $sl++ }}</td>
                <td>{{ $reference['name'] }}</td>
                <td>{{ $reference['present_address'] }}</td>
                <td>{{ $reference['contact_no_one'] }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
    </div>
</body>
</html>