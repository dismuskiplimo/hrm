@extends('administrator.master')
@section('title', $title)

@section('main_content')
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      {{ $title }}
    </h1>
    <ol class="breadcrumb">
      <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
      <li><a>Setting</a></li>
      <li><a href="{{ url('/hrm/assets/manage') }}">Asset Management</a></li>
      <li class="active">{{ $title }}</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">

    <!-- SELECT2 EXAMPLE -->
    <div class="box box-default">
      <div class="box-header with-border">
        <h3 class="box-title">{{ $title }}</h3>

        <div class="box-tools pull-right">
          <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
        </div>
      </div>
      <!-- /.box-header -->
      <form action="{{ $page == 'create' ? route('assets.store') : route('assets.update', ['id' => $asset->id]) }}" method="post" name="add_asset">
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
              <p class="text-yellow">Enter Asset details. All fields are required. </p>
              @endif
            </div>

            <div class="col-md-6">
              <div class="form-group">
                <label>Asset Type:</label>

                <div class="input-group">
                  <span class="input-group-addon">
                    <i class="fa fa-briefcase"></i>
                  </span>

                  <input type="text" name="asset_type" class="form-control pull-right" placeholder="e.g fridge, television" value="{{ $asset->asset_type }}">
                </div>

                @if ($errors->has('asset_type'))
                  <span class="help-block">
                    <strong>{{ $errors->first('asset_type') }}</strong>
                  </span>
                @endif
              </div>
            </div>

            <div class="col-md-6">
              <div class="form-group">
                <label>Brand:</label>

                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-briefcase"></i>
                  </div>

                  <input type="text" name="brand" class="form-control pull-right" placeholder="e.g samsung, LG" value="{{ $asset->brand }}">
                </div>

                @if ($errors->has('brand'))
                  <span class="help-block">
                    <strong>{{ $errors->first('brand') }}</strong>
                  </span>
                @endif
              </div>
            </div>

            <div class="col-md-6">
              <div class="form-group">
                <label>Model:</label>

                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-briefcase"></i>
                  </div>

                  <input type="text" name="model" class="form-control pull-right" placeholder="e.g Pavilion G40" value="{{ $asset->model }}">
                </div>

                @if ($errors->has('model'))
                  <span class="help-block">
                    <strong>{{ $errors->first('model') }}</strong>
                  </span>
                @endif
              </div>
            </div>

            <div class="col-md-6">
              <div class="form-group">
                <label>Serial Number:</label>

                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-briefcase"></i>
                  </div>

                  <input type="text" name="serial_number" class="form-control pull-right" placeholder="serial number" value="{{ $asset->serial_number }}">
                </div>

                @if ($errors->has('serial_number'))
                  <span class="help-block">
                    <strong>{{ $errors->first('serial_number') }}</strong>
                  </span>
                @endif
              </div>
            </div>

            <div class="col-md-12">
              <label for="description">Description <span class="text-danger">*</span></label>
              <div class="form-group{{ $errors->has('description') ? ' has-error' : '' }} has-feedback">
                <textarea class="textarea" name="description"  placeholder="Enter description..." style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">{{ old('description') ? : $asset->description }}</textarea>
                
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
          <a href="{{ url('/hrm/assets/manage') }}" class="btn btn-danger btn-flat"><i class="icon fa fa-close"></i> Cancel</a>
          <button type="submit" class="btn btn-primary btn-flat"><i class="icon fa fa-plus"></i> {{ $page == 'create' ? 'Add' : 'Update' }} Asset</button>
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
