<template>
    <div>
    <div class="hero-foot">
        <nav class="tabs is-boxed is-fullwidth">
            <div class="container">
                <ul>
                    <li><a class="has-text-white" v-on:click="usuarios()">Usuarios</a></li>
                    <li><a class="has-text-white" v-on:click="notificaciones()">Notificaciones</a></li>
                </ul>
            </div>
        </nav>
    </div>
    </div>
</template>
<script>
    export default {
        data: function(){
            return{
                renderUsers: false
            };
        },
        methods:{
            usuarios() {
                this.$root.$emit('usuarios');
            },
            notificaciones(){
                this.$root.$emit('notificaciones');
            },
            reportes(){
                this.$root.$emit('reportes');
            },
            importar(){
                this.$root.$emit('importar');
            }

        },
    }
</script>
