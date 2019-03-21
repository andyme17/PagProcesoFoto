<?php

namespace App\Http\Controllers\Auth;

use Session;
use Sesion;
use Datetime;
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

    public function authenticated(Request $request,$user){
        $agent = new Agent();

        $id = $request->session()->token();
        $plataform = $agent->platform();//get SO
        $ip =  \Request :: getClientIp (true); 
        $browser = $agent->browser();
        $browser_version = $agent->version($browser);  
        $agente = $plataforma." ".$browser." ".$browser_version;
        $dataS = $request->session();
        /*table_sesion = array(  'id' => $sesion_id,
                                'ip' => $ip_address, 
                                'agente' => $agente,
                                'datos' => $dataS
                        );
        return $table_sesion;*/

        DB::table('pf_session')->insert([
            "session_id"-> $id,
            "ip_address" -> $ip,
            "user_agent" -> $agente,
            "user_data" -> $dataS
        ]);
    }
}
