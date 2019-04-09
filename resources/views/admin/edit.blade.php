@extends('admin.layouts.template')

@section('title','PF | Editar Usuario')

@section('content')

<div class="container mt-5 pt-4">
    <div class="col-10 col-md-6 p-4 mx-auto border shadow ">
        <h2 class="titulo pt-3 pb-1">Editar</h2>
        <hr>
        <form method="POST" action="{{ route('admin.update', $user->id) }}" class="font-secondary my-4 p-2">
            @csrf 
            @method('PUT')
            <div class="form-group pb-3">
                <input type="text" name="nombre" class="form-control" placeholder="Nombre:" value="{{ $user->nombre }}">
                {!! $errors-> first('nombre','<small class="text-danger">:message</small><br>') !!} 
            </div>
            <div class="form-group pb-3">
                <input type="text" name="apellido" class="form-control" placeholder="Apellidos:" value="{{ $user->apellido }}">
                {!! $errors-> first('apellido','<small class="text-danger">:message</small><br>') !!} 
            </div>
            <div class="form-group pb-3">
                <input type="email" name="emailpf" class="form-control" placeholder="Correo Electrónico:" value="{{ $user->emailpf }}">
                <small id="emailHelp" class="form-text text-muted">Ejemplo: ejemplo@dominio.com</small>
                {!! $errors-> first('emailpf','<small class="text-danger">:message</small><br>') !!} 
            </div>
            <label for="">Desea cambiar la contraseña: </label>
                <div class="form-group pb-3">
                    <input type="password" name="password" class="form-control" placeholder="Contraseña:" value="{{ $user->contraseña }}">
                    {!! $errors-> first('password','<small class="text-danger">:message</small><br>') !!}
                </div>
                <div class="form-group pb-3">
                    <input type="password" name="password_confirmation" class="form-control" placeholder="Repita la contraseña:">
                    {!! $errors-> first('password_confirmation','<small class="text-danger">:message</small><br>') !!}
                </div>
            <div class="form-group pb-3">
                <label for="">Cambiar perfil del usuario</label>
                <select class="form-control" name="perfil_id" id="perfil_id">
                <option selected value="{{ $user->perfil_id }}">{{ $user->perfil_id }}</option>
                    <option value="1">Super Administrador</option>
                    <option value="2">Editor</option>
                    <option value="3">Mercadotecnia</option>
                    <option value="4">Fotógrafo</option>
                    <option value="5">Consulta</option>
                </select>
                {!! $errors-> first('perfil_id','<small class="text-danger">:message</span><br>') !!}
            </div>
            <div class="form-group pb-1">
                <button type="submit" class="btn btn-primary float-right mt-2">Agregar</button>
            </div>
        </form>
    </div>
</div>

@endsection
