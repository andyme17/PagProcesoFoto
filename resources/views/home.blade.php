@extends('layouts.app')

@section('title','PF | Inicio')
    
@section('content')

<div class="container mt-5 pt-5">
        @if (session('status'))
            <div class="alert alert-success" role="alert">
                {{ session('status') }}
            </div>
        @endif

        <h1 class="titulo font-weight-bold">Bienvenido</h1> 
        
        <a href="{{ route('datos-session, user->id') }}" class="btn btn-info">Mostrar datos de sesión</a>
   
        <?php
            echo $_SERVER['HTTP_USER_AGENT'] . "\n\n";

            $navegador = get_browser(null, true);
            
            print_r($navegador);
        ?>
</div>

@endsection