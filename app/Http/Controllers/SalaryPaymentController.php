<?php

namespace App\Http\Controllers;

use App\Bonus;
use App\Deduction;
use App\Loan;
use App\Payroll;
use App\SalaryPayment;
use App\User;
use App\SalaryPaymentDetails;
use DB;
use Illuminate\Http\Request;
use PDF;

class SalaryPaymentController extends Controller {
	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index() {
		$employees = Payroll::query()
		->leftjoin('users', 'payrolls.user_id', '=', 'users.id')
		->leftjoin('designations as designations', 'users.designation_id', '=', 'designations.id')
		->orderBy('users.name', 'ASC')
		->where('users.access_label', '>=', 2)
		->where('users.access_label', '<=', 3)
		->get(['designations.designation', 'users.name', 'users.id'])
		->toArray();

		return view('administrator.hrm.salary_payment.manage_payment', compact('employees'));
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function go(Request $request) {
		request()->validate([
			'user_id' => 'required',
			'salary_month' => 'required',
		], [
			'user_id.required' => 'The employee name field is required',
		]);
		return redirect('/hrm/salary-payments/manage-salary/' . $request->user_id . '/' . $request->salary_month);
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create($user_id, $salary_month) {
		$date = $salary_month;
		$month = date("m", strtotime($date));
		$year = date("Y", strtotime($date));

		$salary_payment = SalaryPayment::whereYear('payment_month', '=', $year)
		->whereMonth('payment_month', '=', $month)
		->where('user_id', $user_id)
		->first();

		$salary = Payroll::where('user_id', $user_id)
		->first()
		->toArray();

		$bonuses = Bonus::whereYear('bonus_month', '=', $year)
		->whereMonth('bonus_month', '=', $month)
		->where('user_id', '=', $user_id)
		->where('deletion_status', '=', 0)
		->get(['bonus_name', 'bonus_amount'])
		->toArray();

		$deductions = Deduction::whereYear('deduction_month', '=', $year)
		->whereMonth('deduction_month', '=', $month)
		->where('user_id', '=', $user_id)
		->where('deletion_status', '=', 0)
		->get(['deduction_name', 'deduction_amount'])
		->toArray();

		$loans = Loan::where('user_id', $user_id)
		->where('remaining_installments', '>', 0)
		->get(['id', 'loan_name', 'loan_amount', 'remaining_installments', 'number_of_installments'])
		->toArray();

		$user = User::query()
		->leftjoin('designations', 'users.designation_id', '=', 'designations.id')
		->leftjoin('departments', 'designations.department_id', '=', 'departments.id')
		->where('users.id', $user_id)
		->where('users.deletion_status', 0)
		->first([
			'users.id',
			'users.employee_id',
			'users.name',
			'users.avatar',
			'users.created_at',
			'designations.designation',
			'departments.department',
		])
		->toArray();

		$employee_salaries = SalaryPayment::where('user_id', $user_id)
		->orderBy('payment_month', 'desc')
		->get()
		->toArray();

		if (!empty($salary_payment)) {
			$salary_payment_details = SalaryPaymentDetails::where('salary_payment_id', $salary_payment->id)->get();
			return view('administrator.hrm.salary_payment.salary_payment_details', compact('user_id', 'salary_month', 'user', 'employee_salaries', 'salary_payment_details', 'salary_payment'));
		}

		return view('administrator.hrm.salary_payment.make_salary', compact('salary', 'bonuses', 'deductions', 'loans', 'user_id', 'salary_month', 'user'));
	}

	public function pdf($user_id, $salary_month) {
		$date = $salary_month;
		$month = date("m", strtotime($date));
		$year = date("Y", strtotime($date));

		$salary_payment = SalaryPayment::whereYear('payment_month', '=', $year)
		->whereMonth('payment_month', '=', $month)
		->where('user_id', $user_id)
		->first();

		$salary = Payroll::where('user_id', $user_id)
		->first()
		->toArray();

		$bonuses = Bonus::whereYear('bonus_month', '=', $year)
		->whereMonth('bonus_month', '=', $month)
		->where('user_id', '=', $user_id)
		->where('deletion_status', '=', 0)
		->get(['bonus_name', 'bonus_amount'])
		->toArray();

		$deductions = Deduction::whereYear('deduction_month', '=', $year)
		->whereMonth('deduction_month', '=', $month)
		->where('user_id', '=', $user_id)
		->where('deletion_status', '=', 0)
		->get(['deduction_name', 'deduction_amount'])
		->toArray();

		$loans = Loan::where('user_id', $user_id)
		->where('remaining_installments', '>', 0)
		->get(['id', 'loan_name', 'loan_amount', 'remaining_installments', 'number_of_installments'])
		->toArray();

		$user = User::query()
		->leftjoin('designations', 'users.designation_id', '=', 'designations.id')
		->leftjoin('departments', 'designations.department_id', '=', 'departments.id')
		->where('users.id', $user_id)
		->where('users.deletion_status', 0)
		->first([
			'users.id',
			'users.employee_id',
			'users.name',
			'users.avatar',
			'users.created_at',
			'designations.designation',
			'departments.department',
		])
		->toArray();

		$employee_salaries = SalaryPayment::where('user_id', $user_id)
		->orderBy('payment_month', 'desc')
		->get()
		->toArray();

		if (!empty($salary_payment)) {
			$salary_payment_details = SalaryPaymentDetails::where('salary_payment_id', $salary_payment->id)->get();
			$pdf = PDF::loadView('administrator.hrm.salary_payment.pdf', compact('user_id', 'salary_month', 'user', 'employee_salaries', 'salary_payment_details', 'salary_payment'));
			$file_name = 'Salary-' . $user['employee_id'] . '.pdf';
			return $pdf->download($file_name);

		}
		return view('administrator.hrm.salary_payment.make_salary', compact('salary', 'bonuses', 'deductions', 'loans', 'user_id', 'salary_month', 'user'));
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request) {
		$salary = request()->validate([
			'payment_amount' => 'required|numeric',
			'payment_type' => 'required',
			'note' => 'nullable',
		]);

		$result = SalaryPayment::create([
			'created_by' => auth()->user()->id,
			'user_id' => $request->user_id,
			'gross_salary' => $request->gross_salary,
			'total_deduction' => $request->total_deduction,
			'net_salary' => $request->net_salary,
			'provident_fund' => $request->provident_fund,
			'payment_amount' => $request->payment_amount,
			'payment_month' => $request->payment_month . '-01',
			'payment_type' => $request->payment_type,
			'note' => $request->note,
		]);

		$inserted_id = $result->id;

		if (!empty($inserted_id)) {

			for ($i = 0; $i < count($request->item_name); $i++) {
				SalaryPaymentDetails::create([
					'salary_payment_id' => $inserted_id,
					'item_name' => $request->item_name[$i],
					'amount' => $request->amount[$i],
					'status' => $request->status[$i],
				]);
			}

			for ($i = 0; $i < count($request->loan_id); $i++) {
				$loan = Loan::find($request->loan_id[$i]);
				$loan->remaining_installments = $request->remaining_installments[$i] - 1;
				$loan->save();
			}
			return redirect('hrm/salary-payments')->with('message', 'Add successfully.');
		}
		return redirect('hrm/salary-payments')->with('exception', 'Operation failed !');
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  \App\Payroll  $payroll
	 * @return \Illuminate\Http\Response
	 */
	public function show() {
		return view('administrator.hrm.salary_payment.generate_payslip');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function generate(Request $request) {
		request()->validate([
			'salary_month' => 'required',
		], [
			'salary_month.required' => 'The salary month field is required',
		]);
		$salary_month = $request->salary_month;
		return redirect('/hrm/generate-payslips/salary-list/' . $salary_month);
	}

	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function list($salary_month) {
		$date = $salary_month;
		$month = date("m", strtotime($date));
		$year = date("Y", strtotime($date));

		$employees = Payroll::query()
		->leftjoin('users', 'payrolls.user_id', '=', 'users.id')
		->leftjoin('designations as designations', 'users.designation_id', '=', 'designations.id')
		->orderBy('users.name', 'ASC')
		->where('users.access_label', '>=', 2)
		->where('users.access_label', '<=', 3)
		->get(['payrolls.*', 'designations.designation', 'users.name', 'users.id as user_id'])
		->toArray();

		$bonuses = Bonus::whereYear('bonus_month', '=', $year)
		->whereMonth('bonus_month', '=', $month)
		->where('deletion_status', '=', 0)
		->get(['bonus_name', 'bonus_amount', 'user_id'])
		->toArray();

		$deductions = Deduction::whereYear('deduction_month', '=', $year)
		->whereMonth('deduction_month', '=', $month)
		->where('deletion_status', '=', 0)
		->get(['deduction_name', 'deduction_amount', 'user_id'])
		->toArray();

		$loans = Loan::where('remaining_installments', '>', 0)
		->get(['id', 'user_id', 'loan_name', 'loan_amount', 'remaining_installments', 'number_of_installments'])
		->toArray();

		$salary_payments = SalaryPayment::whereYear('payment_month', '=', $year)
		->whereMonth('payment_month', '=', $month)
		->get(['user_id'])
		->toarray();

		/*echo '<pre>';
			print_r($salary_payments);
		*/

			return view('administrator.hrm.salary_payment.employees_salary_list', compact('employees', 'salary_month', 'bonuses', 'deductions', 'loans', 'salary_payments'));
		}

	/**
	 * Display the specified resource.
	 *
	 * @param  \App\Payroll  $payroll
	 * @return \Illuminate\Http\Response
	 */
	public function provident_fund() {
		$employees = Payroll::query()
		->leftjoin('users', 'payrolls.user_id', '=', 'users.id')
		->leftjoin('designations as designations', 'users.designation_id', '=', 'designations.id')
		->orderBy('users.name', 'ASC')
		->where('users.access_label', '>=', 2)
		->where('users.access_label', '<=', 3)
		->get(['designations.designation', 'users.name', 'users.id', 'users.created_at', 'users.employee_id', 'payrolls.provident_fund_contribution', 'payrolls.provident_fund_deduction'])
		->toArray();

		$provident_funds = DB::table('salary_payments')
		->leftjoin('users', 'salary_payments.user_id', 'users.id')
		->select(DB::raw('sum(salary_payments.provident_fund) AS total_provident_fund'), 'salary_payments.user_id')
		->groupBy('salary_payments.user_id')
		->get();

		return view('administrator.hrm.provident_fund.provident_funds', compact('employees', 'provident_funds'));
	}
}
