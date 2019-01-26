<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Designation extends Model {

    protected $fillable = [
        'created_by', 'department_id', 'designation', 'publication_status', 'designation_description'
    ];

}
