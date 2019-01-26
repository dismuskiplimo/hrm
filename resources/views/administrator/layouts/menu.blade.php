<div id="mainMenu">
    <ul class="sidebar-menu" data-widget="tree">
        <!--<li class="header">&nbsp;</li>-->
        <li><a href="{{ url('/dashboard')}}"><i class="fa fa-dashboard text-purple"></i> <span>Dashboard</span></a></li>
        @permission('hrm-setting')
        <li class="treeview">
            <a href="#">
                <i class="fa fa-cog text-purple"></i> <span>Setting</span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>
            <ul class="treeview-menu">
                <!-- <li><a href="#"><i class="fa fa-circle-o"></i> General Setting</a></li>-->
                <li><a href="{{ url('/setting/client-types') }}"><i class="fa fa-circle-o"></i> Manage Client Types</a></li>
                <li><a href="{{ url('/setting/departments') }}"><i class="fa fa-circle-o"></i> Manage Departments</a></li>
                <li><a href="{{ url('/setting/designations') }}"><i class="fa fa-circle-o"></i> Manage Designations</a></li>
                <!--<li><a href="{{ url('/setting/leave_categories') }}"><i class="fa fa-circle-o"></i> Manage Leave Categories</a></li>-->
                <li><a href="{{ url('/setting/working-days') }}"><i class="fa fa-circle-o"></i> Set Working Day</a></li>
                <li><a href="{{ url('/setting/holidays') }}"><i class="fa fa-circle-o"></i> Holiday List</a></li>
                <li><a href="{{ url('/setting/personal-events') }}"><i class="fa fa-circle-o"></i> Personal Event</a></li>
                <li><a href="{{ url('/setting/award_categories') }}"><i class="fa fa-circle-o"></i> Manage Award Categories</a></li>
                @permission('role')
                <li><a href="{{ route('setting.role.index') }}"><i class="fa fa-circle-o"></i>Role</a></li>
                @endpermission
            </ul>
        </li>
        @endpermission

        @permission('people')
        <li class="treeview">
            <a href="#">
                <i class="fa fa-user text-purple"></i> <span>People</span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>
            <ul class="treeview-menu">
                @permission('manage-employee')
                <li><a href="{{ url('/people/employees') }}"><i class="fa fa-circle-o"></i> Manage Employee</a></li>
                @endpermission
                @permission('manage-clients')
                <li><a href="{{ url('/people/clients') }}"><i class="fa fa-circle-o"></i> Manage Clients</a></li>
                @endpermission
                @permission('manage-references')
                <li><a href="{{ url('/people/references') }}"><i class="fa fa-circle-o"></i> Manage References</a></li>
                @endpermission
            </ul>
        </li>
        @endpermission

        @permission('file-upload')
        <li><a href="{{ url('/folders')}}"><i class="fa fa-cloud-upload text-purple"></i> <span>File Upload</span></a></li>
        @endpermission


        @permission('sms')
        <li><a href="{{ url('/sms')}}"><i class="fa fa-envelope text-purple"></i> <span>SMS</span></a></li>
        @endpermission

        <li class="header">HRM</li>

        @permission('payroll-management')
        <li class="treeview">
            <a href="#">
                <i class="fa fa-dollar text-purple"></i> <span>Payroll Management</span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>
            <ul class="treeview-menu">
                @permission('manage-salary')
                <li><a href="{{ url('/hrm/payroll') }}"><i class="fa fa-circle-o"></i> Manage Salary</a></li>
                @endpermission

                @permission('salary-list')
                <li><a href="{{ url('/hrm/payroll/salary-list') }}"><i class="fa fa-circle-o"></i> Salary List</a></li>
                @endpermission

                @permission('make-payment')
                <li><a href="{{ url('/hrm/salary-payments') }}"><i class="fa fa-circle-o"></i> Make Payment</a></li>
                @endpermission

                @permission('generate-payslip')
                <li><a href="{{ url('/hrm/generate-payslips/') }}"><i class="fa fa-circle-o"></i> Generate Payslip</a></li>
                @endpermission

                @permission('view-my-payslips')
                <li><a href="{{ route('payroll.mine') }}"><i class="fa fa-circle-o"></i> View My Payslips</a></li>
                @endpermission                

                @permission('manage-bonus')
                <li><a href="{{ url('/hrm/bonuses') }}"><i class="fa fa-circle-o"></i> Manage Bonus</a></li>
                @endpermission

                @permission('manage-deduction')
                <li><a href="{{ url('/hrm/deductions') }}"><i class="fa fa-circle-o"></i> Manage Deduction</a></li>
                @endpermission

                @permission('loan-management')
                <li><a href="{{ url('/hrm/loans') }}"><i class="fa fa-circle-o"></i> Loan Management</a></li>
                @endpermission

                @permission('provident-fund')
                <li><a href="{{ url('/hrm/provident-funds') }}"><i class="fa fa-circle-o"></i> Provident Fund</a></li>
                @endpermission
            </ul>
        </li>
        @endpermission

        @permission('attendance-management')
        <li class="treeview">
            <a href="#">
                <i class="fa fa-calendar text-purple"></i> <span>Attendance Management</span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>
            <ul class="treeview-menu">
                @permission('manage-attendance')
                <li><a href="{{ url('/hrm/attendance/manage') }}"><i class="fa fa-circle-o"></i> Manage Attendance</a></li>
                @endpermission

                @permission('attendance-report')
                <li><a href="{{ url('/hrm/attendance/report') }}"><i class="fa fa-circle-o"></i> Attendance Report</a></li>
                @endpermission
            </ul>
        </li>
        @endpermission

        @permission('manage-award')
        <li><a href="{{ url('/hrm/employee-awards') }}"><i class="fa fa-trophy text-purple"></i> <span>Manage Award</span></a></li>
        @endpermission

        @permission('manage-expense')
        <li><a href="{{ url('/hrm/expence/manage-expence') }}"><i class="fa fa-money text-purple"></i> <span>Manage Daily Accounts</span></a></li>
        @endpermission

        @permission('leave-application')
        <li class="treeview">
            <a href="#">
                <i class="glyphicon glyphicon-send text-purple"></i> <span>Leave Application</span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>
            <ul class="treeview-menu">
                @permission('manage-leave-application')
                <li><a href="{{ url('/hrm/application_lists') }}"><i class="fa fa-circle-o"></i> <span>Manage Leave Application</span></a></li>
                @endpermission

                @permission('my-leave-application')
                <li><a href="{{ url('/hrm/leave_application') }}"><i class="fa fa-circle-o"></i> <span>My Leave Application</span></a></li>
                @endpermission
                @permission('leave-reports')
                <li><a href="{{ url('/hrm/leave-reports') }}"><i class="fa fa-circle-o"></i> <span>Leave Reports</span></a></li>
                @endpermission
            </ul>
        </li>
        @endpermission

        @permission('assets')
        <li class="treeview">
            <a href="#">
                <i class="glyphicon glyphicon-briefcase text-purple"></i> <span>Assets</span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>
            <ul class="treeview-menu">
                @permission('asset-management')
                <li><a href="{{ route('assets.manage') }}"><i class="fa fa-circle-o"></i>Manage Assets</a></li>
                @endpermission

                @permission('my-assets')
                <li><a href="{{ route('assets.mine') }}"><i class="glyphicon glyphicon-bell"></i> <span>My Assets</span></a></li>
                @endpermission
            </ul>
        </li>
        @endpermission        

        @permission('notice')
        <li class="treeview">
            <a href="#">
                <i class="glyphicon glyphicon-bell text-purple"></i> <span>Notice</span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>
            <ul class="treeview-menu">
                @permission('manage-notice')
                <li><a href="{{ url('/hrm/notice') }}"><i class="fa fa-circle-o"></i>Manage Notice</a></li>
                @endpermission

                @permission('notice-board')
                <li><a href="{{url('/hrm/notice/show')}}"><i class="glyphicon glyphicon-bell"></i> <span>Notice Board</span></a></li>
                @endpermission
            </ul>
        </li>
        @endpermission

        <li class="header">PROFILE SETTING</li>
        <li><a href="{{ url('/profile/user-profile') }}"><i class="fa fa-user text-purple"></i> <span>Profile</span></a></li>
        <li><a href="{{ url('/profile/change-password') }}"><i class="fa fa-key text-purple"></i> <span>Change Password</span></a></li>
        <li>
            <a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();"><i class="fa fa-lock text-purple"></i> <span>Logout</span></a>
            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                {{ csrf_field() }}
            </form>
        </li>
    </ul>
</div>