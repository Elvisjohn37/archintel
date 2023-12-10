<?php

use App\Http\Controllers\UserController;
use App\Http\Controllers\ArticleController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::inertia('/', 'App');

Route::post('/login', [UserController::class, 'login']);
Route::post('/logout', [UserController::class, 'logout']);

Route::post('/register', [UserController::class, 'register']);

Route::get('/checklogin', [UserController::class, 'checkLogin']);

Route::get('/getuserdata', [UserController::class, 'getUserData']);

Route::get('/getarticles', [ArticleController::class, 'getArticles']);

Route::post('/savearticle', [ArticleController::class, 'saveArticle']);

Route::inertia('/{path?}', 'PageNotFound')->where('path', '.*');