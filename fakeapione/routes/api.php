<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\TodolistController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'

], function ($router) {
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/refresh', [AuthController::class, 'refresh']);
    Route::post('/update-splashOne', [AuthController::class, 'updateSplashOne'])->middleware('auth:api');
    Route::post('/update-splashTwo', [AuthController::class, 'updateSplashTwo'])->middleware('auth:api');
    Route::post('/update-splashThree', [AuthController::class, 'updateSplashThree'])->middleware('auth:api');
    Route::post('/update-splashFour', [AuthController::class, 'updateSplashFour'])->middleware('auth:api');
    Route::post('/update-splashFive', [AuthController::class, 'updateSplashFive'])->middleware('auth:api');
    Route::post('/update-splashSix', [AuthController::class, 'updateSplashSix'])->middleware('auth:api');
    Route::post('/update-DatePrep', [AuthController::class, 'updateDatePrep'])->middleware('auth:api');
    Route::get('/user-profile', [AuthController::class, 'userProfile']);
    
    Route::get('/get-todolist/{id}', [TodolistController::class, 'getTodolist']);
    Route::post('/todo-lists', [TodolistController::class, 'showTodolist'])->middleware('auth:api');
    Route::get('/get-todo-lists', [TodolistController::class, 'userTodoList']);
    Route::post('/update-todolist', [TodolistController::class, 'updateTodolist'])->middleware('auth:api');
    


});