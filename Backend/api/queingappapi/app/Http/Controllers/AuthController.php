<?php

namespace App\Http\Controllers;

use App\Http\Requests\AuthRequest;
use App\Http\Requests\LoginRequest;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    protected function sendResponse($data, $message): JsonResponse
    {
        return response()->json([
            'success' => true,
            'data' => $data,
            'message' => $message,
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

    public function createUser(AuthRequest $authRequest): JsonResponse
    {
        $validation = $authRequest->validated();

            $userCreated = User::create([
                'surname' => $validation['surname'],
                'username' => $validation['username'],
                'name' => $validation['name'],
                'password' => Hash::make($validation['password']),
            ]);
            $sucess['token'] = $userCreated->createToken('jwtToken')->plainTextToken;
            $sucess['name'] = $userCreated->name;
            return $this->sendResponse($sucess, 'User Registered Successfully.');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function login(LoginRequest $request): JsonResponse
    {
        $validator = $request->validated();
        if (Auth::attempt(['username'=> $validator['username'], 'password'=> $validator['password']])) {
            $user = Auth::user();
            $success['token'] =  $user->createToken('jwtToken')->plainTextToken;
            $success['name'] =  $user->name;
            return $this->sendResponse($success, 'User login successfully.');
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
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
