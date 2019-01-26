<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PersonalEvent extends Model
{
  protected $fillable = [
      'created_by', 'personal_event', 'start_date', 'end_date', 'publication_status', 'personal_event_description', 'deletion_status'
  ];
}
