<?php

use App\Http\Controllers\api\v1\AuthController;
use App\Http\Controllers\Test_TestController;
use App\Http\Controllers\TestController;
use App\Http\Controllers\TodoController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/error', function(){
    return response()->json([
        "status" => "error"
    ]);
})->name('error');

Route :: group(['prefix' => 'v1'], function(){
    Route :: post ('/register',[AuthController::class, "register"]);
    Route :: get('/queue', [AuthController::class, "queue"]);
    Route :: delete('/queue_delete/{queue_number}', [AuthController::class, "queue_delete"]);
    Route :: get('/test', [AuthController::class, "test"]);
});
