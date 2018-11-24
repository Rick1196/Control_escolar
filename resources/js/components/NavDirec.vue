<template>
    <div>
        <div class="hero-foot">
            <nav class="tabs is-boxed is-fullwidth">
                <div class="container">
                    <ul>
                        <li><a class="has-text-white" v-on:click="usuarios()">Grupos</a></li>
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
                this.$root.$emit('grupos');
            },
            notificaciones(){
                this.$root.$emit('calificaciones');
            }

        },
    }
</script>
