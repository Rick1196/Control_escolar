<template>
    <div>
        <div v-if="grupos_prof">
            <a class="button is-large is-fullwidth" v-on:click="createPDF">Generar PDF</a>
            <div class="container">
                <div class="section">
                    <center>
                        <table class="table">
                            <thead>
                                <th><abbr title="#">#</abbr></th>
                                <th><abbr title="Grupo">Grupo</abbr></th>
                                <th><abbr title="Materia">Materia</abbr></th>
                                <th><abbr title="Ver">Ver</abbr></th>
                            </thead>
                            <tbody>
                                <tr v-for="(g,num) in grupos">
                                    <th>{{num+1}}</th>
                                    <td>{{g.grupo}}</td>
                                    <td>{{g.name}}</td>
                                    <td><button class="button is-link is-rounded" v-on:click="ver(g.id)">Ver</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </center>
                </div>
            </div>
            <div class="modal is-active" v-if="modal">
                <div class="modal-background"></div>
                <div class="modal-card">
                    <header class="modal-card-head">
                        <p class="modal-card-title">Alumnos en el grupo</p>
                        <button v-on:click="clearModal" class="delete" aria-label="close"></button>
                    </header>
                    <section class="modal-card-body">
                        <div class="notification is-success" v-if="modal_errores">
                            <button class="delete" v-on:click="clearErr"></button>
                            <strong>{{modal_mensajes}}</strong>
                        </div>
                        <center>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th><abbr title="#">#</abbr></th>
                                    <th><abbr title="Grupo">Matricula</abbr></th>
                                    <th><abbr title="Materia">Calificacion</abbr></th>
                                    <th><abbr title="Acciones">Actualizar</abbr></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(al,num) in gContent">
                                    <td>{{num}}</td>
                                    <td>{{al.mat}}</td>
                                    <td><input type="number" class="input is-rounded" v-model="al.grade"></td>
                                    <td><a v-on:click="updateStd(al.student,al.grade)" class="button is-link is-rounded">Actualizar</a></td>
                                </tr>
                                </tbody>
                            </table>
                        </center>
                    </section>
                    <footer class="modal-card-foot">
                        <button class="button" v-on:click="clearModal">Cerrar</button>
                    </footer>
                </div>
            </div>
        </div>
        <div v-if="mensajes_prof">
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
        return {
            grupos:[],
            grupos_prof:true,
            mensajes_prof:false,
            reportes_prof:false,
            gContent:[],
            modal_errores: false,
            modal_mensajes:'',
            modal:false,
            grActual:'',
            recibidos:[],
            modal_enviar:false,
            modal_leer:false,
            nuevo:{
                titulo:'',
                texto:'',
                des:''
            },
            temp:'',
            proms:[],
        }
    },
    methods:{
        getGroups(){
                axios.post('api/get_groups_pr',{
                    user:this.user
                }).then(response => {
                    this.grupos = response.data;
                }).catch(error => {
                        console.log(error.response)
                });
        },
        getContent(id){
            this.grActual = id;
             axios.post('api/get_als_gr',{
                    gr:id
                }).then(response => {
                    this.gContent = response.data;
                    console.log(response.data)
                }).catch(error => {
                        console.log(error.response)
                   });
        },
        updateStd(std,grade){
            axios.post('api/up_al_gr',{
                std:std,
                grade:grade
            }).then(response => {
                this.getContent(this.grActual);
                this.modal_mensajes = 'Calificacion registrada';
                this.modal_errores = true;
            }).catch(error => {
                    console.log(error.response)
            });
        },
        clearModal(){
              this.modal = false;
              this.gContent = '';
        },
        ver(id){
                this.modal = true;
                this.getContent(id);
        },
        clearErr(){
            this.modal_errores = false;
            this.modal_mensajes = '';
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
        getProms(){
             axios.post('api/get_prom_gr',{
                    id:this.user,
                }).then(response => {
                    this.proms = response.data;
                }).catch(error => {
                        console.log(error.response)
                });
        },
        createPDF () {
            let pdfName = 'Promedios'; 
            var doc = new jsPDF();
            var columns = [{title:"Grupo", dataKey:"identifier"},
            {title:"Materia",dataKey:"name"},
            {title:"Calificacion",dataKey:"calificacion"}];
            doc.autoTable(columns,this.proms);
            doc.save(pdfName + '.pdf');
        }
    },
    mounted(){
        this.getGroups();
        this.getProms();
        this.$root.$on('grupos_prof',() => {
            this.grupos_prof =true;
            this.mensajes_prof = false;
            this.reportes_prof = false;
            this.getProms();
        });
        this.$root.$on('mensajes_prof',() => {
            this.grupos_prof =false;
            this.mensajes_prof = true;
            this.reportes_prof = false;
            this.getMensajes();
        });
        this.$root.$on('reportes_prof',() => {
            this.grupos_prof =false;
            this.mensajes_prof = false;
            this.reportes_prof = true;
        });
    }
}
</script>
