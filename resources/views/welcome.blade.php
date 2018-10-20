<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>SCE</title>

        <!-- Fonts -->
        <link rel="stylesheet" href="{{ asset('node_modules/material-design-lite/material.min.css') }}" rel="stylesheet">
        <script  type="text/javascript"  src="{{ asset('node_modules/material-design-lite/material.min.js') }}"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    </head>
    <body>
        <div id="main">
            <button id="demo-menu-lower-left" class="mdl-button mdl-js-button mdl-button--icon">
                <i class="material-icons">more_vert</i>
            </button>
            <ul class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect"
                for="demo-menu-lower-left">
                @if (Route::has('login'))
                    @auth
                        <li class="mdl-menu__item">
                            <a href="{{ url('/home') }}">Inicio</a>
                        </li>
                    @else
                        <li class="mdl-menu__item mdl-menu__item--full-bleed-divider">
                            <a href="{{ route('login') }}">Inicar sesion</a>
                        </li>
                        <li disabled class="mdl-menu__item">
                            <a href="{{ route('register') }}">Registrarse</a>
                        </li>
                    @endauth
                @endif
            </ul>
        </div>
        <div id="content">
            <center>
                <h1>SCE</h1>
            </center>
        </div>
    </body>
</html>
