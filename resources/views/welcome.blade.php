@extends('layouts.app')
    @section('content')
        <div id="content">
            <center>
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="{{asset('images/galeriaInicio1.jpg')}}" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="{{asset('images/galeriaInicio2.jpg')}}" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="{{asset('images/galeriaInicio3.jpg')}}" alt="Third slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="{{asset('images/galeriaInicio4.jpg')}}" alt="Fourth slide">
                    </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
			</div>
		<div id="page-wrapper">
			<section id="banner">
			    	<h2>Bienvenidos a Control Escolar</h2>
		    		<p>Preparatoria José Antonio Álzate</p>
			</section>
		</div>
            </center>
        </div>
    @endsection
