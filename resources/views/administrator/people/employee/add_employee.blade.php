@extends('administrator.master')
@section('title', 'Add team member')

@section('main_content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            TEAM
        </h1>
        <ol class="breadcrumb">
            <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li><a href="{{ url('/people/employees') }}">Team</a></li>
            <li class="active">Add team member</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <!-- SELECT2 EXAMPLE -->
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Add team member</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <form action="{{ url('people/employees/store') }}" method="post" name="employee_add_form">
                {{ csrf_field() }}
                <div class="box-body">
                    <div class="row">
                        <!-- Notification Box -->
                        <div class="col-md-12">
                            @if (!empty(Session::get('message')))
                            <div class="alert alert-success alert-dismissible" id="notification_box">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <i class="icon fa fa-check"></i> {{ Session::get('message') }}
                            </div>
                            @elseif (!empty(Session::get('exception')))
                            <div class="alert alert-warning alert-dismissible" id="notification_box">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <i class="icon fa fa-warning"></i> {{ Session::get('exception') }}
                            </div>
                            @else
                            <p class="text-yellow">Enter team member details. All (*)field are required. (Default password for added user is 12345678)</p>
                            @endif
                        </div>
                        <!-- /.Notification Box -->

                        <div class="col-md-6">
                            <label for="employee_id">ID <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('employee_id') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="employee_id" id="employee_id" class="form-control" value="{{ old('employee_id') }}" placeholder="Enter employee id..">
                                @if ($errors->has('employee_id'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('employee_id') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="name">Name <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="name" id="name" class="form-control" value="{{ old('name') }}" placeholder="Enter name..">
                                @if ($errors->has('name'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('name') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="father_name">Father's Name</label>
                            <div class="form-group{{ $errors->has('father_name') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="father_name" id="father_name" class="form-control" value="{{ old('father_name') }}" placeholder="Enter father's name..">
                                @if ($errors->has('father_name'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('father_name') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="mother_name">Mother's Name </label>
                            <div class="form-group{{ $errors->has('mother_name') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="mother_name" id="mother_name" class="form-control" value="{{ old('mother_name') }}" placeholder="Enter mother's name..">
                                @if ($errors->has('mother_name'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('mother_name') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="spouse_name">Spouse Name </label>
                            <div class="form-group{{ $errors->has('spouse_name') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="spouse_name" id="spouse_name" class="form-control" value="{{ old('spouse_name') }}" placeholder="Enter spouse name..">
                                @if ($errors->has('spouse_name'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('spouse_name') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="email">Email <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="email" id="email" class="form-control" value="{{ old('email') }}" placeholder="Enter email address..">
                                @if ($errors->has('email'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('email') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="contact_no_one">Contact No<span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('contact_no_one') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="contact_no_one" id="contact_no_one" class="form-control" value="{{ old('contact_no_one') }}" placeholder="Enter contact no..">
                                @if ($errors->has('contact_no_one'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('contact_no_one') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="emergency_contact">Emergency Contact</label>
                            <div class="form-group{{ $errors->has('emergency_contact') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="emergency_contact" id="emergency_contact" class="form-control" value="{{ old('emergency_contact') }}" placeholder="Enter emergency contact no..">
                                @if ($errors->has('emergency_contact'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('emergency_contact') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="web">Web</label>
                            <div class="form-group{{ $errors->has('web') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="web" id="web" class="form-control" value="{{ old('web') }}" placeholder="Enter web..">
                                @if ($errors->has('web'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('web') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="gender">Gender <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('gender') ? ' has-error' : '' }} has-feedback">
                                <select name="gender" id="gender" class="form-control">
                                    <option value="" selected disabled>Select one</option>
                                    <option value="m">Male</option>
                                    <option value="f">Female</option>
                                </select>
                                @if ($errors->has('gender'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('gender') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="datepicker4">Joining Date<span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('joining_date') ? ' has-error' : '' }} has-feedback">
                                <div class="input-group date">
                                    <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                    <input type="text" name="joining_date" class="form-control pull-right" id="datepicker4" placeholder="yyyy-mm-dd">
                                </div>
                                @if ($errors->has('joining_date'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('joining_date') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->
                        </div>
                        <!-- /.col -->

                        <div class="col-md-6">
                            <label for="present_address">Present Address<span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('present_address') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="present_address" id="present_address" class="form-control" value="{{ old('present_address') }}" placeholder="Enter present address..">
                                @if ($errors->has('present_address'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('present_address') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="permanent_address">Permanent Address</label>
                            <div class="form-group{{ $errors->has('permanent_address') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="permanent_address" id="permanent_address" class="form-control" value="{{ old('permanent_address') }}" placeholder="Enter permanent address..">
                                @if ($errors->has('permanent_address'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('permanent_address') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="home_district">Home District</label>
                            <div class="form-group{{ $errors->has('home_district') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="home_district" id="home_district" class="form-control" value="{{ old('home_district') }}" placeholder="Enter home district..">
                                @if ($errors->has('home_district'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('home_district') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="id_name">ID Name</label>
                            <div class="form-group{{ $errors->has('id_name') ? ' has-error' : '' }} has-feedback">
                                <select name="id_name" id="id_name" class="form-control">
                                    <option value="" selected disabled>Select one</option>
                                    <option value="1">NID</option>
                                    <option value="2">Passport</option>
                                    <option value="3">Driving License</option>
                                </select>
                                @if ($errors->has('id_name'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('id_name') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="id_number">ID Number</label>
                            <div class="form-group{{ $errors->has('id_number') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="id_number" id="id_number" class="form-control" value="{{ old('id_number') }}" placeholder="Enter id number..">
                                @if ($errors->has('id_number'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('id_number') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="designation_id">Designation <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('designation_id') ? ' has-error' : '' }} has-feedback">
                                <select name="designation_id" id="designation_id" class="form-control">
                                    <option value="" selected disabled>Select one</option>
                                    @foreach($designations as $designation)
                                    <option value="{{ $designation['id'] }}">{{ $designation['designation'] }}</option>
                                    @endforeach
                                </select>
                                @if ($errors->has('designation_id'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('designation_id') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="joining_position">Joining Position <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('joining_position') ? ' has-error' : '' }} has-feedback">
                                <select name="joining_position" id="joining_position" class="form-control">
                                    <option value="" selected disabled>Select one</option>
                                    @foreach($designations as $designation)
                                    <option value="{{ $designation['id'] }}">{{ $designation['designation'] }}</option>
                                    @endforeach
                                </select>
                                @if ($errors->has('joining_position'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('joining_position') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="marital_status">Marital Status </label>
                            <div class="form-group{{ $errors->has('marital_status') ? ' has-error' : '' }} has-feedback">
                                <select name="marital_status" id="marital_status" class="form-control">
                                    <option value="" selected disabled>Select one</option>
                                    <option value="1">Married</option>
                                    <option value="2">Single</option>
                                    <option value="3">Divorced</option>
                                    <option value="4">Separated</option>
                                    <option value="5">Widowed</option>
                                </select>
                                @if ($errors->has('marital_status'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('marital_status') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->
                            <label for="datepicker">Date of Birth</label>
                            <div class="form-group{{ $errors->has('date_of_birth') ? ' has-error' : '' }} has-feedback">
                                <div class="input-group date">
                                    <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                    <input type="text" name="date_of_birth" class="form-control pull-right" value="{{ old('date_of_birth') }}" id="datepicker">
                                </div>
                                @if ($errors->has('date_of_birth'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('date_of_birth') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="role">Role<span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('role') ? ' has-error' : '' }} has-feedback">
                                <select name="role" id="role" class="form-control">
                                    <option value="" selected disabled>Select one</option>
                                    @foreach($roles as $role)
                                    <option value="{{ $role->name }}">{{ $role->display_name }}</option>
                                    @endforeach
                                </select>
                                @if ($errors->has('role'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('role') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->
                        </div>
                        <!-- /.col -->
                        <div class="col-md-12">
                            <label for="academic_qualification">Academic Qualification</label>
                            <div class="form-group{{ $errors->has('academic_qualification') ? ' has-error' : '' }} has-feedback">
                                <textarea name="academic_qualification" id="academic_qualification" class="form-control textarea" placeholder="Enter academic qualification..">{{ old('academic_qualification') }}</textarea>
                                @if ($errors->has('academic_qualification'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('academic_qualification') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="professional_qualification">Professional Qualification</label>
                            <div class="form-group{{ $errors->has('professional_qualification') ? ' has-error' : '' }} has-feedback">
                                <textarea name="professional_qualification" id="professional_qualification" class="form-control textarea" placeholder="Enter professional qualification..">{{ old('professional_qualification') }}</textarea>
                                @if ($errors->has('professional_qualification'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('professional_qualification') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="experience">Experience</label>
                            <div class="form-group{{ $errors->has('experience') ? ' has-error' : '' }} has-feedback">
                                <textarea name="experience" id="experience" class="form-control textarea" placeholder="Enter experience..">{{ old('experience') }}</textarea>
                                @if ($errors->has('experience'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('experience') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="reference">Reference</label>
                            <div class="form-group{{ $errors->has('reference') ? ' has-error' : '' }} has-feedback">
                                <textarea name="reference" id="reference" class="form-control textarea" placeholder="Enter reference..">{{ old('reference') }}</textarea>
                                @if ($errors->has('reference'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('reference') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <a href="{{ url('/people/employees') }}" class="btn btn-danger btn-flat"><i class="icon fa fa-close"></i> Cancel</a>
                    <button type="submit" class="btn btn-primary btn-flat"><i class="icon fa fa-plus"></i> Add</button>
                </div>
            </form>
        </div>
        <!-- /.box -->
    </section>
    <!-- /.content -->
</div>
<script type="text/javascript">
    document.forms['employee_add_form'].elements['gender'].value = "{{ old('gender') }}";
        document.forms['employee_add_form'].elements['id_name'].value = "{{ old('id_name') }}";
    document.forms['employee_add_form'].elements['designation_id'].value = "{{ old('designation_id') }}";
    document.forms['employee_add_form'].elements['role'].value = "{{ old('role') }}";
    document.forms['employee_add_form'].elements['joining_position'].value = "{{ old('joining_position') }}";
    document.forms['employee_add_form'].elements['marital_status'].value = "{{ old('marital_status') }}";
</script>
@endsection
