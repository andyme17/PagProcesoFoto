<?php

namespace App\Http\Controllers\Auth;

use Session;
use App\Sesion;
use Carbon\Carbon;
use DB;
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

    protected function authenticated(Request $request,$user){
        $agent = new Agent();
        $plataforma = $agent->platform();//get SO
        $browser = $agent->browser();
        $browser_version = $agent->version($browser);  
        $agente = $plataforma." , ".$browser." ".$browser_version;
    
        $id = $request->session()->token();
        $ip =  \Request :: getClientIp (true); 
        //$dataS = $request->session()->all();      
        
        $table_sesion = new Sesion();
        $table_sesion->session_id = $id;
        $table_sesion->ip_address = $ip;
        $table_sesion->user_agent = $agente;
       // $table_sesion->user_data = $dataS;
        $table_sesion->last_activity = now();

        $table_sesion->save();
    }
}
