<template>
    <div>
        <div v-if="grupos_al">
            <a class="button is-large is-fullwidth" v-on:click="createPDF">Generar PDF</a>
            <center>
                <table class="table">
                    <thead>
                        <th><abbr title="#">#</abbr></th>
                        <th><abbr title="Grupo">Grupo</abbr></th>
                        <th><abbr title="Materia">Materia</abbr></th>
                        <th><abbr title="Calificacion">Calificacion</abbr></th>
                    </thead>
                    <tbody>
                        <tr v-for="(mat,num) in grupos">
                            <th>{{num+1}}</th>
                            <td>{{mat.identifier}}</td>
                            <td>{{mat.name}}</td>
                            <td>{{mat.grade}}</td>
                        </tr>
                    </tbody>
                </table>
            </center>
        </div>
        <div v-if="mensajes_al">
            <div class="section">
                <a class="button is-large is-fullwidth" v-on:click="redactar">Redactar mensaje</a>
                <center>
                    <table class="table">
                        <thead>
                            <th><abbr title="#">#</abbr></th>
                            <th><abbr title="Titulo">Titulo</abbr></th>
                            <th><abbr title="Acciones">Acciones</abbr></th>
                        </thead>
                        <tbody>
                            <tr v-for="(men,num) in recibidos">
                                <th>{{num}}</th>
                                <td>{{men.titulo}}</td>
                                <td><button class="button is-link is-rounded" v-on:click="leer(men)">Ver</button><button v-on:click="eliminar(men.id)" class="button is-danger is-rounded">Eliminar</button></td>
                            </tr>
                        </tbody>
                    </table>
                </center>
            </div>
        </div>
        <div class="modal is-active" v-if="modal_leer">
            <div class="modal-background"></div>
            <div class="modal-card">
                <header class="modal-card-head">
                <p class="modal-card-title">{{temp.origen}} {{temp.titulo}}</p>
                <button class="delete"  v-on:click="clearModalLeer" aria-label="close"></button>
                </header>
                <section class="modal-card-body">
                {{temp.mensaje}}
                </section>
                <footer class="modal-card-foot">
                <button class="button" v-on:click="clearModalLeer">Cerrar</button>
                </footer>
            </div>
        </div>
        <div class="modal is-active" v-if="modal_enviar">
            <div class="modal-background"></div>
            <div class="modal-card">
                <header class="modal-card-head">
                <p class="modal-card-title">Redactar Mensaje</p>
                <button class="delete" v-on:click="clearModalEnviar" aria-label="close"></button>
                </header>
                <section class="modal-card-body">
                    <div class="field">
                        <label class="label">Destinatario</label>
                        <div class="control">
                            <input class="input" v-model="nuevo.des" type="text" placeholder="@@@@">
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Titulo</label>
                        <div class="control">
                            <input class="input" v-model="nuevo.titulo" type="text" placeholder="Titulo">
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Mensaje</label>
                        <div class="control">
                            <textarea class="textarea" v-model="nuevo.texto" placeholder="Mensaje"></textarea>
                        </div>
                    </div>
                </section>
                <footer class="modal-card-foot">
                <button class="button" v-on:click="clearModalEnviar">Cerrar</button>
                <button class="button" v-on:click="enviar">Enviar</button>
                </footer>
            </div>
        </div>
    </div>
</template>
<script>
import jsPDF from 'jspdf'
export default {
    props:['user'],
    data(){
        return{
            grupos_al:true,
            mensajes_al:false,
            grupos:'',
            recibidos:[],
            modal_enviar:false,
            modal_leer:false,
            nuevo:{
                titulo:'',
                texto:'',
                des:''
            },
            temp:''
        }
    },
    methods:{
        getGroups(){
                axios.post('api/get_groups_al',{
                    user:this.user
                }).then(response => {
                    this.grupos = response.data;
                }).catch(error => {
                        console.log(error.response)
                });
        },
        clearModalEnviar(){
              this.modal_enviar = false;
              this.nuevo.titulo  ='';
              this.nuevo.texto = '';
              this.nuevo.des = '';
        },
        clearModalLeer(){
              this.modal_leer = false;
              this.temp = '';
        },
        leer(mensaje){
            this.temp = mensaje;
            this.modal_leer = true;
        },
        getMensajes(){
             axios.post('api/read',{
                    user:this.user
                }).then(response => {
                    this.recibidos = response.data;
                }).catch(error => {
                        console.log(error.response)
                });
        },
        eliminar(id){
             axios.post('api/delete',{
                    id:id
                }).then(response => {
                    this.getMensajes();
                }).catch(error => {
                        console.log(error.response)
                });
        },
        redactar(){
            this.modal_enviar = true;
        },
        enviar(){
            axios.post('api/send',{
                    org:this.user,
                    des:this.nuevo.des,
                    titulo:this.nuevo.titulo,
                    texto:this.nuevo.texto
                }).then(response => {
                    alert('Mensaje enviado');
                    this.clearModalEnviar();
                }).catch(error => {
                        console.log(error.response)
                });
        },
        createPDF () {
            let pdfName = 'tira_Materias'; 
            var doc = new jsPDF();
            var columns = [{title:"Grupo", dataKey:"identifier"},
            {title:"Materia",dataKey:"name"},
            {title:"Calificacion",dataKey:"grade"}];
            doc.autoTable(columns,this.grupos);
            doc.save(pdfName + '.pdf');
        }
    },
    mounted(){
        this.getGroups();
        this.$root.$on('grupos_std',() => {
            this.grupos_al =true;
            this.mensajes_al = false;
            this.getGroups();
        });
        this.$root.$on('mensajes_std',() => {
            this.grupos_al =false;
            this.mensajes_al = true;
            this.getMensajes();
        });
    }
}
</script>

