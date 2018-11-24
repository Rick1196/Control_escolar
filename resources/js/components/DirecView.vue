<template>
    <div class="container" >
        <div class="container" v-if="renderGroups">
            <div class="notification is-success" v-if="body_errores">
                <button class="delete" v-on:click="clearErr2"></button>
                <strong>{{body_mensajes}}</strong>
            </div>
            <section>
                <div class="section">
                    <table class="table">
                        <thead>
                        <tr>
                            <th><abbr title="Grupo">Grupo</abbr></th>
                            <th><abbr title="Profesor">Profesor</abbr></th>
                            <th><abbr title="Materia">Materia</abbr></th>
                            <th><abbr title="Periodo">Periodo</abbr></th>
                            <th><abbr title="Acciones">Guardar</abbr></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input class="input is-rounded" type="text" v-model="grupo.identificador" placeholder="Identificador"></td>
                            <td>
                                <div class="select">
                                    <select v-model="grupo.profesor" class="select">
                                        <option  v-for="prof in profesores" :value="prof.id" :key="prof.id">{{prof.name}}</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="select">
                                    <select v-model="grupo.materia" >
                                        <option  v-for="mat in materias" :value="mat.id" :key="mat.id">{{mat.name}}</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="select">
                                    <select v-model="grupo.periodo"  class="select">
                                        <option  v-for="per in periodos" :value="per.id" :key="per.id">{{per.desc}}</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <a class="button is-primary is-rounded" v-on:click="postGroup">Guardar</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <section style="overflow-y: scroll; max-height: 400px;">
                <center>
                    <div class="select">
                        <select v-model="selectedPer" v-on:change="getGroups">
                            <option :value="'todos'" :key="'todos'">Todos</option>
                            <option  v-for="per in periodos" :value="per.desc" :key="per.desc">{{per.desc}}</option>
                        </select>
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th><abbr title="#">#</abbr></th>
                                <th><abbr title="Grupo">Grupo</abbr></th>
                                <th><abbr title="Materia">Materia</abbr></th>
                                <th><abbr title="Profesor">Profesor</abbr></th>
                                <th><abbr title="Acciones">Ver</abbr></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(group,num) in groups">
                                <td>{{num}}</td>
                                <td>{{group.identifier}}</td>
                                <td>{{group.subject}}</td>
                                <td>{{group.email}}</td>
                                <td><a v-on:click="addUsrsM(group.gid)" class="button is-primary is-rounded">Ver</a></td>
                            </tr>
                        </tbody>
                    </table>
                </center>
            </section>
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
                        <div class="field has-addons">
                            <div class="control">
                                <input class="input" v-model="matSearch" type="text" placeholder="Buscar por matricula">
                            </div>
                            <div class="control">
                                <a class="button is-info" v-on:click="getMat">
                                Buscar Matricula
                                </a>
                            </div>
                        </div>
                        <div class="field is-horizontal" v-if="alSearched.length > 0">
                            <div class="field-label is-normal">
                                <label class="label">Alumno</label>
                            </div>
                            <div class="field-body">
                                <div class="field">
                                    <p class="control is-expanded has-icons-left">
                                        <input class="input" disabled type="text" v-model="alSearched[0].curp" placeholder="Name">
                                        <span class="icon is-small is-left">
                                        <i class="fas fa-user"></i>
                                        </span>
                                    </p>
                                </div>
                                <div class="field">
                                    <p class="control is-expanded has-icons-left has-icons-right">
                                        <input class="input " type="text" disabled v-model="alSearched[0].mat">
                                        <span class="icon is-small is-left">
                                        <i class="fas fa-envelope"></i>
                                        </span>
                                        <span class="icon is-small is-right">
                                        <i class="fas fa-check"></i>
                                        </span>
                                    </p>
                                </div>
                                <div class="field">
                                    <a v-on:click="postStdGr" class="button is-primary is-rounded">Agregar al grupo</a>
                                </div>
                            </div>
                        </div>
                        <center>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th><abbr title="#">#</abbr></th>
                                    <th><abbr title="Grupo">Matricula</abbr></th>
                                    <th><abbr title="Materia">Calificacion</abbr></th>
                                    <th><abbr title="Acciones">Eliminar</abbr></th>
                                    <th><abbr title="Acciones">Actualizar</abbr></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(al,num) in alumnos.lista">
                                    <td>{{num}}</td>
                                    <td>{{al.mat}}</td>
                                    <td><input type="number" class="input is-rounded" v-model="al.grade"></td>
                                    <td><a v-on:click="delStd(al.student)" class="button is-danger is-rounded">Eliminar</a></td>
                                    <td><a v-on:click="updateStd(al.student,al.grade,al.pgs)" class="button is-link is-rounded">Actualizar</a></td>
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
    </div>
