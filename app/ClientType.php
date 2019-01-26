<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ClientType extends Model
{
    protected $fillable = [
        'created_by', 'client_type', 'publication_status', 'client_type_description'
    ];
}
