@extends('admin.layouts.template')

@section('title','PF | Inicio')

@section('content')

<div class="container mt-5 pt-4">
    <!--<h2 class="titulo font-weight-bold">Bienvenido {{ Auth::guard('admin')->user()->nombre }}</h2>-->
    <div class="content">
        <h4>Usuarios registrados en el sistema</h4>
        <div class="text-right">
            <a href="{{ route('admin.create') }}" class="btn btn-success mb-3">Crear nuevo usuario</a>
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
                    <form action="{{ route('admin.destroy', $user->id) }}" method="POST">
                        <td>
                            <a href="{{ route('admin.show', $user->id)}}" class="btn btn-info mr-4"><i class="fas fa-eye"></i> Detalles</a>
                            <a href="{{ route('admin.edit', $user->id) }}" class="btn btn-warning mr-4"><i class="fas fa-edit"></i> Editar</a>
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger" onclick="return confirm('¿Seguro, que quiere borrar el usuario?')">
                                <i class="fas fa-trash-alt"></i> Eliminar
                            </button>
                        </td>                         
                    </form>            
                </tr>
                @endforeach()
            </tbody>
        </table>
        <div class="mt-4">
            {{ $users -> links() }}
        </div>
    </div>
</div>

@endsection