</template>
<script>
    export default {
        data: function(){
            return{
                groups:[],
                renderGroups: true,
                renderGrades: false,
                grupo:{
                    id:0,
                    identificador:'',
                    materia:'',
                    profesor:'',
                    periodo:'',
                },
                materias:[],
                profesores:[],
                modal:false,
                alumnos:{
                    grupo:'',
                    lista:[],
                    periodo:'',
                    new:'',

                },
                periodos:[],
                selectedPer:'todos',
                allSt:[],
                alSearched:'',
                matSearch:'',
                modal_errores: false,
                modal_mensajes:'',
                body_errores: false,
                body_mensajes:''
            }


        },
        mounted(){
            this.getGroups();
            this.getMaterias();
            this.getProfesores();
            this.getPeriodos();
            this.$root.$on('grupos',() => {
                this.renderGroups =true;
                this.renderGrades = false;
                this.getGroups();
                this.getMaterias();
                this.getProfesores();
            });
            this.$root.$on('calificaciones',() => {
                this.renderGroups =false;
                this.renderGrades = true;
            });
        },
        methods:{
            getGroups(){
                axios.post('api/get_groups',{
                    per:this.selectedPer
                }).then(response => {
                    this.groups = response.data;
                })
                    .catch(error => {
                        console.log(error.response)
                    });
            },
            getProfesores(){
                axios.get('api/get_profesores').then(response => {
                    this.profesores = response.data;
                })
                    .catch(error => {
                        console.log(error.response)
                    });
            },
            getMaterias(){
                axios.get('api/get_materias').then(response => {
                    this.materias = response.data;
                })
                    .catch(error => {
                        console.log(error.response)
                    });

            },
            getMaterias(){
                axios.get('api/get_materias').then(response => {
                    this.materias = response.data;
                })
                    .catch(error => {
                        console.log(error.response)
                    });

            },
            getPeriodos(){
                axios.get('api/get_peridos').then(response => {
                    this.periodos = response.data;
                })
                    .catch(error => {
                        console.log(error.response)
                    });

            },
            getAllSt(){
                axios.get('api/get_all_students').then(response => {
                    this.allSt = response.data;
                })
                    .catch(error => {
                        console.log(error.response)
                    });

            },
            getAlsGr(){
                axios.post('api/get_als_gr',{
                    gr:this.alumnos.grupo
                }).then(response => {
                    this.alumnos.lista = response.data;
                })
                    .catch(error => {
                        console.log(error.response)
                    });

            },
            postGroup(){
                axios.post('api/post_group',{
                    profesor:this.grupo.profesor,
                    materia:this.grupo.materia,
                    iden:this.grupo.identificador,
                    per:this.grupo.periodo
                }).then(response => {
                    console.log(response);
                    this.getGroups();
                    this.body_mensajes = 'Grupo agregado';
                    this.body_errores = true;
                    this.grupo.identificador  = '';
                    this.grupo.materia  = '';
                    this.grupo.profesor  = '';
                    this.grupo.periodo  = '';
                })
                    .catch(error => {
                        console.log(error.response)
                    });

            },
            postStdGr(){
                axios.post('api/post_std_gr',{
                    gr:this.alumnos.grupo,
                    per:this.selectedPer,
                    al:this.alSearched[0].id,
                }).then(response => {
                    console.log(response);
                    this.getAlsGr();
                })
                    .catch(error => {
                        console.log(error.response)
                    });
            },
            addUsrsM(id){
                this.modal = true;
                this.alumnos.grupo = id;
                this.getAlsGr();
                this.getAllSt();
            },
            delStd(id){
                axios.post('api/delete_al_gr',{
                    id:id
                }).then(response => {
                    this.getAlsGr();
                })
                    .catch(error => {
                        console.log(error.response)
                    });
            },
            clearModal(){
              this.modal = false;
              this.alumnos.grupo = '';
            },
            getMat(){
                 axios.post('api/get_al_mat',{
                    mat:this.matSearch
                }).then(response => {
                    this.alSearched = response.data;
                }).catch(error => {
                        console.log(error.response)
                });
            },
            updateStd(std,grade,mat){
                axios.post('api/up_al_gr',{
                    std:std,
                    grade:grade,
                    mat:mat
                }).then(response => {
                    this.getAlsGr();
                    this.modal_mensajes = 'Calificacion registrada';
                    this.modal_errores = true;
                }).catch(error => {
                        console.log(error.response)
                });
            },
            clearErr(){
                this.modal_errores = false;
                this.modal_mensajes = '';
            },
            clearErr2(){
                this.body_errores = false;
                this.body_mensajes = '';
            },

        },
    }
</script>