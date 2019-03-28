

@section('title','PF | Inicio')
    
@section('content')

<div class="container mt-5 pt-5">
        @if (session('status'))
            <div class="alert alert-success" role="alert">
                {{ session('status') }}
            </div>
        @endif

        <h1 class="titulo font-weight-bold">Bienvenido Admin</h1> 
        @php
         //   print_r($table_sesion);
        @endphp
</div>

@endsection