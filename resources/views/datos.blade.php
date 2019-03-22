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
        <?php
           var_dump($browser);
           var_dump($plataforma);
           var_dump($browser_version);
           var_dump($agente);
           var_dump($ip);
           var_dump($id);
           var_dump($dataS);
          
       ?>
        
        
        
        
</div>

@endsection