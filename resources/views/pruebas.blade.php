<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Pruebas</title>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Email</th>
                <th>Pass</th>
                <th>Perfil_id</th>
            </tr>
        </thead>
        <tbody>
            @foreach($datos as $usuario)
                <tr>
                    <th>{{ $usuario -> usuario_id}}</th>
                    <th>{{ $usuario -> nombre}}</th>
                    <th>{{ $usuario -> apellido}}</th>
                    <th>{{ $usuario -> emailpf }}</th>
                    <th>{{ $usuario -> passpf}}</th>
                    <th>{{ $usuario -> perfil_id}}</th>
                </tr>
            @endforeach
            
        </tbody>
    </table>
    
</body>
</html>