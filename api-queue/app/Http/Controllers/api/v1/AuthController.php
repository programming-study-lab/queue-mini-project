<?php

namespace App\Http\Controllers\api\v1;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function register(Request $request) {
        $queue = User::create([
            "name" => "test"
        ]);


        return response()->json([
            "status" => "ok",
            // "queue" => $queue
        ]);
    }
}
