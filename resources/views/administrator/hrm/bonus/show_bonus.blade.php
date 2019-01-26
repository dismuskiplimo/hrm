@extends('administrator.master')
@section('title', 'Bonus Details')

@section('main_content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            BONUS
        </h1>
        <ol class="breadcrumb">
            <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li><a href="{{ url('/hrm/bonuses') }}">Manage Bonuses</a></li>
            <li class="active">Bonus Details</li>
        </ol>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <!-- Default box -->
    <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title">Bonus Details</h3>

            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
            </div>
        </div>
        <div class="box-body">
            <a href="{{ url('/hrm/bonuses') }}" class="btn btn-primary btn-flat"><i class="fa fa-arrow-left"></i> Back</a>
            <hr>
            <table id="example1" class="table table-bordered table-striped">
                <tbody>
                    <tr>
                        <td width="25%">Employee Name</td>
                        <td width="75%">{{ $bonus['name'] }}</td>
                    </tr>
                    <tr>
                        <td>Designation</td>
                        <td>{{ $bonus['designation'] }}</td>
                    </tr>
                    <tr>
                        <td>Bonus Name</td>
                        <td>{{ $bonus['bonus_name'] }}</td>
                    </tr>
                    <tr>
                        <td>Bonus Month</td>
                        <td>{{ date("F Y", strtotime($bonus['bonus_month'])) }}</td>
                    </tr>
                    <tr>
                        <td>Bonus Amount</td>
                        <td>{{ $bonus['bonus_amount'] }}</td>
                    </tr>
                    <tr>
                        <td>Description</td>
                        <td>{!! $bonus['bonus_description'] !!}</td>
                    </tr>
                    <tr>
                        <td>Create By</td>
                        <td>
                            @foreach($users as $user)
                            @if($user['id'] == $bonus['created_by'])
                            {{ $user['name'] }}
                            @endif
                            @endforeach
                        </td>
                    </tr>
                    <tr>
                        <td>Date Added</td>
                        <td>{{ date("D d F Y h:ia", strtotime($bonus['created_at'])) }}</td>
                    </tr>
                    <tr>
                        <td>Last Updated</td>
                        <td>{{ date("D d F Y h:ia", strtotime($bonus['updated_at'])) }}</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="btn-group btn-group-justified">
                                <div class="btn-group">
                                    <a href="#" class="tip btn btn-primary btn-flat" title="" data-original-title="Label Printer">
                                        <i class="fa fa-print"></i>
                                        <span class="hidden-sm hidden-xs"> Print</span>
                                    </a>
                                </div>
                                <div class="btn-group">
                                    <a href="#" class="tip btn btn-primary btn-flat" title="" data-original-title="PDF">
                                        <i class="fa fa-file-pdf-o"></i>
                                        <span class="hidden-sm hidden-xs"> PDF</span>
                                    </a>
                                </div>
                                <div class="btn-group">
                                    <a href="{{ url('/hrm/bonuses/edit/' . $bonus['id']) }}" class="tip btn btn-warning tip btn-flat" title="" data-original-title="Edit Product">
                                        <i class="fa fa-edit"></i>
                                        <span class="hidden-sm hidden-xs"> Edit</span>
                                    </a>
                                </div>
                                <div class="btn-group">
                                    <a href="{{ url('/hrm/bonuses/delete/' . $bonus['id']) }}" onclick="return confirm('Are you sure to delete this ?');" class="tip btn btn-danger bpo btn-flat" title="" data-content="<div style='width:150px;'><p>Are you sure?</p><a class='btn btn-danger' href='https://btrc.gunitok.com/products/delete/1'>Yes I'm sure</a> <button class='btn bpo-close'>No</button></div>" data-html="true" data-placement="top" data-original-title="<b>Delete Product</b>">
                                    <i class="fa fa-trash-o"></i>
                                    <span class="hidden-sm hidden-xs"> Delete</span>
                                </a>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- /.box-body -->
</div>
<!-- /.box -->
</section>
<!-- /.content -->
</div>
@endsection