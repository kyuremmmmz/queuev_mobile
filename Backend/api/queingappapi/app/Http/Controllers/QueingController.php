<?php

namespace App\Http\Controllers;

use App\Http\Requests\QuesRequest;
use App\Models\Ques\QuesModel;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class QueingController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    private function sendResponse($data, $message): JsonResponse
    {
        return response()->json([
            'success' => true,
            'data'=> $data,
            'message'=> $message
        ], 201);
    }

    protected function sendError($error, $errorMessages = [], $code = 404)
    {
        $response = [
            'success' => false,
            'message' => $error,
        ];
        if(!empty($errorMessages)){
            $response['data'] = $errorMessages;
        }
        return response()->json($response, $code);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(QuesRequest $request): JsonResponse
    {
        $validator = $request->validated();
        try {
            $data = [
                'full_name' => $validator['full_name'],
                'queing_type' => $validator['queing_type'],
                'room_name' => $validator['room_name'],
                'queue_number' => $validator['queue_number']
            ];
            $createdData = QuesModel::create($data);
            return $this->sendResponse($createdData, 'Data Created Successfully');
        } catch (\Throwable $th) {
            return $this->sendError('Server Unresponse', ['error' => $th]);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
