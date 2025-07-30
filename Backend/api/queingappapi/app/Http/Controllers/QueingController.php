<?php

namespace App\Http\Controllers;

use App\Events\QeueProcessed;
use App\Jobs\QeueTasks;
use App\Models\Ques\QuesModel;
use App\Events\QueueProcessed;
use App\Http\Requests\QuesRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class QueingController extends Controller
{
    public function store(QuesRequest $request)
    {
        $data = $request->validated();

        QeueTasks::dispatch($data);

        return response()->json(['message' => 'Queue entry added', 'data'=>$data]);
    }

    public function serveNext(Request $request)
    {
        $roomName = $request->validate(['room_name' => 'required|string'])['room_name'];

        DB::transaction(function () use ($roomName) {
            $nextQueue = QuesModel::where('room_name', $roomName)
                ->where('status', 'pending')
                ->orderBy('id', 'asc')
                ->first();

            if ($nextQueue) {
                $nextQueue->update(['status' => 'serving']);

                DB::table('current_queue')->updateOrInsert(
                    ['room_name' => $roomName],
                    ['current_number' => $nextQueue->queue_number, 'updated_at' => now()]
                );

                event(new QeueProcessed([
                    'user_id'       => $nextQueue->user_id,
                    'full_name'     => $nextQueue->full_name,
                    'queing_type'   => $nextQueue->queing_type,
                    'room_name'     => $nextQueue->room_name,
                    'queue_number'  => $nextQueue->queue_number,
                    'status'        => $nextQueue->status,
                    'current_number' => $nextQueue->queue_number,
                ]));
            }
        });

        return response()->json(['message' => 'Next queue served']);
    }

    public function completeQueue(Request $request)
    {
        $data = $request->validate([
            'queue_number' => 'required|string',
            'room_name'    => 'required|string',
        ]);

        DB::transaction(function () use ($data) {
            $queue = QuesModel::where('queue_number', $data['queue_number'])
                ->where('room_name', $data['room_name'])
                ->first();

            if ($queue) {
                $queue->update(['status' => 'completed']);

                event(new QeueProcessed([
                    'user_id'       => $queue->user_id,
                    'full_name'     => $queue->full_name,
                    'queing_type'   => $queue->queing_type,
                    'room_name'     => $queue->room_name,
                    'queue_number'  => $queue->queue_number,
                    'status'        => $queue->status,
                    'current_number' => DB::table('current_queue')
                        ->where('room_name', $queue->room_name)
                        ->value('current_number'),
                ]));
            }
        });
        return response()->json(['message' => 'Queue completed']);
    }
}
