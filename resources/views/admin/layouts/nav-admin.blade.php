<nav class="navbar navbar-expand-md navbar-dark bg-secondary fixed-top">
    <div class="container">
        <a class="navbar-brand" href="{{ route('inicio') }}">
           <img src="../img/header_logo_pf-n.png" alt="Logotipo de la empresa" width="150" height="auto">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Left Side Of Navbar -->
            <ul class="navbar-nav mr-auto ml-4">
                <li class="nav-item active">
                <a class="nav-link" href="{{ route('inicio') }}">INICIO</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="{{ route('coberturas')}}">COBERTURAS</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('colecciones')}}">COLLECCIONES</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('fotografos')}}">FOTÓGRAFOS</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="{{ route('contacto.create')}}">CONTACTO</a>
                </li>
            </ul>

            <!-- Right Side Of Navbar -->
            <ul class="navbar-nav ml-auto">
                <!-- Authentication Links -->
                @guest
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('login') }}"><i class="fas fa-sign-in-alt"></i> INICIA SESIÓN</a>
                    </li>
                    @if (Route::has('register'))
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('register') }}"><i class="far fa-user"></i> REGÍSTRATE</a>
                        </li>
                    @endif
                @else
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                            {{ Auth::user()->nombre }} <span class="caret"></span>
                        </a>

                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="{{ route('logout') }}"
                               onclick="event.preventDefault();
                                             document.getElementById('logout-form').submit();">
                                <i class="fas fa-sign-out-alt"></i> SALIR
                            </a>

                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                @csrf
                            </form>
                        </div>
                    </li>
                @endguest
            </ul>
        </div>
    </div>
</nav>
