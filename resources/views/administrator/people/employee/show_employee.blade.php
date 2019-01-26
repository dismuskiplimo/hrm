@extends('administrator.master')
@section('title', 'Team member details')

@section('main_content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            TEAM
        </h1>
        <ol class="breadcrumb">
            <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li><a>People</a></li>
            <li><a href="{{ url('/people/employees') }}">Team</a></li>
            <li class="active">Details</li>
        </ol>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <!-- Default box -->
    <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title">Team member details</h3>

            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
            </div>
        </div>
        <div class="box-body">
            <a href="{{ url('/people/employees') }}" class="btn btn-primary btn-flat"><i class="fa fa-arrow-left"></i> Back</a>
            <hr>
            <div id="printable_area">
                <table class="table table-bordered">
                    <tr>
                        <td>
                            <p style="padding-top: 40px; font-weight: bold;">
                                {{ $employee->name }}
                                <br>
                                {{ $employee->employee_id }}
                                <br>
                                {{ $employee->designation }}
                            </p>
                        </td>
                        <td width="160px">
                            @if(!empty($employee->avatar))
                            <img src="{{ url('public/profile_picture/' . $employee->avatar) }}" class="img-responsive img-thumbnail" width="250px">
                            @else
                            <img src="{{ url('public/profile_picture/blank_profile_picture.png') }}" alt="blank_profile_picture" class="img-responsive img-thumbnail" width="160px">
                            @endif
                        </td>
                    </tr>
                </table>
                <hr>
                <table class="table table-bordered table-striped">
                    <tbody>
                        <tr>
                            <td>Father's Name</td>
                            <td>{{ $employee->father_name }}</td>
                        </tr>
                        <tr>
                            <td>Mother's Name</td>
                            <td>{{ $employee->mother_name }}</td>
                        </tr>
                        <tr>
                            <td>Spouse Name</td>
                            <td>{{ $employee->spouse_name }}</td>
                        </tr>
                        <tr>
                            <td>Present Address</td>
                            <td>{{ $employee->present_address }}</td>
                        </tr>
                        <tr>
                            <td>Permanent Address</td>
                            <td>{{ $employee->permanent_address }}</td>
                        </tr>
                        <tr>
                            <td>Home District</td>
                            <td>{{ $employee->home_district }}</td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>{{ $employee->email }}</td>
                        </tr>
                        <tr>
                            <td>Web</td>
                            <td>{{ $employee->web }}</td>
                        </tr>
                        <tr>
                            <td>Contact No</td>
                            <td>{{ $employee->contact_no_one }}</td>
                        </tr>
                        <tr>
                            <td>Emergency Contact</td>
                            <td>{{ $employee->emergency_contact }}</td>
                        </tr>
                        <tr>
                            <td>ID Name</td>
                            <td>
                                @if($employee->id_name == 1)
                                <p>NID</p>
                                @elseif($employee->id_name == 2)
                                <p>Passport</p>
                                @elseif($employee->id_name == 3)
                                <p>Driving License</p>
                                @endif
                            </td>
                        </tr>
                        <tr>
                            <td>ID Number</td>
                            <td>{{ $employee->id_number }}</td>
                        </tr>
                        <tr>
                            <td>Gender</td>
                            <td>
                                @if($employee->gender == 'm')
                                <p>Male</p>
                                @else
                                <p>Female</p>
                                @endif
                            </td>
                        </tr>
                        <tr>
                            <td>Marital Status</td>
                            <td>
                                @if($employee->marital_status == 1)
                                <p>Married</p>
                                @elseif($employee->marital_status == 2)
                                <p>Single</p>
                                @elseif($employee->marital_status == 3)
                                <p>Divorced</p>
                                @elseif($employee->marital_status == 4)
                                <p>Separated</p>
                                @elseif($employee->marital_status == 5)
                                <p>Widowed</p>
                                @endif
                            </td>
                        </tr>
                        <tr>
                            <td>Date of Birth</td>
                            <td>
                                @if($employee->date_of_birth != NULL)
                                {{ date("d F Y", strtotime($employee->date_of_birth)) }}
                                @endif
                            </td>
                        </tr>
                        <tr>
                            <td>Academic Qualification</td>
                            <td>{!! $employee->academic_qualification !!}</td>
                        </tr>
                        <tr>
                            <td>Profession Qualification</td>
                            <td>{!! $employee->professional_qualification !!}</td>
                        </tr>
                        <tr>
                            <td>Joining Position</td>
                            <td>
                                @foreach($designations as $designation)
                                @if($employee->joining_position == $designation->id)
                                {{ $designation->designation }}
                                @endif
                                @endforeach
                            </td>
                        </tr>
                        <tr>
                            <td>Joining Date</td>
                            <td>{{ date("D d F Y - h:ia", strtotime($employee->joining_date)) }}</td>
                        </tr>
                        <tr>
                            <td>Experience</td>
                            <td>{!! $employee->experience !!}</td>
                        </tr>
                        <tr>
                            <td>Reference</td>
                            <td>{!! $employee->reference !!}</td>
                        </tr>
                        <tr>
                            <td>Created By</td>
                            <td>{{ $created_by->name }}</td>
                        </tr>
                        <tr>
                            <td>Date Added</td>
                            <td>{{ date("D d F Y - h:ia", strtotime($employee->created_at)) }}</td>
                        </tr>
                        <tr>
                            <td>Last Updated</td>
                            <td>{{ date("D d F Y - h:ia", strtotime($employee->updated_at)) }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- Start Button -->
            <div class="btn-group btn-group-justified">
                @if ($employee->activation_status == 1)
                <div class="btn-group">
                    <a href="{{ url('/people/employees/deactive/' . $employee->id)}}" class="tip btn btn-success btn-flat" data-toggle="tooltip" data-original-title="Click to deactive">
                        <i class="fa fa-arrow-down"></i>
                        <span class="hidden-sm hidden-xs"> Active</span>
                    </a>
                </div>
                @else
                <div class="btn-group">
                    <a href="{{ url('/people/employees/active/' . $employee->id)}}" class="tip btn btn-warning btn-flat" data-toggle="tooltip" data-original-title="Click to active">
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
                    <a href="{{ url('/people/employees/download-pdf/' . $employee->id) }}" class="tip btn btn-primary btn-flat" title="" data-original-title="PDF">
                        <i class="fa fa-file-pdf-o"></i>
                        <span class="hidden-sm hidden-xs"> PDF</span>
                    </a>
                </div>
                <div class="btn-group">
                    <a href="{{ url('/people/employees/edit/' . $employee->id) }}" class="tip btn btn-warning tip btn-flat" title="" data-original-title="Edit Product">
                        <i class="fa fa-edit"></i>
                        <span class="hidden-sm hidden-xs"> Edit</span>
                    </a>
                </div>
                <div class="btn-group">
                    <a href="{{ url('/people/employees/delete/' . $employee->id) }}" class="tip btn btn-danger btn-flat" data-toggle="tooltip" data-original-title="Click to delete" onclick="return confirm('Are you sure to delete this ?');">
                        <i class="fa fa-arrow-up"></i>
                        <span class="hidden-sm hidden-xs"> Delete</span>
                    </a>
                </div>
            </div>
            <!-- /.End Button -->
        </div>
        <!-- /.box-body -->
    </div>
    <!-- /.box -->
</section>
<!-- /.content -->
</div>
@endsection