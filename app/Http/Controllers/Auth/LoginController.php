<?php

namespace App\Http\Controllers\Auth;

use Session;
use Sesion;
use
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Jenssegers\Agent\Agent;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function username(){
        return 'emailpf';
    }

    protected function validateLogin(Request $request)
    {
        $datos = $request->validate([
            'emailpf' => 'required|string|email',
            'password' => 'required|string',
        ],[
            'emailpf.required' => 'Ingresa tu correo electrónico',
            'emailpf.email' => 'Ingresa un correo electrónico válido',
            'password.required' => 'Ingresa tu contraseña'
        ]);      
    }

    /**
     * The user has been authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  mixed  $user
     * @return mixed
     */
    protected function authenticated(Request $request, $user)
    {/*
        $agent  =  new  Agent();
        //$platform = $agent->platform();//get SO
        $session_id = $request->session()->token();
        $ip_address =  \Request :: getClientIp (true); 
        //$browser = $agent->browser();
        //$browser_version = $agent->version($browser);  
        $agente = $agent->platform()." ".$agent->browser()." ".$agent->version($browser);

        DB::table('pf_session')->insert([
            "session_id"-> $session_id,
            "ip_address"-> $ip_address,
            "user_agent"-> $agente,
        ]);      */    
    }  
}
