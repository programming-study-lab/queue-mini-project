<?php

namespace App\Http\Controllers\api\v1;

use App\Http\Controllers\Controller;
use App\Http\Resources\QueueDatasResource;
use App\Models\QueueDatas;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use PHPUnit\Event\TestSuite\Sorted;

class AuthController extends Controller
{
    public function register(Request $request) {
        // $validator = Validator::make($request->all(),[ //เป็นคลาสของ Laravel
        //     'first_name' => 'string|max:5',
        //     'last_name' => 'string|nullable',
        //     'phone' => 'string|nullable',
        //     'type' => 'string|nullable',
        //     'queue_status' => 'nullable',
        //     'queue_number' => 'nullable',
        // ]);

        $first_name = $request->first_name;
        $last_name = $request->last_name;
        $phone = $request->phone;
        $type = $request->type;
        $queue_status = $request->queue_status;
        $queue_number = $request->queue_number;

        // if ($validator->fails()) {
        //     return response()->json([
        //         $validator->errors()
        //     ]);
        // }

        // if ($last_name == null) {
        //     $last_name = "";
        // }

        // $data = [
        //     'first_name' => $first_name,
        //     'last_name' => $last_name,
        //     'phone' => $phone,
        //     'type' => $type,
        //     'queue_status' => $queue_status,
        //     'queue_number' => $queue_number,
        // ];

        $queue = new QueueDatas;

        $queue->first_name = $first_name;
        $queue->last_name = $last_name;
        $queue->phone = $phone;
        $queue->type = $type;
        $queue->queue_status = $queue_status;
        $queue->queue_number = $queue_number;


        if($queue->save()) {
            return response()->json([
                'status' => 'ok',
                'queue' => $queue
            ], 200);
        } else {
            return response()->json([
                "status" => "error",
                "message" => "Not Found Queue Number ".$queue_number,
            ], 404);
        }
    }

    public function queue(){
        // $queue_datas = QueueDatas::latest()->get(); //get ข้อมูลอย่างเดียว

        $queue_datas = DB::table('queue_datas')
                        ->orderBy('queue_number', 'asc')
                        ->get();

        return response()->json([
            'status' => 'ok',
            'queue' => QueueDatasResource::collection($queue_datas)
        ], 200);
    }

    public function queue_delete($queue_number){
        $queue_delete = DB::table('queue_datas')
                            ->where('queue_number', '=', $queue_number)
                            ->delete();

        if($queue_delete) {
            return response()->json([
                'status' => 'ok',
                'queue' => QueueDatas::latest()->get()
            ], 200);
        } else {
            return response()->json([
                "status" => "error",
                "message" => "Not Found Queue Number ".$queue_number,
            ], 404);
        }
    }



    public function test(){

        $queue_datas = DB::table('queue_datas')
                        ->orderBy('queue_number', 'asc')
                        ->get();

        if ($queue_datas) {
            return response()->json([
                'status' => 'ok',
                'queue' => $queue_datas
            ], 200);
        } else {
            return response()->json()->each();
        }


    }
}
