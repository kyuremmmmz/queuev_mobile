<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class QuesResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'queing_type' => $this->queing_type,
            'room_name' => $this->room_name,
            'queue_number' => $this->queue_number,
            'full_name' => $this->full_name,
            'created_at' => $this->created_at,
            'updated_at' => $this->updsadated_at,
        ];
    }
}
