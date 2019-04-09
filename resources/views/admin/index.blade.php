@extends('admin.layouts.template')

@section('title','PF | Inicio')

@section('content')

<div class="container mt-5 pt-4">
    <h2 class="titulo font-weight-bold">Bienvenido {{ Auth::guard('admin')->user()->nombre }}</h2>
    <div class="content my-4">
        <h4>Usuarios registrados en el sistema</h4>
        <div class="text-right">
            <a href="{{ route('admin.create') }}" class="btn btn-info mb-3">Crear nuevo usuario</a>
        </div>
        @if (Session::has('message'))
            <div class="alert alert-info">{{ Session::get('message') }}</div>
        @endif
        <table class="table my-4 py-3">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Email</th>
                    <th>Perfil</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                @foreach($users as $user)
                <tr>
                    <td>{{ $user->id }}</td>
                    <td>{{ $user->nombre}}</td>
                    <td>{{ $user->apellido}}</td>
                    <td>{{ $user->emailpf}}</td>
                    <td>{{ $user->perfil_id}}</td>
                    <td><a href="{{ route('admin.edit', $user->id) }}" class="btn btn-info"><i class="fas fa-edit"></i> Editar</a></td>
                </tr>
                @endforeach()
            </tbody>
        </table>
        {{ $users -> links() }}
    </div>
</div>

@endsection
