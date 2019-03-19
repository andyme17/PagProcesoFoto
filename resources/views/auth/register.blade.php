@extends('layouts.app')

@section('title','PF | Registrate')

@section('content')
<div class="container my-5 py-5">
    <div class="row">
        <div class="col-10 col-md-6 border p-4 mx-auto shadow">
             <h2 class="titulo font-weight-bold text-center pt-3 pb-1">Registrate</h2>
        <hr>
        <form method="POST" action="{{ route('register') }}" class="font-secondary my-4 py-4">
            @csrf 
            <div class="form-group pb-3">
                <input type="text" name="nombre" class="form-control" placeholder="Nombre:" value="{{ old('nombre')}}">
                {!! $errors-> first('nombre','<small class="text-danger">:message</small><br>') !!} 
            </div>
            <div class="form-group pb-3">
                <input type="text" name="apellido" class="form-control" placeholder="Apellidos:" value="{{ old('apellido')}}">
                {!! $errors-> first('apellido','<small class="text-danger">:message</small><br>') !!} 
            </div>
            <div class="form-group pb-3">
                <input type="email" name="emailpf" class="form-control" placeholder="Correo Electrónico:" value="{{ old('emailpf')}}">
                <small id="emailHelp" class="form-text text-muted">Ejemplo: ejemplo@dominio.com</small>
                {!! $errors-> first('emailpf','<small class="text-danger">:message</small><br>') !!} 
            </div>
            <div class="form-group pb-3">
                <input type="text" name="telpf" class="form-control" placeholder="Teléfono:" value="{{ old('telpf')}}">
                {!! $errors-> first('telpf','<small class="text-danger">:message</small><br>') !!} 
            </div>
            <div class="form-group pb-3">
                <input type="text" name="celpf" class="form-control" placeholder="Celular:" value="{{ old('celpf')}}">
                {!! $errors-> first('celpf','<small class="text-danger">:message</small><br>') !!} 
            </div>
            <div class="form-group pb-3">
                <input type="password" name="password" class="form-control" placeholder="Contraseña:">
                {!! $errors-> first('password','<small class="text-danger">:message</small><br>') !!}
            </div>
            <div class="form-group pb-3">
                <input type="password" name="password_confirmation" class="form-control" placeholder="Repita la contraseña:">
                {!! $errors-> first('password_confirmation','<small class="text-danger">:message</small><br>') !!}
            </div>
            <!--Cogigo captcha-->
            <a class="pb-2 d-block" href="{{ route('login') }}">Ya tienes una cuenta</a>
            <button type="submit" class="btn btn-primary float-right mt-4">Registrate</button>
        </form>
        </div>
    </div>    
@endsection
