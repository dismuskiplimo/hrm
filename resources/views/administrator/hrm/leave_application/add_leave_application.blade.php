@extends('administrator.master')
@section('title', 'Add Leave Application')

@section('main_content')
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Add Leave Application
    </h1>
    <ol class="breadcrumb">
      <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
      <li><a>Setting</a></li>
      <li><a href="{{ url('/hrm/leave_application') }}">Add Leave Application</a></li>
      <li class="active">Add Leave Application</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">

    <!-- SELECT2 EXAMPLE -->
    <div class="box box-default">
      <div class="box-header with-border">
        <h3 class="box-title">Add Leave Application (Days Left for the year {{ date('Y') }} - {{ auth()->user()->annual_leaves()->where('year', date('Y'))->first()->days_left }} Days)</h3>

        <div class="box-tools pull-right">
          <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
        </div>
      </div>
      <!-- /.box-header -->
      <form action="{{ url('/hrm/leave_application/store') }}" method="post" name="add_form_leave_application" class="add_form_leave_application">
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
              <p class="text-yellow">Enter New Application details. All field are required. </p>
              @endif
            </div>
            <!-- /.Notification Box -->

            <div class="col-md-6">

              <label for="leave_category">Leave Category <span class="text-danger">*</span></label>
              
              <div class="form-group{{ $errors->has('leave_category') ? ' has-error' : '' }} has-feedback">
                <select name="leave_category_id"  class="form-control" id = "leave_category">
                  <option value="" selected disabled>Select one</option>
                  @foreach( $leave_categorys as $leave_category)
                  <option value="{{ $leave_category->id }}" data-name="{{ strtolower($leave_category->leave_category) }}"> {{ $leave_category->leave_category }} </option>
                  @endforeach
                </select>
                @if ($errors->has('leave_category'))
                <span class="help-block">
                  <strong>{{ $errors->first('leave_category') }}</strong>
                </span>
                @endif
              </div>
              <!-- /.form-group -->

              <div class="col-md-6">
                <div class="form-group">
                  <label>Start Date:</label>

                  <div class="input-group date">
                    <div class="input-group-addon">
                      <i class="fa fa-calendar"></i>
                    </div>
                    <input type="text" name="start_date" class="form-control pull-right" id="datepicker">
                  </div>
                  <!-- /.input group -->
                </div>

              </div>
              <div class="col-md-6">
               <div class="form-group">
                <label>End Date:</label>

                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" name="end_date" class="form-control pull-right" id="datepicker2">
                </div>
                <!-- /.input group -->
              </div>
            </div>





            <div class="form-group">
              <label>Date of return from Last Leave:</label>

              <div class="input-group date">
                <div class="input-group-addon">
                  <i class="fa fa-calendar"></i>
                </div>
                <input type="text" name="last_leave_date" class="form-control pull-right" id="datepicker3">
              </div>
              <!-- /.input group -->
            </div>

            <label for="last_leave_period">Period of Last Leave in Days <span class="text-danger"></span></label>
            <div class="form-group{{ $errors->has('last_leave_period') ? ' has-error' : '' }} has-feedback">
              <input type="number" name="last_leave_period" id="last_leave_period" class="form-control" value="{{ old('last_leave_period') }}" placeholder="Enter Period of Last Leave..">
              @if ($errors->has('last_leave_period'))
              <span class="help-block">
                <strong>{{ $errors->first('last_leave_period') }}</strong>
              </span>
              @endif
            </div>
            <!-- /.form-group -->

            <label for="leave_category">Category of Last Leave <span class="text-danger"></span></label>
            <div class="form-group{{ $errors->has('leave_category') ? ' has-error' : '' }} has-feedback">
              <select name="last_leave_category_id"  class="form-control">
                <option value="" selected disabled>Select one</option>
                @foreach( $leave_categorys as $leave_category)
                <option value="{{ $leave_category->id }}"> {{ $leave_category->leave_category }} </option>
                @endforeach
              </select>
              @if ($errors->has('leave_category'))
              <span class="help-block">
                <strong>{{ $errors->first('leave_category') }}</strong>
              </span>
              @endif
            </div>
            <!-- /.form-group -->

            <label for="leave_address">Leave Address <span class="text-danger"></span></label>
            <div class="form-group{{ $errors->has('leave_address') ? ' has-error' : '' }} has-feedback">
              <textarea class="textarea" name="leave_address"  placeholder="Enter leave_address.." style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">{{ old('leave_address') }}</textarea>
              @if ($errors->has('leave_address'))
              <span class="help-block">
                <strong>{{ $errors->first('leave_address') }}</strong>
              </span>
              @endif
            </div>
            <!-- /.form-group -->

            <label for="during_leave">Performing person during leave <span class="text-danger"></span></label>
            <div class="form-group{{ $errors->has('during_leave') ? ' has-error' : '' }} has-feedback">
              <input type="text" name="during_leave" id="during_leave" class="form-control" value="{{ old('during_leave') }}" placeholder="Enter Performing person during leave..">
              @if ($errors->has('during_leave'))
              <span class="help-block">
                <strong>{{ $errors->first('during_leave') }}</strong>
              </span>
              @endif
            </div>
            <!-- /.form-group -->

            
            <label for="recommender">Person who will be recommending you for leave <span class="text-danger"></span></label>

            <div class="form-group{{ $errors->has('recommender_id') ? ' has-error' : '' }} has-feedback">
              <select name="recommender_id"  class="form-control">
                <option value="" selected disabled>Select one</option>
                <option value="">None</option>
                <?php 
                  $recommenders = \App\User::where('deletion_status', '0')->where('id', '!=', auth()->user()->id)->orderBy('name', 'ASC')->get();
                ?>
                @foreach( $recommenders as $recommender)
                  <option value="{{ $recommender->id }}"> {{ $recommender->name }} </option>
                @endforeach
              </select>
              @if ($errors->has('recommender_id'))
              <span class="help-block">
                <strong>{{ $errors->first('recommender_id') }}</strong>
              </span>
              @endif
            </div>
          


          </div>
          <!-- /.col -->

          

          <div class="col-md-12">
            <label for="reason">Reason <span class="text-danger">*</span></label>
            <div class="form-group{{ $errors->has('reason') ? ' has-error' : '' }} has-feedback">
              <textarea class="textarea" name="reason"  placeholder="Enter reason Details.." style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">{{ old('reason') }}</textarea>
              @if ($errors->has('reason'))
              <span class="help-block">
                <strong>{{ $errors->first('reason') }}</strong>
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
        <a href="{{ url('/hrm/leave_application') }}" class="btn btn-danger btn-flat"><i class="icon fa fa-close"></i> Cancel</a>
        <button type="submit" class="btn btn-primary btn-flat"><i class="icon fa fa-plus"></i> Add leave application</button>
      </div>
    </form>
  </div>
  <!-- /.box -->


</section>
<!-- /.content -->
</div>
<script type="text/javascript">
  document.forms['add_form_leave_application'].elements['publication_status'].value = "{{ old('publication_status') }}";
</script>
@endsection
