<?php

namespace App\Http\Controllers\Auth;

use Session;
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

        //$datos = $request->session()->all();

        //return view('home', compact('datos'));
    }

    /**
     * The user has been authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  mixed  $user
     * @return mixed
     */
    protected function authenticated(Request $request, $user)
    {
        $agent  =  new  Agent();
        //$data = $request->session()->all();
        $platform = $agent->platform();
        $version = $agent->version($platform);
        //$data = Session::all();
        $session_id = $request->session()->token();
        //$browser = get_browser( $request->header('User-Agent') , true);
        //$browser = $request->header('User-Agent');
        $ip_address =  \Request :: getClientIp (true); 
        $browser = $agent->browser();
        $browser_version = $agent->version($browser);  
        return view('datos', compact('session_id','ip_address','platform','version','browser','browser_version'));      
    }  

    

}
