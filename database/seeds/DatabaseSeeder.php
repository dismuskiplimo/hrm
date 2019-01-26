<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder {

	/**
	 * Run the database seeds.
	 *
	 * @return void
	 */
	public function run() {
		factory(App\User::class, 10)->create();
		factory(App\ClientType::class, 10)->create();
		factory(App\Designation::class, 10)->create();
		factory(App\Department::class, 5)->create();
		$this->call(WorkingDaysTableSeeder::class);
		$this->call(PermissionsTableSeeder::class);
	}

}
