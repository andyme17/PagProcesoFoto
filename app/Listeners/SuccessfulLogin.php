<?php

namespace App\Listeners;

use Sesion;
use Session;
use User;
use DateTime;
use DB;
use Carbon\Carbon;
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
        $user_sesion = now();

        DB::table('pf_session')->insert([
            "last_activity"-> $user_sesion,
        ]);
    }

    
}
