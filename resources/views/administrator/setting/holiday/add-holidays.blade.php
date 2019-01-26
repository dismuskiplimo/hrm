@extends('administrator.master')
@section('title', 'Add Holiday Lists')

@section('main_content')
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Holiday Lists
    </h1>
    <ol class="breadcrumb">
      <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
      <li><a>Setting</a></li>
      <li><a href="{{ url('/setting/holidays') }}">Holiday Lists</a></li>
      <li class="active">Add Holiday Lists</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">

    <!-- SELECT2 EXAMPLE -->
    <div class="box box-default">
      <div class="box-header with-border">
        <h3 class="box-title">Add Holiday Lists</h3>

        <div class="box-tools pull-right">
          <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
        </div>
      </div>
      <!-- /.box-header -->
      <form action="{{ url('setting/holidays/store') }}" method="post" name="holidays_add_form">
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
              <p class="text-yellow">Enter holidays details. All field are required. </p>
              @endif
            </div>
            <!-- /.Notification Box -->

            <div class="col-md-6">
              <label for="holiday_name">Event Name <span class="text-danger">*</span></label>
              <div class="form-group{{ $errors->has('holiday_name') ? ' has-error' : '' }} has-feedback">
                <input type="text" name="holiday_name" id="holiday_name" class="form-control" value="{{ old('holiday_name') }}" placeholder="Enter event name..">
                @if ($errors->has('holiday_name'))
                <span class="help-block">
                  <strong>{{ $errors->first('holiday_name') }}</strong>
                </span>
                @endif
              </div>
              <!-- /.form-group -->

              <div class="form-group{{ $errors->has('date') ? ' has-error' : '' }}">
                <label>Date:</label>

                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" name="date" class="form-control pull-right" id="datepicker">
                  @if ($errors->has('date'))
                  <span class="help-block">
                    <strong>{{ $errors->first('date') }}</strong>
                  </span>
                  @endif
                </div>
                <!-- /.input group -->
              </div>


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
              <label for="description">Event Description <span class="text-danger">*</span></label>
              <div class="form-group{{ $errors->has('description') ? ' has-error' : '' }} has-feedback">
                <textarea class="textarea" name="description" id="description" placeholder="Enter Holiday description.." style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">{{ old('description') }}</textarea>
                @if ($errors->has('description'))
                <span class="help-block">
                  <strong>{{ $errors->first('description') }}</strong>
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
          <a href="{{ url('setting/holidays') }}" class="btn btn-danger btn-flat"><i class="icon fa fa-close"></i> Cancel</a>
          <button type="submit" class="btn btn-primary btn-flat"><i class="icon fa fa-plus"></i> Add Holiday List</button>
        </div>
      </form>
    </div>
    <!-- /.box -->


  </section>
  <!-- /.content -->
</div>
<script type="text/javascript">
  document.forms['holidays_add_form'].elements['publication_status'].value = "{{ old('publication_status') }}";
</script>
@endsection
