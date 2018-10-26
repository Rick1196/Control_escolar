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
    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="{{asset('node_modules/materialize-css/dist/css/materialize.min.css')}} "  media="screen,projection"/>
    <script type="text/javascript" src="{{asset('node_modules/materialize-css/dist/js/materialize.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('node_modules/jquery/dist/jquery.min.js')}}"></script>
    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
    <div>
        <ul id="dropdown1" class="dropdown-content">
        @guest
                <li>
                    <a  href="{{ route('login') }}">{{ __('Inicio de sesion') }}</a>
                </li>
                <li>
                    @if (Route::has('register'))
                            <a href="{{ route('register') }}">{{ __('Registrarse') }}</a>
                    @endif
                </li>
            @else
                <li class="disabled"><a>{{ Auth::user()->name }} <span class="badge"></span></a></li>
                <li>
                    <a href="{{ route('logout') }}"
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
        <nav>
            <div class="nav-wrapper">
            <a href="/" class="brand-logo">SCE</a>
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <li><a href="badges.html">Components</a></li>
                <!-- Dropdown Trigger -->
                <li><a class="dropdown-trigger" href="#!" data-target="dropdown1">Sesion<i class="material-icons right">arrow_drop_down</i></a></li>
            </ul>
            </div>
        </nav>
        <main class="py-4">
            @yield('content')
        </main>
    </div>
</body>
<script>

    document.addEventListener('DOMContentLoaded', function() {
        M.AutoInit();
    });
</script>
</html>
