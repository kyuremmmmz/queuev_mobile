<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class QeueProcessed
{
    use Dispatchable, InteractsWithSockets, SerializesModels;
    public $qeueProcess;

    /**
     * Create a new event instance.
     */
    public function __construct($data)
    {
        $this->qeueProcess = $data;
    }

    public function broadcastOn()
    {
        return new Channel('queue.' . $this->qeueProcess['room_name']);
    }

    public function broadcastWith()
    {
        return [
            'user_id'       => $this->qeueProcess['user_id'],
            'full_name'     => $this->qeueProcess['full_name'],
            'queing_type'   => $this->qeueProcess['queing_type'],
            'room_name'     => $this->qeueProcess['room_name'],
            'queue_number'  => $this->qeueProcess['queue_number'],
            'status'        => $this->qeueProcess['status'],
            'current_number' => $this->qeueProcess['current_number'],
        ];
    }
}
