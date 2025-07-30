<?php

namespace App\Jobs;

use App\Events\QeueProcessed;
use App\Models\Ques\QuesModel;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;

class QeueTasks implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;
    public $data;

    /**
     * Create a new job instance.
     */
    public function __construct($data)
    {
        $this->data = $data;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {

        QuesModel::create([
            'full_name'     => $this->data['full_name'],
            'queing_type'   => $this->data['queing_type'],
            'room_name'     => $this->data['room_name'],
            'queue_number'  => $this->data['queue_number'],
            'created_at'    => now(),
            'updated_at'    => now(),
        ]);
        event(new QeueProcessed($this->data));
    }
}
