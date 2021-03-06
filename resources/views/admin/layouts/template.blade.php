<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>@yield('title')</title>
   
    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans|Roboto" rel="stylesheet">
    
    <!-- Icon -->
    <link rel="icon" href="/../img/favicon.ico">

    <!-- Styles -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/style.css') }}"  rel="stylesheet">
</head>
<body>
    @auth('admin')
        @include('admin.layouts.nav-admin')
        <main class="py-4">
            @yield('content')
        </main>
        <footer class="mt-4 bg-dark fixed-bottom">
            <article class=" text-center p-1 text-white">© 2019 | Comunicación e Información S.A. de C.V. | Todos los derechos reservados.</article>
        </footer>
    @endauth 
    
    @guest('admin')
        <main class="py-4">
            @yield('content')
        </main>  
    @endguest

    <script src="../js/jquery-3.3.1.min.js" ></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</body>
</html>


