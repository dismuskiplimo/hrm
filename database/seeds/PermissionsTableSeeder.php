<?php

use App\Permission;
use Illuminate\Database\Seeder;

class PermissionsTableSeeder extends Seeder {
	/**
	 * Run the database seeds.
	 *
	 * @return void
	 */
	public function run() {
		$permissions = [
			[
				'name' => 'hrm-setting',
				'display_name' => 'HRM Setting',
				'description' => 'HRM Setting',
			],
			[
				'name' => 'role',
				'display_name' => 'Role Setting',
				'description' => 'Role Setting Details',
			],
			[
				'name' => 'people',
				'display_name' => 'People',
				'description' => 'People',
			],
			[
				'name' => 'manage-employee',
				'display_name' => 'Manage employee',
				'description' => 'Manage employee',
			],
			[
				'name' => 'manage-clients',
				'display_name' => 'Manage clients',
				'description' => 'Manage clients',
			],
			[
				'name' => 'manage-references',
				'display_name' => 'Manage references',
				'description' => 'Manage references',
			],
			[
				'name' => 'file-upload',
				'display_name' => 'File Upload',
				'description' => 'File Upload',
			],
			[
				'name' => 'sms',
				'display_name' => 'SMS',
				'description' => 'SMS',
			],
			[
				'name' => 'payroll-management',
				'display_name' => 'Payroll Management',
				'description' => 'Payroll Management',
			],
			[
				'name' => 'manage-salary',
				'display_name' => 'Manage Salary',
				'description' => 'Manage Salary',
			],
			[
				'name' => 'salary-list',
				'display_name' => 'Salary List',
				'description' => 'Salary List',
			],
			[
				'name' => 'make-payment',
				'display_name' => 'Make Payment',
				'description' => 'Make Payment',
			],
			[
				'name' => 'generate-payslip',
				'display_name' => 'Generate Payslip',
				'description' => 'Generate Payslip',
			],
			[
				'name' => 'manage-bonus',
				'display_name' => 'Manage Bonus',
				'description' => 'Manage Bonus',
			],
			[
				'name' => 'manage-deduction',
				'display_name' => 'Manage Deduction',
				'description' => 'Manage Deduction',
			],
			[
				'name' => 'loan-management',
				'display_name' => 'Loan Management',
				'description' => 'Loan Management',
			],
			[
				'name' => 'provident-fund',
				'display_name' => 'Provident Fund',
				'description' => 'Provident Fund',
			],
			[
				'name' => 'attendance-management',
				'display_name' => 'Attendance Management',
				'description' => 'Attendance Management',
			],
			[
				'name' => 'manage-attendance',
				'display_name' => 'Manage Attendance ',
				'description' => 'Manage Attendance',
			],
			[
				'name' => 'attendance-report',
				'display_name' => 'Attendance Report',
				'description' => 'Attendance Report',
			],
			[
				'name' => 'manage-expense',
				'display_name' => 'Manage Expense',
				'description' => 'Manage Expense',
			],
			[
				'name' => 'manage-award',
				'display_name' => 'Manage Award',
				'description' => 'Manage Award',
			],
			[
				'name' => 'leave-application',
				'display_name' => 'Leave Application',
				'description' => 'Leave Application',
			],
			[
				'name' => 'manage-leave-application',
				'display_name' => 'Manage Leave Application List',
				'description' => 'Application List',
			],
			[
				'name' => 'my-leave-application',
				'display_name' => 'My Leave Application List',
				'description' => 'Application List',
			],
			[
				'name' => 'leave-reports',
				'display_name' => 'Leave Report',
				'description' => 'Leave Report',
			],
			[
				'name' => 'notice',
				'display_name' => 'Notice',
				'description' => 'Notice',
			],
			[
				'name' => 'manage-notice',
				'display_name' => 'Manage Notice',
				'description' => 'Manage Notice',
			],
			[
				'name' => 'notice-board',
				'display_name' => 'Notice Board',
				'description' => 'Notice Board',
			],
		];

		foreach ($permissions as $key => $value) {
			Permission::create($value);
		}
	}
}
