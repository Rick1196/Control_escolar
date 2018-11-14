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
                                <a class="navbar-item">
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
                                        <a class="navbar-item " href="{{ route('login') }}">Login</a>
                                        <a class="navbar-item " href="{{ route('register') }}">Register</a>
                                    @else
                                        <div class="navbar-item has-dropdown is-hoverable">
                                            <a class="navbar-link" href="#">{{ Auth::user()->name }}</a>

                                            <div class="navbar-dropdown">
                                                <a class="navbar-item" href="{{ route('logout') }}"
                                                   onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                                                    Logout
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
                <div class="hero-foot">
                    <nav class="tabs is-boxed is-fullwidth">
                        <div class="container">
                            <ul>
                                <li class="is-active"><a>Overview</a></li>
                                <li><a class="has-text-white">Modifiers</a></li>
                                <li><a class="has-text-white">Grid</a></li>
                                <li><a class="has-text-white">Elements</a></li>
                                <li><a class="has-text-white">Components</a></li>
                                <li><a class="has-text-white">Layout</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </section>
            @yield('content')
        </div>

        <!-- Scripts -->
        <script src="{{ asset('js/app.js') }}"></script>
    </body>
</html>
