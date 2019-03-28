<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Admin extends Authenticatable
{
    use Notifiable;

    protected $table = 'pf_usuario';
    
    protected $fillable = ['emailpf', 'password'];

    protected $hidden   = ['password', 'remember_token'];
}
