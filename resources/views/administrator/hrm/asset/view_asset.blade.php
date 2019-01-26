<?php
use Carbon\Carbon;
?>
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
      <li><a>{{ env('APP_NAME') }}</a></li>
      <li><a href="{{ route('assets.manage') }}">Asset Management</a></li>
      <li class="active">Details</li>
    </ol>
  </ol>
</section>

<!-- Main content -->
<section class="content">
  <!-- Default box -->
  <div class="box">
    <div class="box-header with-border">
      <h3 class="box-title"> {{ $title }}</h3>

      <div class="box-tools pull-right">
        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
      </div>
    </div>
    <div class="box-body">
      <a href="{{ route('assets.manage') }}" class="btn btn-primary btn-flat"><i class="fa fa-arrow-left"></i> Back</a>
      <button class="btn btn-default btn-flat pull-right" onclick="printDiv('printable_area')"><i class="fa fa-print"></i> Print</button>
      <hr>

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
      
      <div id="printable_area">
        <div class="text-center">
          <h4><strong>{{ $title }}</strong></h4>
        </div>
      <table id="example1" class="table table-bordered table-striped">
        <tbody>
          <tr>
            <td width="25%">Asset Type</td>
            <td width="75%">{{ $asset->asset_type }}</td>
          </tr>
          
          <tr>
            <td width="25%">Brand</td>
            <td width="75%">{{ $asset->brand }}</td>
          </tr>
          
          <tr>
            <td width="25%">Model</td>
            <td width="75%">{{ $asset->model }}</td>
          </tr>
          
          <tr>
            <td width="25%">Serial Number</td>
            <td width="75%">{{ $asset->serial_number }}</td>
          </tr>
          
          <tr>
            <td width="25%">Description</td>
            <td width="75%">{!! $asset->description !!}</td>
          </tr>
          
          <tr>
            <td width="25%">Created By</td>
            <td width="75%">{{ $asset->creator ? $asset->creator->name : 'N/A' }}</td>
          </tr>
          
          <tr>
            <td width="25%">Assigned</td>
            <td width="75%">{{ $asset->assigned ? 'YES' : 'NO' }}</td>
          </tr>
          
          <tr>
            <td width="25%">Assigned To</td>
            <td width="75%">{{ $asset->assigned ? $asset->user->name : 'N/A' }}</td>
          </tr>

          <tr>
            <td width="25%">Assigned By</td>
            <td width="75%">{{ $asset->assigned ? $asset->assigner->name : 'N/A' }}</td>
          </tr>

          <tr>
            <td width="25%">Date Assigned</td>
            <td width="75%">{{ $asset->assigned ? $asset->assigned_at : 'N/A' }}</td>
          </tr>

          @permission('asset-management')

          <tr>
            <td width="25%">Disposed</td>
            <td width="75%">{{ $asset->disposed ? 'YES' : 'NO' }}</td>
          </tr>
          
          <tr>
            <td width="25%">Disposed by</td>
            <td width="75%">{{ $asset->disposed ? $asset->disposer->name : 'N/A' }}</td>
          </tr>

          <tr>
            <td width="25%">Reason for disposal</td>
            <td width="75%">{{ $asset->disposed ? $asset->disposed_reason : 'N/A' }}</td>
          </tr>

          @endpermission
    
        </tbody>
      </table>

    </div><!--pintable-->

    @permission('asset-management')

    <div class="btn-group btn-group-justified">
        <div class="btn-group">
            <button href="" class="tip btn btn-warning btn-flat" data-toggle="modal" data-target = "#assign-asset-modal" data-original-title="Click to Assign"{!! $asset->assigned || $asset->disposed ? ' disabled="disabled"' : '' !!}>
                <i class="fa fa-arrow-up"></i>
                <span class="hidden-sm hidden-xs"> Assign Asset</span>
            </button>

            <div class="modal fade" id="assign-asset-modal">
              <div class="modal-dialog">
                <form action="{{ route('assets.assign', ['id' => $asset->id]) }}" method="POST">
                  {{ csrf_field() }}
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title">Assign Asset</h4>
                    </div>

                    <div class="modal-body">
                      <h3>Are you sure you want to Assign the asset ?</h3>
                      
                      <div class="form-group">
                        <label for="">User</label>
                        <select name="user_id" id="" required="" class="form-control">
                            <option value="">Select</option>
                            @foreach($users as $user)
                              <option value="{{ $user->id }}">{{ $user->name }}</option>
                            @endforeach
                        </select>
                      </div>


                      <div class="form-group">
                        <label for="">Current Condition of Asset</label>
                        <textarea name="condition_before" required="" class="form-control" rows="4"></textarea>
                      </div>
                    </div>
                    
                    <div class="modal-footer">
                      <div class="btn-group pull-left">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>  
                      </div> 

                      <div class="btn-group">
                        <button type="submit" class="btn btn-primary">Submit</button>
                      </div> 
                      
                      
                    </div>
                  </div><!-- /.modal-content -->
                </form>
              </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
        </div>
        
        <div class="btn-group">
            <button type="button" class="tip btn btn-primary btn-flat" title="Print" data-original-title="Label Printer" onclick="printDiv('printable_area')">
                <i class="fa fa-print"></i>
                <span class="hidden-sm hidden-xs"> Print</span>
            </button>
        </div>
        
        <div class="btn-group">
            <button class="tip btn btn-success btn-flat" title="" data-original-title="Clear & Release Asset" data-toggle="modal" data-target="#clear-asset-modal"{!! !$asset->assigned || $asset->disposed ? ' disabled="disabled"' : '' !!}>
                <i class="fa fa-check"></i>
                <span class="hidden-sm hidden-xs"> Clear & Release Asset</span>
            </button>

            <div class="modal fade" id="clear-asset-modal">
              <div class="modal-dialog">
                <form action="{{ route('assets.clear', ['id' => $asset->id]) }}" method="POST">
                  {{ csrf_field() }}
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title">Clear & Release Asset</h4>
                    </div>

                    <div class="modal-body">
                      <h3>Are you sure you want to clear & release the asset ?</h3>
                      <p><strong>Previous Condition:</strong> {{ $asset->previous ? $asset->previous->condition_before : 'N/A' }}</p>
                      <p><strong>Current User:</strong> {{ $asset->previous ? $asset->previous->user->name : 'N/A' }}</p>

                      <div class="form-group">
                        <label for="">Condition Now</label>
                        <textarea type="text" name="condition_after" required="" class="form-control" rows="4"></textarea>
                      </div>
                    </div>
                    
                    <div class="modal-footer">
                      <div class="btn-group pull-left">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>  
                      </div> 

                      <div class="btn-group">
                        <button type="submit" class="btn btn-primary">Submit</button>
                      </div> 
                      
                      
                    </div>
                  </div><!-- /.modal-content -->
                </form>
              </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
        </div>
        <div class="btn-group">
            <button class="tip btn btn-warning btn-flat" title="" data-original-title="Clear & Release Asset" data-toggle="modal" data-target="#dispose-asset-modal"{!! $asset->assigned || $asset->disposed ? ' disabled="disabled"' : '' !!}>
                <i class="fa fa-trash"></i>
                <span class="hidden-sm hidden-xs">Dispose Asset</span>
            </button>

            <div class="modal fade" id="dispose-asset-modal">
              <div class="modal-dialog">
                <form action="{{ route('assets.dispose', ['id' => $asset->id]) }}" method="POST">
                  {{ csrf_field() }}
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title">Dispose Asset</h4>
                    </div>

                    <div class="modal-body">
                      <h3>Are you sure you want to dispose the asset ?</h3>

                      <div class="form-group">
                        <label for="">Reason</label>
                        <textarea type="text" name="disposed_reason" required="" class="form-control" rows="4"></textarea>
                      </div>
                    </div>
                    
                    <div class="modal-footer">
                      <div class="btn-group pull-left">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>  
                      </div> 

                      <div class="btn-group">
                        <button type="submit" class="btn btn-primary">Submit</button>
                      </div> 
                      
                      
                    </div>
                  </div><!-- /.modal-content -->
                </form>
              </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
        </div>

        <div class="btn-group">
            <a href="{{ route('assets.update', ['id' => $asset->id]) }}" class="tip btn btn-primary btn-flat" title="Update Asset" data-original-title="Update Asset">
                <i class="fa fa-edit"></i>
                <span class="hidden-sm hidden-xs"> Edit</span>
            </a>
        </div>
        
        <div class="btn-group">
            <form action="{{ route('assets.delete', ['id' => $asset->id]) }}" method="POST"  onsubmit="return confirm('Are you sure to delete this ?');">
              {{ csrf_field() }}
              <button type="submit" class="tip btn btn-danger btn-flat" data-toggle="tooltip" data-original-title="Click to delete"{!! $asset->assigned ? ' disabled="disabled"' : '' !!}>
                  <i class="fa fa-times"></i>
                  <span class="hidden-sm hidden-xs"> Delete</span>
              </button>  
            </form>
            
        </div>
    </div>

    @endpermission

  </div>
  <!-- /.box-body -->

  <div class="box-body">
    <div>
      <h4>Asset History</h4>

      @if(count($asset->history))
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>Assigned To</th> 
              <th>Assigned By</th> 
              <th>Condition Before</th> 
              <th>Condition After</th> 
              <th>Cleared</th> 
              <th>Cleared By</th> 
              <th>Cleared At</th>   
            </tr>
            
          </thead>

          <tbody>
            @foreach($asset->history()->orderBy('created_at', 'DESC')->get() as $history)
              <tr{!! !$history->cleared ? ' class = "warning"' : '' !!}>
                <td>{{ $history->user->name }}</td>
                <td>{{ $history->assigner->name }}</td>
                <td>{{ $history->condition_before }}</td>
                <td>{{ $history->condition_after ? : 'N/A' }}</td>
                <td>{{ $history->cleared ? 'YES' : 'NO' }}</td>
                <td>{{ $history->cleared ? $history->clearer->name : 'N/A' }}</td>
                <td>{{ $history->cleared_at ? : 'N/A' }}</td>
              </tr>
            @endforeach
          </tbody>
        </table>
      @else
        Asset has never been assigned to anybody
      @endif
    </div>
  </div>
</div>
<!-- /.box -->
</section>
<!-- /.content -->
</div>
@endsection
