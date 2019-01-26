<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>{{ $reference->name }} Details</title>

    <style type="text/css">
    table {
        border-collapse: collapse
    }
    table, th, td {
        border: 1px solid black
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
            <tbody>
                <tr>
                    <td width="25%">Name</td>
                    <td width="75%">{{ $reference->name }}</td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>{{ $reference->email }}</td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>{{ $reference->present_address }}</td>
                </tr>
                <tr>
                    <td>Contact No (Optional)</td>
                    <td>{{ $reference->contact_no_two }}</td>
                </tr>
                <tr>
                    <td>Contact No</td>
                    <td>{{ $reference->contact_no_one }}</td>
                </tr>
                <tr>
                    <td>Web</td>
                    <td>{{ $reference->web }}</td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>
                        @if($reference->gender == 'm')
                        <p>Male</p>
                        @else
                        <p>Female</p>
                        @endif
                    </td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td>
                        @if($reference->date_of_birth != NULL)
                        {{ date("d F Y", strtotime($reference->date_of_birth)) }}
                        @endif

                    </td>
                </tr>
                <tr>
                    <td>Created By</td>
                    <td>{{ $created_by->name }}</td>
                </tr>
                <tr>
                    <td>Date Added</td>
                    <td>{{ date("D d F Y h:ia", strtotime($reference->created_at)) }}</td>
                </tr>
                <tr>
                    <td>Last Updated</td>
                    <td>{{ date("D d F Y h:ia", strtotime($reference->updated_at)) }}</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>