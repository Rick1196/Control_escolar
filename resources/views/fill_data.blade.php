@extends('layouts.app')
@section('content')
    <div class="container" id="app1">
        @if($user->hasRole('admin'))
            <data-roles role="admin" user="{{$user->id}}" email="{{$user->email}}"></data-roles>
        @elseif($user->hasRole('profesor'))
            <data-roles role="profesor" user="{{$user->id}}" email="{{$user->email}}"></data-roles>
        @elseif($user->hasRole('directivo'))
            <data-roles role="directivo" user="{{$user->id}}" email="{{$user->email}}"></data-roles>
        @elseif($user->hasRole('alumno'))
            <data-roles role="alumno" user="{{$user->id}}" email="{{$user->email}}"></data-roles>
        @elseif($user->hasRole('administrativo'))
            <data-roles role="administrativo" user="{{$user->id}}" email="{{$user->email}}"></data-roles>
        @endif
    </div>
   
@endsection