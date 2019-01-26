@extends('administrator.master')
@section('title', 'Update Profile')

@section('main_content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            PROFILE
        </h1>
        <ol class="breadcrumb">
            <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li class="active">Update Profile</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <!-- SELECT2 EXAMPLE -->
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Update Profile</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <form action="{{ url('/profile/update-profile') }}" method="post" name="user_edit_form" enctype="multipart/form-data">
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
                            <p class="text-yellow">You can update your profile. All (<span class="text-danger">*</span>) field are required. </p>
                            @endif
                        </div>
                        <!-- /.Notification Box -->

                        <div class="col-md-6">
                            <label for="name">Full Name <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="name" id="name" class="form-control" value="{{ $user['name'] }}" placeholder="Enter name..">
                                @if ($errors->has('name'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('name') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="email">Email <span class="text-danger">*</span></label>
                            <div class="form-group has-feedback">
                                <input type="text" id="email" class="form-control" value="{{ $user['email'] }}" disabled>
                            </div>
                            <!-- /.form-group -->

                            <label for="contact_no_one">Contact No <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('contact_no_one') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="contact_no_one" id="contact_no_one" class="form-control" value="{{ $user['contact_no_one'] }}" placeholder="Enter contact no..">
                                @if ($errors->has('contact_no_one'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('contact_no_one') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="web">Web <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('web') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="web" id="web" class="form-control" value="{{ $user['web'] }}" placeholder="Enter contact no..">
                                @if ($errors->has('web'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('web') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="avatar">Profile Picture <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('avatar') ? ' has-error' : '' }} has-feedback">
                                <input type="file" name="avatar" id="avatar" class="form-control">
                                <input type="hidden" name="previous_avater" value="{{ $user['avatar'] }}">
                                @if ($errors->has('avatar'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('avatar') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                        </div>
                        <!-- /.col -->

                        <div class="col-md-6">
                            <label for="present_address">Present Address <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('present_address') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="present_address" id="present_address" class="form-control" value="{{ $user['present_address'] }}" placeholder="Enter contact no..">
                                @if ($errors->has('present_address'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('present_address') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->

                            <label for="permanent_address">Permanent Address <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('permanent_address') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="permanent_address" id="permanent_address" class="form-control" value="{{ $user['permanent_address'] }}" placeholder="Enter contact no..">
                                @if ($errors->has('permanent_address'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('permanent_address') }}</strong>
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

                            <label for="datepicker">Date of Birth</label>
                            <div class="form-group{{ $errors->has('date_of_birth') ? ' has-error' : '' }} has-feedback">
                                <div class="input-group date">
                                    <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                    <input type="text" name="date_of_birth" class="form-control pull-right" value="{{ $user['date_of_birth'] }}" id="datepicker">
                                </div>
                                @if ($errors->has('date_of_birth'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('date_of_birth') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->
                        </div>
                        <!-- /.col -->
                        <div class="col-md-6">
                            @if(!empty($user['avatar']))
                            <img src="{{ url('/public/profile_picture/' . $user['avatar']) }}" alt="$user['avatar']" class="img-responsive img-thumbnail" width="250px">
                            @else
                            <img src="{{ url('/public/profile_picture/blank_profile_picture.png') }}" alt="blank_profile_picture" class="img-responsive img-thumbnail" width="250px">
                            @endif
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="submit" class="btn btn-primary btn-flat"><i class="icon fa fa-edit"></i> Update Profile</button>
                </div>
            </form>
        </div>
        <!-- /.box -->
    </section>
    <!-- /.content -->
</div>
<script type="text/javascript">
    document.forms['user_edit_form'].elements['gender'].value = "{{ $user['gender'] }}";
</script>
@endsection
