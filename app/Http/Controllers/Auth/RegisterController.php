<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
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
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'nombre' => ['required', 'string', 'max:255'],
            'apellido' => ['required', 'string', 'max:255'],
            'emailpf' => ['required', 'string', 'email', 'max:255', 'unique:pf_cliente'],
            'telpf' => ['required'],
            'celpf' => ['required'],
            'password' => ['required', 'string', 'min:6', 'confirmed'],
        ],[
            'nombre.required' => 'Ingresa tu nombre',
            'apellido.required' => 'Ingresa tus apellidos',
            'emailpf.required' => 'Ingresa tu correo electrónico',
            'emailpf.email' => 'Ingresa un correo electrónico válido',
            'emailpf.email' => 'Ingresa un correo electrónico válido',
            'telpf.required' => 'Ingresa un número telefonico',
            'celpf.required' => 'Ingresa un núero de celular',
        ]);

    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Usuario
     */
    protected function create(array $data)
    {
        return User::create([
            'nombre' => $data['nombre'],
            'apellido' => $data['apellido'],
            'emailpf' => $data['emailpf'],
            'telpf' => $data['telpf'],
            'celpf' => $data['celpf'],
            'password' => Hash::make($data['password']),
        ]);
    }

    

}
