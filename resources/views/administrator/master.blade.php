<!DOCTYPE html>
<html>
    <!-- head -->
    @include('administrator.layouts.head')
    <!-- /.head -->
    <body class="hold-transition skin-purple-light sidebar-mini">
        <!--<body class="hold-transition skin-blue sidebar-mini">-->
        <!-- Site wrapper -->
        <div class="wrapper">

            <!-- header -->
            @include('administrator.layouts.header')
            <!-- /.header -->

            <!-- Left side column. contains the side bar -->
            @include('administrator.layouts.left_side_bar')
            <!-- /.Left Side Bar -->

            <!-- Content Wrapper. Contains page content -->
            @yield('main_content')
            <!-- /.content-wrapper -->

            <!-- Footer. contains the footer -->
            @include('administrator.layouts.footer')
            <!-- /.Footer -->

            <!-- Add the side bar's background. This div must be placed immediately after the control sidebar -->
            <div class="control-sidebar-bg"></div>
        </div>
        <!-- ./wrapper -->

        <!-- Scripts. contains the script -->
        @include('administrator.layouts.scripts')
        <!-- /.Scripts -->
    </body>
</html>
