<?php

namespace App\Models\Ques;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CurrentQuesModel extends Model
{
    use HasFactory;

    protected $table = 'current_queue';

    protected $fillable = [
        'current_number',
        'room_name'
    ];

    protected $cast = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];
}
