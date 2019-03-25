<?php

namespace App\Http\Controllers\Auth;

use DB;
use Session;
use App\Sesion;
use App\ClienteSesion;
use Carbon\Carbon;
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
        
        //Se almacenan los datos correspondientes a la tabla pf_sesion
        $table_sesion = new Sesion();
        $table_sesion->session_id = $id;
        $table_sesion->ip_address = $ip;
        $table_sesion->user_agent = $agente;
        // $table_sesion->user_data = $dataS; Al no estar bien definido lo que contiene este campo, se modifica el campo para que acepte valores nulos
        $table_sesion->last_activity = now();
        $table_sesion->save();

        //Se almacenan los datos correspondientes a la tabla pf_cliente_sesion
        $table_cltsesion = new ClienteSesion();
        $table_cltsesion -> session_id = $id;
        $table_cltsesion -> cliente_id = auth()->id();
        $table_cltsesion -> fecha = now();
        $table_cltsesion->save();      
    }
}
