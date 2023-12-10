<?php

namespace App\Http\Controllers;

use Illuminate\Routing\Controller as BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Repositories\UserRepository;
use App\Http\Requests\LoginReq;
use App\Models\User;

class UserController extends BaseController
{
    public function login(LoginReq $request)
    {
        
        $credentials = [
            'username' => $request->input('username'),
            'password' => $request->input('password')
        ];

        if (Auth::attempt($credentials)) {
            $request->session()->regenerate();
        }
        
        if(Auth::check()) {
            return $this->getUserData();
        }
        return ['isLogin' => false];
    }
    
    
    public function checkLogin()
    {
        if(Auth::check()) {
            return 'ok';
        } else {
            return 'not';
        }
    }

    public function logout(Request $request)
    {
        auth()->logout();
        // $request->session()->invalidate();
        return response(Auth::check());
    }

    public function getUserData()
    {
        if(Auth::check()) {
            $userRepository = new UserRepository;
            return array_merge($userRepository->getUserData(), ['isLogin' => true]);
        } else {
            return response(['isLogin' => false]);
        }
    }

    public function register(Request $request)
    {
        $user = new User;

        $validated = $request->validate([
            'username' => 'required',
            'password' => 'required',
        ]);

        if($validated) {
            $user->username = $request->username;
            $user->password = bcrypt($request->input('password'));
            $user->firstname = "James";
            $user->lastname = "Garcia";
            $user->type = "Editor";
            $user->status = 0;
            $user->save();
            
            if (Auth::attempt(array_merge($user->toArray(), ['password' => $request->password]))) {
                $request->session()->regenerate();
            }
        }
        if(Auth::check()) {
            return response([
                "isLogin" => true
            ]);
        }
    }
}
