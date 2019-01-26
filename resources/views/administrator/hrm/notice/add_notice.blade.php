@extends('administrator.master')
@section('title', 'Add Notice')

@section('main_content')
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Holiday Lists
    </h1>
    <ol class="breadcrumb">
      <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
      <li><a>{{ env('APP_NAME') }}</a></li>
      <li><a href="{{ url('/hrm/notice') }}">Manage Notice</a></li>
      <li class="active">Add Notice</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">

    <!-- SELECT2 EXAMPLE -->
    <div class="box box-default">
      <div class="box-header with-border">
        <h3 class="box-title">Add Notice</h3>

        <div class="box-tools pull-right">
          <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
        </div>
      </div>
      <!-- /.box-header -->
      <form action="{{ url('hrm/notice/store') }}" method="post" name="notice_add_form">
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
              <p class="text-yellow">Enter Notice details. All field are required. </p>
              @endif
            </div>
            <!-- /.Notification Box -->

            <div class="col-md-6">
              <label for="notice_title">Title <span class="text-danger">*</span></label>
              <div class="form-group{{ $errors->has('notice_title') ? ' has-error' : '' }} has-feedback">
                <input type="text" name="notice_title" id="notice_title" class="form-control" value="{{ old('notice_title') }}" placeholder="Enter notice title..">
                @if ($errors->has('notice_title'))
                <span class="help-block">
                  <strong>{{ $errors->first('notice_title') }}</strong>
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
              <label for="description">Description <span class="text-danger">*</span></label>
              <div class="form-group{{ $errors->has('description') ? ' has-error' : '' }} has-feedback">
                <textarea class="textarea" name="description" id="description" placeholder="Enter Notice description.." style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">{{ old('description') }}</textarea>
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
          <a href="{{ url('/hrm/notice') }}" class="btn btn-danger btn-flat"><i class="icon fa fa-close"></i> Cancel</a>
          <button type="submit" class="btn btn-primary btn-flat"><i class="icon fa fa-plus"></i> Add Notice</button>
        </div>
      </form>
    </div>
    <!-- /.box -->


  </section>
  <!-- /.content -->
</div>
<script type="text/javascript">
document.forms['notice_add_form'].elements['publication_status'].value = "{{ old('publication_status') }}";
</script>
@endsection
