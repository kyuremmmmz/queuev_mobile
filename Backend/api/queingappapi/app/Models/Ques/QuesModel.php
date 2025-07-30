<?php

namespace App\Models\Ques;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QuesModel extends Model
{
    use HasFactory;

    protected $table = 'person_who_que';

    protected $fillable = [
        'user_id',
        'full_name',
        'queing_type',
        'room_name',
        'queue_number',
        'status',
    ];

    protected $hidden = [
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'queing_type' => 'string',
        'status' => 'string',
    ];

    /**
     * Relationship to the User model
     */
    public function user()
    {
        return $this->belongsTo(\App\Models\User::class, 'user_id');
    }
}
