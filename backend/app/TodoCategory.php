<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class TodoCategory extends Model
{
    use SoftDeletes;
    
    protected $table = "todo_categorys";
}
