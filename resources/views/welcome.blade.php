@extends('layouts.app')
@section('content')

    <section>
        @if (Auth::guest())
            <main-view></main-view>
        @else
            @if(Auth::user()->hasRole('profesor'))
                <prof-view user="{{ Auth::user()->id }}"></prof-view>
            @elseif(Auth::user()->hasRole('alumno'))
                    <std-view user="{{ Auth::user()->id }}"></std-view>
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
