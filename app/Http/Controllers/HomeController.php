<?php

namespace App\Http\Controllers;

use Illuminate\Routing\Controller as BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Repositories\UserRepository;
use App\Http\Requests\LoginReq;
use App\Models\User;

class HomeController extends BaseController
{
    public function home()
    {
        return view('Home');
    }
}
