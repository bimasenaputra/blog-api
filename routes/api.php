<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/posts', 'App\Http\Controllers\PostIndexController@__invoke');
Route::get('/posts/{post:slug}', 'App\Http\Controllers\PostShowController@__invoke');
Route::get('/admin/posts', 'App\Http\Controllers\Admin\PostIndexController@__invoke');
Route::post('/admin/posts', 'App\Http\Controllers\Admin\PostStoreController@__invoke');
Route::get('/admin/posts/{post:uuid}/edit', 'App\Http\Controllers\Admin\PostEditController@__invoke');
Route::patch('/admin/posts/{post:uuid}', 'App\Http\Controllers\Admin\PostPatchController@__invoke');