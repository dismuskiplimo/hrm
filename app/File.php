<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class File extends Model
{
     protected $fillable = [
        'created_by', 'folder_id' , 'file_name', 'caption','publication_status', 'deletion_status'
    ];
}
