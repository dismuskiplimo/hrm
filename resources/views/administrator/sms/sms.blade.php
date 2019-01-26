@extends('administrator.master')
@section('title', 'SMS')

@section('main_content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            SMS
        </h1>
        <ol class="breadcrumb">
            <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li class="active">SMS</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <!-- SELECT2 EXAMPLE -->
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">SMS</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-primary btn-flat" id="btn_individual"><i class="icon fa fa-user"></i> Individual</button>
                        <button type="submit" class="btn btn-primary btn-flat" id="btn_group"><i class="icon fa fa-users"></i> Group</button>
                        <hr>
                    </div>
                </div>
                <!-- end button -->

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
                        @endif
                    </div>
                    <!-- /.Notification Box -->
                </div>
                <!-- end notification -->


                <form action="{{ url('/files/store/') }}" method="post" name="file_name_add_form" enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <div id="individual">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="caption">Number <span class="text-danger">*</span></label>
                                <div class="form-group{{ $errors->has('caption') ? ' has-error' : '' }} has-feedback">
                                    <input type="text" name="caption" id="caption" class="form-control" value="{{ old('caption') }}" placeholder="Enter mobile number..">
                                    @if ($errors->has('caption'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('caption') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        <div class="row">
                            <div class="col-md-6">
                                <label for="publication_status">Message <span class="text-danger">*</span></label>
                                <div class="form-group{{ $errors->has('publication_status') ? ' has-error' : '' }} has-feedback">
                                    <textarea name="message" id="message" cols="30" rows="10" class="form-control"></textarea>
                                    @if ($errors->has('publication_status'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('publication_status') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        <div class="row">
                            <div class="col-md-6">
                                <button type="submit" class="btn btn-primary btn-flat" disabled><i class="icon fa fa-arrow-right"></i> Send</button>
                            </div>
                        </div>
                    </div>
                    <!-- end individual sms -->
                </form>


                <form action="{{ url('/files/store/') }}" method="post" name="file_name_add_form" enctype="multipart/form-data">
                    {{ csrf_field() }}

                    <div id="group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="publication_status">Group Name <span class="text-danger">*</span></label>
                                <div class="form-group{{ $errors->has('publication_status') ? ' has-error' : '' }} has-feedback">
                                    <select name="publication_status" id="publication_status" class="form-control">
                                        <option value="" selected disabled>Select one</option>
                                        <option value="2">Associates</option>
                                        <option value="3">Employees</option>
                                        <option value="4">References</option>
                                        <option value="5">Clients</option>
                                    </select>
                                    @if ($errors->has('publication_status'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('publication_status') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        <div class="row">
                            <div class="col-md-6">
                                <label for="publication_status">Message <span class="text-danger">*</span></label>
                                <div class="form-group{{ $errors->has('publication_status') ? ' has-error' : '' }} has-feedback">
                                    <textarea name="message" id="message" cols="30" rows="10" class="form-control"></textarea>
                                    @if ($errors->has('publication_status'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('publication_status') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        <div class="row">
                            <div class="col-md-6">
                                <button type="submit" class="btn btn-primary btn-flat" disabled><i class="icon fa fa-arrow-right"></i> Send</button>
                            </div>
                        </div>
                    </div>
                    <!-- end group sms -->
                </form>

            </div>
            <!-- end box body -->

        </form>
    </div>
    <!-- /.box -->


</section>
<!-- /.content -->
</div>
<script type="text/javascript">
    $("#individual").hide();
    $("#group").hide();

    $("#btn_individual").click(function () {
        $("#group").hide();
        $("#individual").show(500);
    });

    $("#btn_group").click(function () {
        $("#individual").hide();
        $("#group").show(500);
    });
</script>
@endsection
