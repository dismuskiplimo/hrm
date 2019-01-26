@extends('administrator.master')
@section('title', 'Reference Types')

@section('main_content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            REFERENCES
        </h1>
        <ol class="breadcrumb">
            <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li><a>People</a></li>
            <li><a href="{{ url('/people/references') }}">References</a></li>
            <li class="active">Details</li>
        </ol>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <!-- Default box -->
    <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title">Details of reference</h3>

            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
            </div>
        </div>
        <div class="box-body">
            <a href="{{ url('/people/references') }}" class="btn btn-primary btn-flat"><i class="fa fa-arrow-left"></i> Back</a>
            <hr>
            <div id="printable_area">
                <table id="example1" class="table table-bordered table-striped">
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
                            <td>{{ date("D d F Y - h:ia", strtotime($reference->created_at)) }}</td>
                        </tr>
                        <tr>
                            <td>Last Updated</td>
                            <td>{{ date("D d F Y - h:ia", strtotime($reference->updated_at)) }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="btn-group btn-group-justified">
                @if ($reference->activation_status == 1)
                <div class="btn-group">
                    <a href="{{ url('/people/references/deactive/' . $reference->id)}}" class="tip btn btn-success btn-flat" data-toggle="tooltip" data-original-title="Click to deactive">
                        <i class="fa fa-arrow-down"></i>
                        <span class="hidden-sm hidden-xs"> Active</span>
                    </a>
                </div>
                @else
                <div class="btn-group">
                    <a href="{{ url('/people/references/active/' . $reference->id)}}" class="tip btn btn-warning btn-flat" data-toggle="tooltip" data-original-title="Click to active">
                        <i class="fa fa-arrow-up"></i>
                        <span class="hidden-sm hidden-xs"> Deactive</span>
                    </a>
                </div>
                @endif
                <div class="btn-group">
                    <button type="button" class="tip btn btn-primary btn-flat" title="Print" data-original-title="Label Printer" onclick="printDiv('printable_area')">
                        <i class="fa fa-print"></i>
                        <span class="hidden-sm hidden-xs"> Print</span>
                    </button>
                </div>
                <div class="btn-group">
                    <a href="{{ url('/people/references/download-pdf/' . $reference->id) }}" class="tip btn btn-primary btn-flat" title="" data-original-title="PDF">
                        <i class="fa fa-file-pdf-o"></i>
                        <span class="hidden-sm hidden-xs"> PDF</span>
                    </a>
                </div>
                <div class="btn-group">
                    <a href="{{ url('/people/references/edit/' . $reference->id) }}" class="tip btn btn-warning tip btn-flat" title="" data-original-title="Edit Product">
                        <i class="fa fa-edit"></i>
                        <span class="hidden-sm hidden-xs"> Edit</span>
                    </a>
                </div>
                <div class="btn-group">
                    <a href="{{ url('/people/references/delete/' . $reference->id) }}" class="tip btn btn-danger btn-flat" data-toggle="tooltip" data-original-title="Click to delete" onclick="return confirm('Are you sure to delete this ?');">
                        <i class="fa fa-arrow-up"></i>
                        <span class="hidden-sm hidden-xs"> Delete</span>
                    </a>
                </div>
        </div>
    </div>
    <!-- /.box-body -->
</div>
<!-- /.box -->
</section>
<!-- /.content -->
</div>
@endsection