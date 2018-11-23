@extends('layouts.app')
@section('content')

    <section>
        @if (Auth::guest())
            <main-view></main-view>
        @else
            @if(Auth::user()->hasRole('profesor'))
                <h1>Profesor</h1>
            @elseif(Auth::user()->hasRole('alumno'))
                    <h1>Estudiante</h1>
            @elseif(Auth::user()->hasRole('admin'))
                <a class="button is-large is-fullwidth" href="{{url('/import')}}">Importar</a>
                <adm-view></adm-view>
            @elseif(Auth::user()->hasRole('administrativo'))
                <direc-view></direc-view>
            @else
                    <h1>Otro</h1>
            @endif
        @endif
    </section>
@endsection
