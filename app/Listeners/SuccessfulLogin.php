<?php

namespace App\Listeners;

use Sesion;
use Session;
use User;
use DateTime;
use Illuminate\Auth\Events\Login;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Jenssegers\Agent\Agent;

class SuccessfulLogin
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  Login  $event
     * @return void
     */
    public function handle(Login $event)
    {
        //$event->user = new DateTime;
        $usuario_logueado = $event->user;
       /* $event->sesion->last_activity = new DateTime;
        $event->sesion->save();*/

        

        $user_session = new Sesion();

        $user_session->session_id = $session_id;
        $user_session->ip_address = $ip_address;
        $user_session->user_agent = $agente;
        $user_session->session_id = $session_id;
        $user_session->last_activity = new DateTime;
        $user_session->save();

        /*DB::table('pf_session')->insert([
            "session_id"-> $session_id,
            "ip_address"-> $ip_address,
            "user_agent"-> $agente,
        ]);*/
    }

    protected function afterLogin(Request $request, $user){
        $agent = new Agent();
        //$platform = $agent->platform();//get SO
        $session_id = $request->session()->token();
        $ip_address =  \Request :: getClientIp (true); 
        //$browser = $agent->browser();
        //$browser_version = $agent->version($browser);  
        $agente = $agent->platform()." ".$agent->browser()." ".$agent->version($browser);

        return $session_id,$ip_address;
    }
}
