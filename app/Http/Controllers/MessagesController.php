<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Mail;
use App\Mail\MessageReceived;

use Illuminate\Http\Request;

class MessagesController extends Controller
{
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('contacto');
    }

    public function store(){

        $message = request()->validate([
            'name' => 'required',
            'email' => 'required|email',
            'department' => 'required',
            'subject' => 'required',
            'message' => 'required|min:20|max:500'
        ],[
            'name.required' => 'Ingresa tu nombre',
            'email.required'     => 'Ingresa tu correo electrónico',
            'email.email' => 'Ingresa un correo electrónico válido',
            'department.required'=> 'Indica el departamento al cual va dirigido el mensaje',
            'subject.required' => 'Es necesario indicar el asunto del mensaje',
            'message.required' => 'Ingresa tu mensaje'
        ]);

        Mail::to('ame171337@gmail.com')->send(new MessageReceived($message));

        return 'Mensaje enviado';
    }
}

