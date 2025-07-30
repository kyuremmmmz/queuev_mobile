<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class QuesRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'user_id'     => 'required|integer|exists:users,id',
            'full_name'   => 'required|string',
            'queing_type' => 'required|in:Enrollment,Appointment,Walk-in',
            'room_name'   => 'required|string',
        ];
    }
}
