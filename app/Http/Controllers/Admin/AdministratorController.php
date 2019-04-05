<?php

namespace App\Http\Controllers\Admin;

use Session;
use App\Sesion;
use App\UsuarioSesion;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use Jenssegers\Agent\Agent; 

class AdministratorController extends Controller
{
    use AuthenticatesUsers;

    protected $guard = 'admin'; 

    /**
     * Where to redirect users after login.
     *
     * @var string
    */
    protected $redirectTo = '/admin';

    public function showLoginForm()
    {
        return view('admin.login');
    }
    
    protected function guard()
    {
        return Auth::guard($this->guard);
    }
    
    public function username(){
        return 'emailpf';
    }

    protected function validateLogin(Request $request)
    {
        $request->validate([
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
       
       //Se almacenan los datos correspondientes a la tabla pf_usuario_sesion
        $table_cltsesion = new UsuarioSesion();
        $table_cltsesion -> session_id = $id;
        $table_cltsesion -> usuario_id = auth()->guard('admin')->id();
        $table_cltsesion -> fecha = now();
        $table_cltsesion -> save();     
    }   

    public function logout(Request $request)
    {
        $this->guard()->logout();

        $request->session()->invalidate();

        return $this->loggedOut($request) ?: redirect('/admin/login');
    }
}
