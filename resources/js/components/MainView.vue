<template>
    <div class="container">
        <div class="section">
            <section>
                <div class="container">
                    <div class="tile is-ancestor">
                        <div class="tile is-vertical is-8">
                            <div class="tile">
                                <div class="tile is-parent is-vertical">
                                    <article class="tile is-child notification is-primary">
                                        <p class="title">{{now}}</p>
                                    </article>
                                    <article class="tile is-child notification is-warning">
                                        <p class="title">Has uso de esta aplicacion</p>
                                        <p class="subtitle">Debes iniciar sesion</p>
                                    </article>
                                </div>
                                <div class="tile is-parent">
                                    <article class="tile is-child notification is-info">
                                        <p class="title">Avisos</p>
                                        <div class='carousel carousel-animated carousel-animate-slide'>
                                            <div class='carousel-container'>
                                                <div class='carousel-item has-background' v-for="not in notificaciones">
                                                    <figure class="image is-4by3">
                                                        <p class="title">{{not.texto}}</p>
                                                    </figure>
                                                </div>
                                                <div class='carousel-item has-background'>
                                                    <figure class="image is-4by3">
                                                        <p class="title">Calendario de examnes</p>
                                                    </figure>
                                                </div>
                                                <div class='carousel-item has-background'>
                                                    <figure class="image is-4by3">
                                                        <p class="title">Periodo de bajas finalizado</p>
                                                    </figure>
                                                </div>
                                                <div class='carousel-item has-background'>
                                                    <figure class="image is-4by3">
                                                        <p class="title">Proximos eventos dentro del plantel</p>
                                                    </figure>
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
                                    </article>
                                </div>
                            </div>
                        </div>
                        <div class="tile is-parent">
                            <article class="tile is-child notification is-success">
                                <div class="content">
                                    <p class="title">SCE</p>
                                    <p class="subtitle">Sistema de control escolar</p>
                                    <div class="content">
                                        <p>Aplicacion dedicada a la gestion
                                            y automatizacion de los procesos de control esoclar</p>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</template>
<script>
    export default {
        data: function () {
            return{
                now:'',
                notificaciones:''
            }
        },
        methods:{
            getDate(){
                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth()+1; //January is 0!
                var yyyy = today.getFullYear();

                if(dd<10) {
                    dd = '0'+dd
                }

                if(mm<10) {
                    mm = '0'+mm
                }

                this.now = dd + '/' + mm + '/' + yyyy;

            },
            getNotificaciones(){
                axios.get('api/get_notificaciones').then(response => {
                    this.notificaciones = response.data;
                }).catch(error => {
                        console.log(error.response)
                });
            },
        },
        mounted(){
            this.getDate();
            this.getNotificaciones();
        },
    }
</script>