@extends('administrator.master')
@section('title', 'Dashboard')

@section('main_content')
<style type="text/css">
.modal-title {
  font-weight: bold;
}
.bg-grey{
  background-color: #BDBDBD;
}
.users-list>li {
  width: 10%;
}
</style>
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Dashboard
      <small>Control panel</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Dashboard</li>
    </ol>
  </section>
  @php($user = Auth::user())
  @if($user->access_label == 1)
  <!-- Main content -->
  <section class="content">
    <!-- Small boxes (Stat box) -->
    <div class="row">
    <div class="col-lg-3 col-xs-6">
      <!-- small box -->
      <div class="small-box bg-grey">
        <div class="inner">
          <h3>{{ count($clients) }}</h3>

          <p>Clients</p>
        </div>
        <div class="icon">
          <i class="fa fa-users"></i>
        </div>
        <a href="{{ url('/people/clients') }}" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
      </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-xs-6">
      <!-- small box -->
      <div class="small-box bg-grey">
        <div class="inner">
         <h3>{{ count($references) }}</h3>

          <p>References</p>
        </div>
        <div class="icon">
          <i class="fa fa-envelope"></i>
        </div>
        <a href="{{ url('/people/references') }}" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
      </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-xs-6">
      <!-- small box -->
      <div class="small-box bg-grey">
        <div class="inner">
          <h3>{{ count($employees) }}</h3>

            <p>Employees</p>
        </div>
        <div class="icon">
          <i class="fa fa-file"></i>
        </div>
        <a href="{{ url('/people/employees') }}" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
      </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-xs-6">
      <!-- small box -->
      <div class="small-box bg-grey">
        <div class="inner">
          <h3>{{ count($files) }}</h3>

            <p>Files</p>
        </div>
        <div class="icon">
          <i class="fa fa-image"></i>
        </div>
        <a href="{{ url('/folders') }}" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
      </div>
    </div>
    <!-- ./col -->
  </div>

    @if(count($personal_events)>0)
    <div class="box box-danger">
      <div class="box-header">
        <h3 class="box-title">Events</h3>

        <div class="box-tools">
          <div class="input-group input-group-sm" style="width: 150px;">
            <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

            <div class="input-group-btn">
              <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
            </div>
          </div>
        </div>
      </div>
      <!-- /.box-header -->
      <div class="box-body table-responsive no-padding">
        <table class="table table-hover">
          <tr>
            <th>SL#</th>
            <th>Event Name</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Created By</th>
          </tr>
          @php($sl = 1)
          @foreach($personal_events as $personal_event)
          <tr>
            <td>{{ $sl++ }}</td>
            <td><span class="label label-primary">{{ $personal_event->personal_event }}</span></td>
            <td><span class="label label-warning">{{ date("d F Y", strtotime($personal_event->start_date)) }}</span></td>
            <td><span class="label label-warning">{{ date("d F Y", strtotime($personal_event->end_date)) }}</span></td>
            <td>{{ $personal_event->name }}</td>
          </tr>
          @endforeach
        </table>
      </div>
      <!-- /.box-body -->
    </div>
    <!-- /.box -->
    @endif

  </section>
  <!-- /.content -->
  @endif
</div>
@endsection