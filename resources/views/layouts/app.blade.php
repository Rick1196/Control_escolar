<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- CSRF Token -->
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <script type="text/javascript" src="{{mix('js/bulma-carousel.js')}}"></script>

        <title>{{ config('app.name', 'Laravel') }} {{ app()->version() }}</title>

        <!-- Styles -->
        <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    </head>

    <body>
        <div id="app">
            <section class="hero is-medium has-carousel">
                <div class="hero-carousel carousel-animated carousel-animate-fade">
                    <div class='carousel-container'>
                        <div class='carousel-item has-background is-active'>
                            <img class="is-background" src="{{url('images/galeriaInicio1.jpg')}}" alt="ap1" />
                        </div>
                        <div class='carousel-item has-background'>
                            <img class="is-background" src="{{url('images/galeriaInicio2.jpg')}}" alt="ap2" />
                        </div>
                        <div class='carousel-item has-background'>
                            <img class="is-background" src="{{url('images/galeriaInicio3.jpg')}}" alt="ap3" />
                        </div>
                        <div class='carousel-item has-background'>
                            <img class="is-background" src="{{url('images/galeriaInicio4.jpg')}}" alt="ap4" />
                        </div>
                    </div>
                    <div class="carousel-navigation is-overlay">
                        <div class="carousel-nav-left">
                            <i class="fa fa-chevron-left" aria-hidden="true"></i>
                        </div>
                        <div class="carousel-nav-right">
                            <i class="fa fa-chevron-right" aria-hidden="true"></i>
                        </div>
                    </div>
                </div>
                <div class="hero-head">
                    <nav class="navbar is-transparent">
                        <div class="container">
                            <div class="navbar-brand">
                                <a class="navbar-item has-text-white" href="{{ url('/') }}">
                                    SCE
                                </a>
                                <span class="navbar-burger burger" data-target="navbarMenuHeroA">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </span>
                            </div>
                            <div id="navbarMenuHeroA" class="navbar-menu">
                                <div class="navbar-end">
                                    @if (Auth::guest())
                                        <a class="navbar-item has-text-white " href="{{ route('login') }}">Iniciar sesion</a>
                                    @else
                                        <div class="navbar-item has-dropdown is-hoverable">
                                            <a class="navbar-link has-text-white" href="#">{{ Auth::user()->name }}</a>

                                            <div class="navbar-dropdown">
                                                <a class="navbar-item" href="{{ route('logout') }}"
                                                   onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                                                    Cerrar sesion
                                                </a>

                                                <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                                      style="display: none;">
                                                    {{ csrf_field() }}
                                                </form>
                                            </div>
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
                <div class="hero-body has-text-centered">
                    <div class="columns is-mobile is-centered">
                        <div class="column is-half is-narrow">
                        </div>
                    </div>
                </div>
                @if (Auth::guest())
                    <div class="hero-foot">
                        <nav class="tabs is-boxed is-fullwidth">
                            <div class="container">
                                <ul>
                                    <li class="has-text-white" ><a href="{{ route('login') }}">Iniciar sesion</a></li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                @elseif(Auth::user()->hasRole('admin'))
                    <nav-slider-adm></nav-slider-adm>
                @elseif(Auth::user()->hasRole('directivo') or Auth::user()->hasRole('administrativo') )
                    <nav-slider-dir></nav-slider-dir>
                @elseif(Auth::user()->hasRole('profesor'))
                    <nav-slider-prof></nav-slider-prof>
                @elseif(Auth::user()->hasRole('alumno'))
                    <nav-slider-std></nav-slider-std>
                @endif
            </section>
            @yield('content')
        </div>
        <footer class="footer">
            <div class="content has-text-centered">
                <p>
                    <strong>SCE</strong>Ricardo Perez | Abril Polo</a>. The source code is licensed
                    <a href="http://www.uaemex.mx">UAEMEX</a>.
                </p>
            </div>
        </footer>
        <!-- Scripts -->
        <script src="{{ asset('js/app.js') }}"></script>
        <script src='https://www.google.com/recaptcha/api.js'></script>
    </body>
</html>
