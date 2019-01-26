@extends('administrator.master')
@section('title', 'Departments')

@section('main_content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            PERSONAL EVENT
        </h1>
        <ol class="breadcrumb">
            <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li><a>Setting</a></li>
            <li><a href="{{ url('/setting/personal_events') }}">Personal Events</a></li>
            <li class="active">Edit</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <!-- SELECT2 EXAMPLE -->
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Edit personal event</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <form action="{{ url('/setting/personal-events/update/'. $personal_event['id']) }}" method="post" name="personal_event_edit_form">
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
                            @endif
                        </div>
                        <!-- /.Notification Box -->

                        <div class="col-md-6">
                            <label for="personal_event">Personal Event <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('personal_event') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="personal_event" id="personal_event" class="form-control" value="{{ $personal_event['personal_event'] }}" placeholder="Enter client name..">
                                @if ($errors->has('personal_event'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('personal_event') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->
                            <label for="start_date">Start Date <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('start_date') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="start_date" id="datepicker" class="form-control" value="{{ $personal_event['start_date'] }}">
                                @if ($errors->has('start_date'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('start_date') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->
                            <label for="end_date">End Date <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('end_date') ? ' has-error' : '' }} has-feedback">
                                <input type="text" name="end_date" id="datepicker2" class="form-control" value="{{ $personal_event['end_date'] }}">
                                @if ($errors->has('end_date'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('end_date') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->
                            <label for="publication_status">Publication Status <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('publication_status') ? ' has-error' : '' }} has-feedback">
                                <select name="publication_status" id="publication_status" class="form-control">
                                    <option value="" selected disabled>Select one</option>
                                    <option value="1">Published</option>
                                    <option value="0">Unpublished</option>
                                </select>
                                @if ($errors->has('publication_status'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('publication_status') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->
                        </div>
                        <!-- /.col -->
                        <div class="col-md-12">
                            <label for="personal_event_description">Personal Event Description <span class="text-danger">*</span></label>
                            <div class="form-group{{ $errors->has('personal_event_description') ? ' has-error' : '' }} has-feedback">
                                <textarea class="textarea" name="personal_event_description" id="personal_event_description" placeholder="Enter client description.." style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">{{ $personal_event['personal_event_description'] }}</textarea>
                                @if ($errors->has('personal_event'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('personal_event_description') }}</strong>
                                </span>
                                @endif
                            </div>
                            <!-- /.form-group -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <a href="{{ url('/setting/personal-events') }}" class="btn btn-danger btn-flat"><i class="icon fa fa-close"></i> Cancel</a>
                    <button type="submit" class="btn btn-primary btn-flat"><i class="icon fa fa-edit"></i> Update personal event</button>
                </div>
            </form>
        </div>
        <!-- /.box -->


    </section>
    <!-- /.content -->
</div>
<script type="text/javascript">
    document.forms['personal_event_edit_form'].elements['publication_status'].value = "{{ $personal_event['publication_status'] }}";
</script>
@endsection
