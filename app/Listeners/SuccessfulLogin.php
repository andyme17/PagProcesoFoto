<?php

namespace App\Listeners;

use Sesion;
use Session;
use User;
use DateTime;
use DB;
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
        $user_sesion = $event->user;

       // return view('datos', compact('user_sesion'));

       
              
        //$event->user->last_activity = new DateTime;
        //$event->sesion->save();
/*
        if($event->user){
            $user_sesion = new DateTime;
        }

        DB::table('pf_session')->insert([
            "last_activity"-> $user_sesion,
        ]);

        DB::table('pf_session')->insert([
            "session_id"-> $session_id,
            "ip_address"-> $ip_address,
            "user_agent"-> $agente,
        ]);*/
    }

    /*protected function afterLogin(Request $request, $user){
        $agent = new Agent();

        $session_id = $request->session()->token();
        $platform = $agent->platform();//get SO
        $ip_address =  \Request :: getClientIp (true); 
        $browser = $agent->browser();
        $browser_version = $agent->version($browser);  
        $agente = $agent->platform()." ".$agent->browser()." ".$agent->version($browser);
        $table_sesion = array(  'session_id' => $sesion_id,
                                'ip_cliente' => $ip_address, 
                                'agente' => $agente,
        );
        return $table_sesion;
    }*/
}
