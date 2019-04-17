@extends('layouts.app')

@section('title','PF | Iniciar sesión')

@section('content')
<div class="container my-4 pt-5">
    <div class="row">
        <div class="col-10 col-md-6 border mx-auto shadow">
            <h2 class="titulo font-weight-bold text-center pt-4">Inicia Sesión</h2>
            <hr>
            <form method="POST" action="{{ route('login') }}" class="font-secondary my-4 py-2">
                @csrf 
                <div class="form-group pb-1">
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="emailpf" placeholder="Correo Electrónico:" value="{{ old('emailpf')}}">
                    <small id="emailHelp" class="form-text text-muted">Ejemplo: ejemplo@dominio.com</small>
                    {!! $errors-> first('emailpf','<small class="text-danger">:message</small><br>') !!} 
                </div>
                <div class="form-group pb-1">
                    <input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="Contraseña:">
                    {!! $errors-> first('password','<small class="text-danger">:message</small><br>') !!}
                </div>
                <div class="form-group">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
                        <label class="form-check-label" for="remember"> 
                            Recordar cuenta
                        </label>
                    </div>
                </div>
                <div class="form-group">            
                    <button type="submit" class="btn btn-primary float-right">Ingresar</button>
                    @if (Route::has('password.request'))
                        <a class="btn btn-link pt-3" href="{{ route('password.request') }}">
                            ¿Has olvidado la contraseña?
                        </a>
                    @endif
                </div>
                <a class="pl-3 d-block" href="{{ route('register') }}">Crear una nueva cuenta</a>
            </form>
        </div>        
    </div>   
</div>
@endsection
