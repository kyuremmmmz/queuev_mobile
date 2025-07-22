<?php

namespace App\Models\Ques;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QuesModel extends Model
{
    use HasFactory;

    protected $table = 'person_who_que';
    protected $fillable = [
        'full_name',
        'queing_type',
        'room_name',
        'queue_number',
    ];

    protected $hidden = [
        'queue_number',
        'id'
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];
}
