<template>
    <div>
        <div class="hero-foot">
            <nav class="tabs is-boxed is-fullwidth">
                <div class="container">
                    <ul>
                        <li><a class="has-text-white" v-on:click="grupos()">Grupos</a></li>
                        <li><a class="has-text-white" v-on:click="mensajes()">Mensajes</a></li>
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
                renderGrupos: false
            };
        },
        methods:{
            grupos() {
                this.$root.$emit('grupos_prof');
            },
            mensajes(){
                this.$root.$emit('mensajes_prof');
            },
            reportes(){
                this.$root.$emit('reportes_prof');
            }

        },
    }
</script>