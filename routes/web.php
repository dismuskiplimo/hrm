<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
 */

Route::get('/', 'Auth\LoginController@showLoginForm')->name('login');

Route::get('/add-time', 'FrontController@addTime')->name('add-time');

Auth::routes();

Route::group(['prefix' => 'setting', 'middleware' => 'auth', 'as' => 'setting.'], function () {
	Route::resource('role', 'RoleController');
});

Route::group(['middleware' => 'auth'], function () {

	Route::get('/dashboard', 'HomeController@index')->name('dashboard');

	// Client Types Section //
	Route::get('/setting/client-types', 'ClientTypeController@index');
	Route::get('/setting/client-types/create', 'ClientTypeController@create');
	Route::post('/setting/client-types/store', 'ClientTypeController@store');
	Route::get('/setting/client-types/published/{id}', 'ClientTypeController@published');
	Route::get('/setting/client-types/unpublished/{id}', 'ClientTypeController@unpublished');
	Route::get('/setting/client-types/details/{id}', 'ClientTypeController@show');
	Route::get('/setting/client-types/edit/{id}', 'ClientTypeController@edit');
	Route::post('/setting/client-types/update/{id}', 'ClientTypeController@update');
	Route::get('/setting/client-types/delete/{id}', 'ClientTypeController@destroy');

	// Departments Section //
	Route::get('/setting/departments', 'DepartmentController@index');
	Route::get('/setting/departments/create', 'DepartmentController@create');
	Route::post('/setting/departments/store', 'DepartmentController@store');
	Route::get('/setting/departments/published/{id}', 'DepartmentController@published');
	Route::get('/setting/departments/unpublished/{id}', 'DepartmentController@unpublished');
	Route::get('/setting/departments/details/{id}', 'DepartmentController@show');
	Route::get('/setting/departments/edit/{id}', 'DepartmentController@edit');
	Route::post('/setting/departments/update/{id}', 'DepartmentController@update');
	Route::get('/setting/departments/delete/{id}', 'DepartmentController@destroy');

	// Leave Category Section //
	Route::get('/setting/leave_categories', 'LeaveCategoryController@index');
	Route::get('/setting/leave_categories/create', 'LeaveCategoryController@create');
	Route::post('/setting/leave_categories/store', 'LeaveCategoryController@store');
	Route::get('/setting/leave_categories/published/{id}', 'LeaveCategoryController@published');
	Route::get('/setting/leave_categories/unpublished/{id}', 'LeaveCategoryController@unpublished');
	Route::get('/setting/leave_categories/details/{id}', 'LeaveCategoryController@show');
	Route::get('/setting/leave_categories/edit/{id}', 'LeaveCategoryController@edit');
	Route::post('/setting/leave_categories/update/{id}', 'LeaveCategoryController@update');
	Route::get('/setting/leave_categories/delete/{id}', 'LeaveCategoryController@destroy');

	// Designations Section //
	Route::get('/setting/designations', 'DesignationController@index');
	Route::get('/setting/designations/create', 'DesignationController@create');
	Route::post('/setting/designations/store', 'DesignationController@store');
	Route::get('/setting/designations/published/{id}', 'DesignationController@published');
	Route::get('/setting/designations/unpublished/{id}', 'DesignationController@unpublished');
	Route::get('/setting/designations/details/{id}', 'DesignationController@show');
	Route::get('/setting/designations/edit/{id}', 'DesignationController@edit');
	Route::post('/setting/designations/update/{id}', 'DesignationController@update');
	Route::get('/setting/designations/delete/{id}', 'DesignationController@destroy');

	// Clients Section //
	Route::get('/people/clients', 'ClientController@index');
	Route::get('/people/clients/print', 'ClientController@print');
	Route::get('/people/clients/clients-pdf', 'ClientController@clients_pdf');
	Route::get('/people/clients/create', 'ClientController@create');
	Route::post('/people/clients/store', 'ClientController@store');
	Route::get('/people/clients/active/{id}', 'ClientController@active');
	Route::get('/people/clients/deactive/{id}', 'ClientController@deactive');
	Route::get('/people/clients/details/{id}', 'ClientController@show');
	Route::get('/people/clients/download-pdf/{id}', 'ClientController@pdf');
	Route::get('/people/clients/edit/{id}', 'ClientController@edit');
	Route::post('/people/clients/update/{id}', 'ClientController@update');
	Route::get('/people/clients/delete/{id}', 'ClientController@destroy');

	// Reference Section //
	Route::get('/people/references', 'ReferenceController@index');
	Route::get('/people/references/print', 'ReferenceController@print');
	Route::get('/people/references/references-pdf', 'ReferenceController@references_pdf');
	Route::get('/people/references/create', 'ReferenceController@create');
	Route::post('/people/references/store', 'ReferenceController@store');
	Route::get('/people/references/active/{id}', 'ReferenceController@active');
	Route::get('/people/references/deactive/{id}', 'ReferenceController@deactive');
	Route::get('/people/references/details/{id}', 'ReferenceController@show');
	Route::get('/people/references/download-pdf/{id}', 'ReferenceController@pdf');
	Route::get('/people/references/edit/{id}', 'ReferenceController@edit');
	Route::post('/people/references/update/{id}', 'ReferenceController@update');
	Route::get('/people/references/delete/{id}', 'ReferenceController@destroy');

	// Employee Section //
	Route::get('/people/employees', 'EmployeeController@index');
	Route::get('/people/employees/print', 'EmployeeController@print');
	Route::get('/people/employees/create', 'EmployeeController@create');
	Route::post('/people/employees/store', 'EmployeeController@store');
	Route::get('/people/employees/active/{id}', 'EmployeeController@active');
	Route::get('/people/employees/deactive/{id}', 'EmployeeController@deactive');
	Route::get('/people/employees/details/{id}', 'EmployeeController@show');
	Route::get('/people/employees/download-pdf/{id}', 'EmployeeController@pdf');
	Route::get('/people/employees/edit/{id}', 'EmployeeController@edit');
	Route::post('/people/employees/update/{id}', 'EmployeeController@update');
	Route::get('/people/employees/delete/{id}', 'EmployeeController@destroy');

	// Folder Section //
	Route::get('/folders', 'FolderController@index');
	Route::get('/folders/create', 'FolderController@create');
	Route::post('/folders/store', 'FolderController@store');

	// File Section //
	Route::get('/files/{id}', 'FileController@index');
	Route::get('/files/create/{id}', 'FileController@create');
	Route::post('/files/store/{id}', 'FileController@store');
	Route::get('/files/download/{file}', 'FileController@download');

	// Profile Section
	Route::get('/profile/user-profile', 'ProfileController@index');
	Route::post('/profile/update-profile', 'ProfileController@update');
	Route::get('/profile/change-password', 'ProfileController@change_password');
	Route::post('/profile/update-password', 'ProfileController@update_password');

	//Custom Invoice
	Route::get('/custom-invoice', 'InvoiceController@index');
	Route::post('/make-invoice', 'InvoiceController@create');

	//SMS Section
	Route::get('/sms', 'SmsController@index');

	//////////////////////////// HRM ////////////////////////////

	//Attendance Section
	Route::get('/hrm/attendance/manage', 'AttendanceController@index');
	Route::post('/hrm/attendance/set', 'AttendanceController@set_attendance');
	Route::post('/hrm/attendance/store', 'AttendanceController@store');
	Route::post('/hrm/attendance/update', 'AttendanceController@update');
	Route::get('/hrm/attendance/report', 'AttendanceController@report');
	Route::post('/hrm/attendance/get-report', 'AttendanceController@get_report');

	//Assets Section
	Route::get('/hrm/assets/manage', 'AssetController@index')->name('assets.manage');
	Route::get('/hrm/assets/mine', 'AssetController@my_assets')->name('assets.mine');

	Route::get('/hrm/assets/create', 'AssetController@add_asset')->name('assets.create');
	Route::post('/hrm/assets/store', 'AssetController@store')->name('assets.store');

	Route::get('/hrm/assets/{id}/view', 'AssetController@view')->name('assets.view');
	Route::post('/hrm/assets/{id}/assign', 'AssetController@assign')->name('assets.assign');
	Route::post('/hrm/assets/{id}/clear', 'AssetController@clear')->name('assets.clear');
	Route::post('/hrm/assets/{id}/dispose', 'AssetController@dispose')->name('assets.dispose');
	Route::post('/hrm/assets/{id}/delete', 'AssetController@delete')->name('assets.delete');

	Route::get('/hrm/assets/{id}/update', 'AssetController@update_asset')->name('assets.update');
	Route::post('/hrm/assets/{id}/update', 'AssetController@update');
	Route::get('/hrm/assets/report', 'AssetController@report');
	Route::post('/hrm/asset/get-report', 'AssetController@get_report');

	// Payroll Section
	Route::get('/hrm/payroll', 'PayrollController@index');
	Route::post('/hrm/payroll/go', 'PayrollController@go');
	Route::get('/hrm/payroll/manage-salary/{id}', 'PayrollController@create');
	Route::post('/hrm/payroll/store', 'PayrollController@store');
	Route::get('/hrm/payroll/salary-list', 'PayrollController@list');
	Route::get('/hrm/payroll/details/{id}', 'PayrollController@show')->name('payroll.details.view');;
	Route::post('/hrm/payroll/update/{id}', 'PayrollController@update');

	Route::get('/hrm/payroll/mine', 'PayrollController@mySalaryPayments')->name('payroll.mine');
	Route::get('/hrm/payroll/mine/{id}/view', 'PayrollController@mySalaryPayment')->name('payroll.mine.view');

	// Bonus Section //
	Route::get('/hrm/bonuses', 'BonusController@index');
	Route::get('/hrm/bonuses/create', 'BonusController@create');
	Route::post('/hrm/bonuses/store', 'BonusController@store');
	Route::get('/hrm/bonuses/details/{id}', 'BonusController@show');
	Route::get('/hrm/bonuses/edit/{id}', 'BonusController@edit');
	Route::post('/hrm/bonuses/update/{id}', 'BonusController@update');
	Route::get('/hrm/bonuses/delete/{id}', 'BonusController@destroy');

	// Deduction Section //
	Route::get('/hrm/deductions', 'DeductionController@index');
	Route::get('/hrm/deductions/create', 'DeductionController@create');
	Route::post('/hrm/deductions/store', 'DeductionController@store');
	Route::get('/hrm/deductions/details/{id}', 'DeductionController@show');
	Route::get('/hrm/deductions/edit/{id}', 'DeductionController@edit');
	Route::post('/hrm/deductions/update/{id}', 'DeductionController@update');
	Route::get('/hrm/deductions/delete/{id}', 'DeductionController@destroy');

	// Loan Section //
	Route::get('/hrm/loans', 'LoanController@index');
	Route::get('/hrm/loans/create', 'LoanController@create');
	Route::post('/hrm/loans/store', 'LoanController@store');
	Route::get('/hrm/loans/details/{id}', 'LoanController@show');
	Route::get('/hrm/loans/edit/{id}', 'LoanController@edit');
	Route::post('/hrm/loans/update/{id}', 'LoanController@update');
	Route::get('/hrm/loans/delete/{id}', 'LoanController@destroy');

	// Payment Section
	Route::get('/hrm/salary-payments', 'SalaryPaymentController@index');
	Route::post('/hrm/salary-payments/go', 'SalaryPaymentController@go');
	Route::get('/hrm/salary-payments/manage-salary/{id}/{salary_month}', 'SalaryPaymentController@create');
	Route::get('/hrm/salary-payments/pdf/{id}/{salary_month}', 'SalaryPaymentController@pdf');
	Route::post('/hrm/salary-payments/store', 'SalaryPaymentController@store');
	// Generate Payslip
	Route::get('/hrm/generate-payslips/', 'SalaryPaymentController@show');
	Route::post('/hrm/generate-payslips/', 'SalaryPaymentController@generate');
	Route::get('/hrm/generate-payslips/salary-list/{salary_month}', 'SalaryPaymentController@list');
	//
	Route::get('/hrm/provident-funds/', 'SalaryPaymentController@provident_fund');

	// Noyon

	//working daya
	Route::get('/setting/working-days', 'WorkingDayController@index');
	Route::post('/setting/working-days/update/', 'WorkingDayController@update');

	//Holidays list
	Route::get('/setting/holidays', 'HolidayController@index');
	Route::get('/setting/holidays/create', 'HolidayController@create');
	Route::post('/setting/holidays/store', 'HolidayController@store');
	Route::get('/setting/holidays/published/{id}', 'HolidayController@published');
	Route::get('/setting/holidays/unpublished/{id}', 'HolidayController@unpublished');
	Route::get('/setting/holidays/details/{id}', 'HolidayController@show');
	Route::get('/setting/holidays/edit/{id}', 'HolidayController@edit');
	Route::post('/setting/holidays/update/{id}', 'HolidayController@update');
	Route::get('/setting/holidays/delete/{id}', 'HolidayController@destroy');

	// Personal Event Section //
	Route::get('/setting/personal-events', 'PersonalEventController@index');
	Route::get('/setting/personal-events/create', 'PersonalEventController@create');
	Route::post('/setting/personal-events/store', 'PersonalEventController@store');
	Route::get('/setting/personal-events/published/{id}', 'PersonalEventController@published');
	Route::get('/setting/personal-events/unpublished/{id}', 'PersonalEventController@unpublished');
	Route::get('/setting/personal-events/details/{id}', 'PersonalEventController@show');
	Route::get('/setting/personal-events/edit/{id}', 'PersonalEventController@edit');
	Route::post('/setting/personal-events/update/{id}', 'PersonalEventController@update');
	Route::get('/setting/personal-events/delete/{id}', 'PersonalEventController@destroy');

	//notice//
	Route::get('/hrm/notice', 'NoticeController@index');
	Route::get('/hrm/notice/create', 'NoticeController@create');
	Route::post('/hrm/notice/store', 'NoticeController@store');
	Route::get('/hrm/notice/published/{id}', 'NoticeController@published');
	Route::get('/hrm/notice/unpublished/{id}', 'NoticeController@unpublished');
	Route::get('/hrm/notice/delete/{id}', 'NoticeController@destroy');

	Route::get('/hrm/notice/show', 'NoticeController@show');

	//Application Listes//
	Route::get('/hrm/application_lists', 'LeaveApplicationController@apllicationLists');
	Route::get('/hrm/leave_application/approved/{id}', 'LeaveApplicationController@approved');
	Route::get('/hrm/leave_application/not_approved/{id}', 'LeaveApplicationController@not_approved');
	Route::get('/hrm/application_lists/{id}', 'LeaveApplicationController@show');

	//Leave Application//
	Route::get('/hrm/leave_application', 'LeaveApplicationController@index')->name('leave-application.index');
	Route::get('/hrm/leave_application/create', 'LeaveApplicationController@create');
	Route::post('/hrm/leave_application/store', 'LeaveApplicationController@store');
	Route::get('/hrm/leave_application/{id}', 'LeaveApplicationController@show');
	Route::get('/hrm/leave-reports', 'LeaveApplicationController@reports');
	Route::get('/hrm/leave-reports/pdf-reports', 'LeaveApplicationController@pdf_reports');

	//expence managements//
	Route::get('/hrm/expence/manage-expence', 'ExpenceManagementController@index');
	Route::get('/hrm/expence/add-expence', 'ExpenceManagementController@create');
	Route::post('/hrm/expence/store', 'ExpenceManagementController@store');

	//employee award Category//
	Route::get('/setting/award_categories', 'AwardCategoryController@index');
	Route::get('/setting/award_categories/create', 'AwardCategoryController@create');
	Route::post('/setting/award_categories/store', 'AwardCategoryController@store');
	Route::get('/setting/award_categories/published/{id}', 'AwardCategoryController@published');
	Route::get('/setting/award_categories/unpublished/{id}', 'AwardCategoryController@unpublished');
	Route::get('/setting/award_categories/edit/{id}', 'AwardCategoryController@edit');
	Route::post('/setting/award_categories/update/{id}', 'AwardCategoryController@update');
	Route::get('/setting/award_categories/delete/{id}', 'AwardCategoryController@destroy');

	//employee awards//
	Route::get('/hrm/employee-awards', 'EmployeeAwardController@index');
	Route::get('/hrm/employee-awards/create', 'EmployeeAwardController@create');
	Route::post('/hrm/employee-awards/store', 'EmployeeAwardController@store');
	Route::get('/hrm/employee-awards/published/{id}', 'EmployeeAwardController@published');
	Route::get('/hrm/employee-awards/unpublished/{id}', 'EmployeeAwardController@unpublished');
	Route::get('/hrm/employee-awards/edit/{id}', 'EmployeeAwardController@edit');
	Route::post('/hrm/employee-awards/update/{id}', 'EmployeeAwardController@update');
	Route::get('/hrm/employee-awards/details/{id}', 'EmployeeAwardController@show');
	Route::get('/hrm/employee-awards/delete/{id}', 'EmployeeAwardController@destroy');

});