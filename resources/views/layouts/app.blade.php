<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>SCE</title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js')}}" ></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css
    <link type="text/css" rel="stylesheet" href="{{asset('node_modules/materialize-css/dist/css/materialize.min.css')}} "  media="screen,projection"/>
    <script type="text/javascript" src="{{asset('node_modules/materialize-css/dist/js/materialize.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('node_modules/jquery/dist/jquery.min.js')}}"></script>
    Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
    <div>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="#">SCE</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Sesion
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    @guest
                            <a class="dropdown-item" href="{{ route('login') }}">{{ __('Inicio de sesion') }}</a>
                            @if (Route::has('register'))
                                    <a class="dropdown-item" href="{{ route('register') }}">{{ __('Registrarse') }}</a>
                            @endif
                    @else
                        <a class="dropdown-item">{{ Auth::user()->name }} <span class="badge"></span></a>
                            <a class="dropdown-item" href="{{ route('logout') }}"
                                        onclick="event.preventDefault();
                                                        document.getElementById('logout-form').submit();">
                                        {{ __('Logout') }}
                            </a>
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                            </form>
                    @endguest
                    </div>
                </li>
                </ul>
            </div>
        </nav>

        <main class="py-4">
            @yield('content')
        </main>
    </div>
</body>
</html>
