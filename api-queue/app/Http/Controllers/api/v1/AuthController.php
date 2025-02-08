<?php

namespace App\Http\Controllers\api\v1;

use App\Http\Controllers\Controller;
use App\Http\Resources\QueueDatasResource;
use App\Models\QueueDatas;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function register(Request $request) {
        $validator = Validator::make($request->all(),[ //เป็นคลาสของ Laravel
            'first_name' => 'string|max:5',
            'last_name' => 'string|nullable',
            'phone' => 'string|nullable',
            'type' => 'string|nullable',
            'queue_status' => 'nullable',
            'queue_number' => 'nullable',
        ]);

        $first_name = $request->first_name;
        $last_name = $request->last_name;
        $phone = $request->phone;
        $type = $request->type;
        $queue_status = $request->queue_status;
        $queue_number = $request->queue_number;

        if ($validator->fails()) {
            return response()->json([
                $validator->errors()
            ]);
        }

        if ($last_name == null) {
            $last_name = "";
        }

        $queue = QueueDatas::create([
            'first_name' => $first_name,
            'last_name' => $last_name,
            'phone' => $phone,
            'type' => $type,
            'queue_status' => $queue_status,
            'queue_number' => $queue_number,
        ]);

        return response()->json([
            "status" => "ok",
            "queue" => $queue
        ]);
    }

    public function queue(){
        $queue_datas = QueueDatas::latest()->get();

        return response()->json([
            'status' => 'ok',
            'queue' => QueueDatasResource::collection($queue_datas)
        ], 200);
    }
}
