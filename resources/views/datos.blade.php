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
            print_r($session_id);
            print_r($platform);
            print_r($version);
            print_r($ip_address);
            print_r($browser);
            print_r($browser_version);
        ?>
        
        
        
</div>

@endsection