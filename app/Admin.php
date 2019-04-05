<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Admin extends Authenticatable
{
    use Notifiable;

    protected $table = 'pf_usuario';
    
    protected $fillable = ['nombre','apellido','emailpf', 'password','perfil_id'];

    protected $hidden   = ['password', 'remember_token'];
}
