<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Admin Login</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="{{ asset('public/backend/bower_components/bootstrap/dist/css/bootstrap.min.css') }}">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{ asset('public/backend/bower_components/font-awesome/css/font-awesome.min.css') }}">
    <!-- Ionicons -->
    <link rel="stylesheet" href="{{ asset('public/backend/bower_components/Ionicons/css/ionicons.min.css') }}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ asset('public/backend/dist/css/AdminLTE.min.css') }}">
    <!-- iCheck -->
    <link rel="stylesheet" href="{{ asset('public/backend/plugins/iCheck/square/blue.css') }}">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page">
    <div class="container">
        <div class="row">

            <div class="col-lg-8">
                <div class="login-box" style="width:100%">
                    <div class="login-logo">
                        <a><b class="white-text">Notice Board</b></a>
                    </div>

                    <div class="login-box-body">
                        <?php $notices = \App\Notice::orderBy('created_at', 'DESC')->paginate(20); ?>

                        @foreach($notices as $notice)
                            <div class="row">

                               
                            <!-- /.col -->
                            <div class="col-md-12">
                                <div class="">
                                    
                                    <div class="">
                                        <div>

                                            <!-- notice details -->
                                            <table id="example1" class="table table-bordered table-striped">
                                                <tbody>
                                                    <tr>
                                                        <td><strong>{{ $notice->notice_title }}</strong></td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td style="text-align: justify;">{!! $notice->description !!}</td>
                                                        
                                                    </tr>
                                                    
                                                    </tbody>
                                                </table>
                                                <!-- /.notice details -->
                                            </div>
                                          
                                            </div>
                                            <!-- /.tab-content -->
                                        </div>
                                        <!-- /.nav-tabs-custom -->
                                    </div>
                                    <!-- /.col -->
                                </div>
                                <!-- /.row -->
                                @endforeach

                                <div style="text-align: center;">
                                    {{ $notices->links() }}
                                </div>
                    </div>
                </div>
                
            </div>

            <div class="col-lg-4">
                <div class="login-box" style="width:100%">
                    <div class="login-logo" style="margin-top:50px">
                        <a><b class="white-text">{{ env('APP_NAME') }}</b></a>
                    </div>
                    <!-- /.login-logo -->
                    <div class="login-box-body">
                        <p class="login-box-msg">Sign in to start your session</p>

                        <form action="{{ route('login') }}" method="post">
                            {{ csrf_field() }}
                            <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }} has-feedback">
                                <input type="email" name="email" class="form-control" value="{{ old('email') }}" placeholder="Email" required>
                                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                                @if ($errors->has('email'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('email') }}</strong>
                                </span>
                                @endif
                            </div>
                            <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }} has-feedback">
                                <input type="password" name="password" class="form-control" placeholder="Password" required>
                                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                @if ($errors->has('password'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('password') }}</strong>
                                </span>
                                @endif
                            </div>
                            <div class="row">
                                <div class="col-xs-8">
                                    <div class="checkbox icheck">
                                        <label>
                                            <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> Remember Me
                                        </label>
                                    </div>
                                </div>
                                <!-- /.col -->
                                <div class="col-xs-4">
                                    <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                                </div>
                                <!-- /.col -->
                            </div>
                        </form>

                     <!--<a href="{{ route('password.request') }}">I forgot my password</a><br>
                     <a href="{{ route('register') }}">Register a new membership</a><br> -->
                    </div>
                    <!-- /.login-box-body -->
                </div>
                <!-- /.login-box -->
            </div>

        </div>
    </div>
    

            <!-- jQuery 3 -->
            <script src="{{ asset('public/backend/bower_components/jquery/dist/jquery.min.js') }}"></script>
            <!-- Bootstrap 3.3.7 -->
            <script src="{{ asset('public/backend/bower_components/bootstrap/dist/js/bootstrap.min.js') }}"></script>
            <!-- iCheck -->
            <script src="{{ asset('public/backend/plugins/iCheck/icheck.min.js') }}"></script>
            <script>
                $(function () {
                    $('input').iCheck({
                        checkboxClass: 'icheckbox_square-blue',
                        radioClass: 'iradio_square-blue',
        increaseArea: '20%' // optional
    });
                });
            </script>
        </body>
        </html>
