<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>SCE</title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="{{ asset('node_modules/material-design-lite/material.min.css') }}" rel="stylesheet">
    <script  type="text/javascript"  src="{{ asset('node_modules/material-design-lite/material.min.js') }}"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">


    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
    <div id="app">
        <button id="demo-menu-lower-left"
                class="mdl-button mdl-js-button mdl-button--icon">
        <i class="material-icons">more_vert</i>
        </button>


        <ul class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect"
        for="demo-menu-lower-left">
            @guest
                <li class="mdl-menu__item">
                    <a class="nav-link" href="{{ route('login') }}">{{ __('Inicio de sesion') }}</a>
                </li>
                <li class="mdl-menu__item">
                    @if (Route::has('register'))
                            <a class="nav-link" href="{{ route('register') }}">{{ __('Registrarse') }}</a>
                    @endif
                </li>
            @else
                <li disabled class="mdl-menu__item">{{ Auth::user()->name }} <span class="caret"></span></li>
                <li class="mdl-menu__item">
                    <a class="dropdown-item" href="{{ route('logout') }}"
                                onclick="event.preventDefault();
                                                document.getElementById('logout-form').submit();">
                                {{ __('Logout') }}
                    </a>
                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                @csrf
                    </form>
                </li>
            @endguest
        </ul>
        <main class="py-4">
            @yield('content')
        </main>
    </div>
    <input type="hidden" id="csrf_token" value="{{ csrf_token() }}" /> 
    <script src="{{ elixir('js/app.js') }}"></script> 
</body>
</html>
