@extends('layouts.app')

@section('title','PF | Inicio')
    
@section('content')

<div class="flex-center position-ref full-height">
    @if (Route::has('login'))
        <div class="top-right links">
            @auth
                <a href="{{ url('/home') }}">Home</a>
            @else
                <a href="{{ route('login') }}">Login</a>

                @if (Route::has('register'))
                    <a href="{{ route('register') }}">Register</a>
                @endif
            @endauth
        </div>
    @endif

    <div class="container mt-5 pt-5">
        <h1 class="titulo font-weight-bold">Inicio</h1> 
        <p class="mt-4">Pagina principal</p>
    </div>
</div>

@endsection