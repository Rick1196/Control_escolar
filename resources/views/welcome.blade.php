@extends('layouts.app')
@section('content')
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
                    <div class="hero-body has-text-centered">
                        <div class="columns is-mobile is-centered">
                            <div class="column is-half is-narrow">
                                <div class="field has-addons">
                                    <div class="control is-expanded">
                                        <input class="input" type="text" placeholder="Find a repository">
                                    </div>
                                    <div class="control">
                                        <a class="button is-info">
                                            Search
                                        </a>
                                    </div>
                                </div>
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
    <section>
        <roles-component></roles-component>
    </section>
@endsection
