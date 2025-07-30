<?php

namespace App\Jobs;

use App\Events\QeueProcessed;
use App\Events\QueueProcessed;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class QeueTasks implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $data;

    public function __construct($data)
    {
        $this->data = $data;
    }

    public function handle(): void
    {
        try {
            $queueNumber = $this->data['queue_number'] ?? $this->generateQueueNumber();
            DB::transaction(function () use ($queueNumber) {
                DB::table('person_who_que')->insert([
                    'user_id'       => $this->data['user_id'],
                    'full_name'     => $this->data['full_name'],
                    'queing_type'   => $this->data['queing_type'],
                    'room_name'     => $this->data['room_name'],
                    'queue_number'  => $queueNumber,
                    'status'        => 'pending',
                    'created_at'    => now(),
                    'updated_at'    => now(),
                ]);
            });

            $currentNumber = DB::table('current_queue')
                ->where('room_name', $this->data['room_name'])
                ->value('current_number');

            event(new QeueProcessed([
                'user_id'       => $this->data['user_id'],
                'full_name'     => $this->data['full_name'],
                'queing_type'   => $this->data['queing_type'],
                'room_name'     => $this->data['room_name'],
                'queue_number'  => $queueNumber,
                'status'        => 'pending',
                'current_number' => $currentNumber,
            ]));
        } catch (\Exception $e) {
            Log::error('Queue job failed: ' . $e->getMessage());
            $this->fail($e);
        }
    }

    private function generateQueueNumber(): string
    {
        $lastQueue = DB::table('person_who_que')
            ->where('room_name', $this->data['room_name'])
            ->orderBy('id', 'desc')
            ->first();

        $lastNumber = $lastQueue ? (int) substr($lastQueue->queue_number, 1) : 0;
        return 'Q' . str_pad($lastNumber + 1, 3, '0', STR_PAD_LEFT);
    }
}
