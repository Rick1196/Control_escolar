@extends('layouts.app')

@section('content')
<div class="container"> 
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Dashboard</div>
                <div id="app1" class="container">
                    <groups-crud></teachers-crud>
                </div>
                <input type="hidden" id="csrf_token" value="{{ csrf_token() }}" /> 
            </div>
        </div>
    </div>
</div>

@endsection

