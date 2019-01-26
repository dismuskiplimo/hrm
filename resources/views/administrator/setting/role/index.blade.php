@extends('administrator.master')
@section('title', 'Role')

@section('main_content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            ROLE
        </h1>
        <ol class="breadcrumb">
            <li><a href="{{ url('/dashboard') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li><a>Setting</a></li>
            <li class="active">Role Types</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">Manage role types</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle=tooltip" title="Remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="box-body">
                <a href="{{route('setting.role.create')}}" class="btn btn-primary btn-flat"><i class="fa fa-plus"></i> Create Role</a>
                <hr>
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
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>SL#</th>
                            <th>Name</th>
                            <th>Display Name</th>
                            <th>Description</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php($sl = 1)
                        @forelse($roles as $role)
                        <tr>
                            <td>{{ $sl++ }}</td>
                            <td>{{$role->name}}</td>
                            <td>{{$role->display_name}}</td>
                            <td>{{$role->description}}</td>
                            <td>
                                <a class="btn btn-info btn-xs btn-flat" style="float: left; margin-right: 5px;" href="{{ route('setting.role.edit', $role->id) }}"><i class="icon fa fa-edit"></i></a>
                                <form action="{{ route('setting.role.destroy', $role->id) }}"  method="POST">
                                 {{csrf_field()}}
                                 {{method_field('DELETE')}}
                                 <button type="submit" class="btn btn-xs btn-danger btn-flat" style="float: left;" type="submit"><i class="icon fa fa-trash"  onclick="return confirm('Are you sure to delete this ?');"></i></button>
                             </form>
                         </td>
                     </tr>
                     @empty
                     <tr>
                        <td colspan="5" class="text-center">No roles</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        <!-- /.box-body -->
    </div>
    <!-- /.box -->
</section>
<!-- /.content -->
</div>
@endsection
