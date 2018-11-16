<template>
    <div>
        <div v-if="renderUsers">
            <div class="section">
                <section>
                    <nav class="level">
                        <div class="level-item has-text-centered">
                            <div>
                                <p class="heading">Alumnos</p>
                                <p class="title">{{this.nSt}}</p>
                            </div>
                        </div>
                        <div class="level-item has-text-centered">
                            <div>
                                <p class="heading">Profesores</p>
                                <p class="title">{{this.nTch}}</p>
                            </div>
                        </div>
                        <div class="level-item has-text-centered">
                            <div>
                                <p class="heading">Usuarios</p>
                                <p class="title">{{this.nUsers}}</p>
                            </div>
                        </div>
                    </nav>
                </section>
            </div>
            <div class="section">
                <div class="columns">
                    <div class="colum is-one-quarter">
                        <section>
                            <nav class="panel" v-if="renderUsers">
                                <p class="panel-heading">
                                    Usuarios
                                </p>
                                <a class="panel-block is-active" v-on:click="registro">
                                    <span class="panel-icon">
                                      <i class="fas fa-book" aria-hidden="true"></i>
                                    </span>
                                    Registrar
                                </a>
                                <a class="panel-block" v-on:click="listado">
                                    <span class="panel-icon">
                                      <i class="fas fa-book" aria-hidden="true"></i>
                                    </span>
                                    Listar
                                </a>
                            </nav>
                        </section>
                    </div>
                    <div class="container is-flex">
                        <div class="column" v-if="registroRender">
                            <div class="section">
                                <section>
                                    <center>
                                        <h3>Usuario</h3>
                                    </center>
                                    <div class="field">
                                        <label class="label">Usuario</label>
                                        <div class="control">
                                            <input class="input" v-model="usuario.names" type="text" placeholder="Usuario">
                                        </div>
                                    </div>

                                    <div class="field">
                                        <label class="label">E-mail</label>
                                        <div class="control has-icons-left has-icons-right">
                                            <input class="input" type="text" placeholder="E-mail@" v-model="usuario.email">
                                            <span class="icon is-small is-left">
                                          <i class="fas fa-user"></i>
                                        </span>
                                            <span class="icon is-small is-right">
                                          <i class="fas fa-check"></i>
                                        </span>
                                        </div>
                                    </div>

                                    <div class="field">
                                        <label class="label">Password</label>
                                        <div class="control has-icons-left has-icons-right">
                                            <input class="input is-danger" type="password" v-model="usuario.password1">
                                        </div>
                                    </div>

                                    <div class="field">
                                        <label class="label">Confirmar Password</label>
                                        <div class="control has-icons-left has-icons-right">
                                            <input class="input is-danger" type="password" v-model="usuario.password2">
                                        </div>
                                    </div>

                                    <div class="field">
                                        <label class="label">Tipo de usuario</label>
                                        <div class="control">
                                            <div class="select">
                                                <select v-model="usuario.tipo">
                                                    <option  v-for="rol in roles" :value="rol" :key="rol.id">{{rol.description}}</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                            <div class="section">
                                <section>
                                    <center>
                                        <h3>Informacion personal</h3>
                                    </center>
                                    <div class="field">
                                        <label class="label">Nombre(s)</label>
                                        <div class="control has-icons-left has-icons-right">
                                            <input class="input " type="text" v-model="persona.names">
                                        </div>
                                    </div>
                                    <div class="field">
                                        <label class="label">Apellidos</label>
                                        <div class="control has-icons-left has-icons-right">
                                            <input class="input" type="text" v-model="persona.last">
                                        </div>
                                    </div>
                                    <div class="field">
                                        <label class="label">Edad</label>
                                        <div class="control has-icons-left has-icons-right">
                                            <input class="input " type="number" v-model="persona.age" min="0" max="100">
                                        </div>
                                    </div>

                                    <div class="field">
                                        <label class="label">Numero telefonico</label>
                                        <div class="control has-icons-left has-icons-right">
                                            <input class="input " type="text" v-model="persona.phone" maxlength="10">
                                        </div>
                                    </div>
                                    <div class="field">
                                        <label class="label">Direccion</label>
                                        <div class="control has-icons-left has-icons-right">
                                            <input class="input " type="text" v-model="persona.addr">
                                        </div>
                                    </div>
                                    <div class="field">
                                        <label class="label">Genero</label>
                                        <div class="control">
                                            <div class="select">
                                                <select v-model="persona.gender">
                                                    <option  v-for="gender in genders" :value="gender.key" :key="gender.key">{{gender.nombre}}</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <section v-if="renderForm !== 'alumno' && renderForm !== '' ">
                                        <div class="field">
                                            <label class="label">RFC</label>
                                            <div class="control has-icons-left has-icons-right">
                                                <input class="input " type="text" v-model="worker.rfc" maxlength="13" minlength="12">
                                            </div>
                                        </div>
                                        <div class="field">
                                            <label class="label">Salario</label>
                                            <div class="control has-icons-left has-icons-right">
                                                <input class="input " type="number" v-model="worker.salary" step="0.1" value="4000">
                                            </div>
                                        </div>
                                    </section>
                                    <section v-if="renderForm === 'alumno' ">
                                        <div class="field">
                                            <label class="label">CURP</label>
                                            <div class="control has-icons-left has-icons-right">
                                                <input class="input " type="text" v-model="students.curp" maxlength="18" minlength="18">
                                            </div>
                                        </div>
                                    </section>
                                </section>
                            </div>


                            <div class="field is-grouped">
                                <div class="control">
                                    <button class="button is-link" v-on:click="postUser()">Registrar</button>
                                </div>
                                <div class="control">
                                    <button class="button is-text" v-on:click="limpiarReg">Cancelar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="column" v-if="listadoRender">
                        <div class="container">
                            <section>
                                <div class="field has-addons">
                                    <div class="control">
                                        <input class="input" type="text" v-model="search" placeholder="Busacar usuario">
                                    </div>
                                    <div class="control">
                                        <a class="button is-info" v-on:click="getUser">
                                            Buscar
                                        </a>
                                    </div>
                                </div>
                            </section>
                            <section style="overflow-y: scroll; max-height: 400px;">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th><abbr title="#"></abbr>#</th>
                                        <th><abbr title="Correo"></abbr>Direccion de correo</th>
                                        <th><abbr title="Correo"></abbr>Nombre de usuario</th>
                                        <th><abbr title="Acciones">Acciones</abbr></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="(usuario,num) in usuarios">
                                        <th>{{num}}</th>
                                        <td>{{usuario.email}}</td>
                                        <td>{{usuario.name}}</td>
                                        <td><button v-on:click="deleteU(usuario.id)" class="button is-danger">Eliminar</button></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </section>
                        </div>
                    </div>
                    <div class="column" v-if="importacionRender">

                    </div>
                    <div v-if="renderNotificaciones">
                        <div class="section">
                            <section>

                            </section>
                        </div>
                    </div>
                    <div v-if="renderReportes">
                        <div class="section">
                            <section>

                            </section>
                        </div>
                    </div>
                    <div v-if="renderImportar">
                        <div class="section">
                            <section>

                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        data: function(){
            return{
                renderUsers: true,
                renderImportar: false,
                renderNotificaciones: false,
                renderReportes: false,
                registroRender: true,
                listadoRender: false,
                importacionRender: false,
                usuario:{
                    names:'',
                    email:'',
                    password1:'',
                    password2:'',
                    tipo:'',
                },
                persona:{
                    names:'',
                    last:'',
                    age:'',
                    phone:'',
                    addr:'',
                    gender:'',
                },
                worker:{
                    rfc:'',
                    salary:'',
                },
                students:{
                  curp:''
                },
                renderForm:'',
                genders:[],
                roles:[],
                nUsers:0,
                nTch:0,
                nSt:0,
                usuarios:[],
                search:'',
            };
        },
        mounted(){
            this.registro();
            this.getNumS();
            this.getNumT();
            this.getNumU();
            this.$root.$on('usuarios',() => {
                this.renderUsers =true;
                renderImportar= false;
                renderNotificaciones=false;
                renderReportes= false;
            });
            this.$root.$on('notificaciones',() => {
                this.renderUsers =false;
                renderImportar= false;
                renderNotificaciones=true;
                renderReportes= false;
            });
            this.$root.$on('reportes',() => {
                this.renderUsers =false;
                renderImportar= false;
                renderNotificaciones=false;
                renderReportes= true;
            });
            this.$root.$on('importar',() => {
                this.renderUsers =false;
                renderImportar= true;
                renderNotificaciones=false;
                renderReportes= false;
            })
        },
        methods:{
            registro(){
                this.listadoRender = false;
                this.registroRender = true;
                this.importacionRender = false;
                this.getGenders();
                this.getRoles();
            },
            listado(){
                this.listadoRender = true;
                this.registroRender = false;
                this.importacionRender = false;
                this.limpiarReg();
                this.getAlumnosAll();
            },
            importacion(){
                this.listadoRender = false;
                this.registroRender = false;
                this.importacionRender = true;
            },
            getGenders(){
                axios.get('api/get_genders').then(response => {
                    this.genders = response.data;
                })
                    .catch(error => {
                        console.log(error.response)
                    });
            },
            getNumU(){
                axios.get('api/get_num_users').then(response => {
                    this.nUsers = response.data;
                })
                    .catch(error => {
                        console.log(error.response)
                    });
            },
            getNumT(){
                axios.get('api/get_num_tch').then(response => {
                    this.nTch = response.data;
                })
                    .catch(error => {
                        console.log(error.response)
                    });
            },
            getNumS(){
                axios.get('api/get_num_st').then(response => {
                    this.nSt = response.data;
                })
                    .catch(error => {
                        console.log(error.response)
                    });
            },
            getRoles(){
                axios.get('api/get_roles').then(response => {
                    this.roles = response.data;
                })
                    .catch(error => {
                        console.log(error.response)
                    });
            },
            getAlumnosAll(){
                axios.get('api/get_users_all').then(response => {
                    this.usuarios = response.data;
                })
                    .catch(error => {
                        console.log(error.response)
                    });
            },
            getUser(){
                if(this.search === ''){
                    this.getAlumnosAll();
                }else{
                    axios.post('api/get_user',{
                        mail:this.search
                    }).then(response => {
                        this.usuarios = response.data;
                    })
                        .catch(error => {
                            console.log(error.response)
                        });
                }
            },
            deleteU(id){
                axios.post('api/delete_user',{
                    id:id
                }).then(response => {
                    this.getAlumnosAll();
                    this.getNumS();
                    this.getNumT();
                    this.getNumU();
                })
                .catch(error => {
                    console.log(error.response)
                });
            },
            limpiarReg(){
                this.usuario.names = '';
                this.usuario.email = '';
                this.usuario.password1 = '';
                this.usuario.password2 = '';
                this.usuario.tipo = '';
                this.persona.names = '';
                this.persona.last = '';
                this.persona.addr = '';
                this.persona.age = '';
                this.persona.gender = '';
                this.persona.phone = '';
                this.students.curp = '';
                this.worker.rfc = '';
                this.worker.salary = 0;
                this.renderForm = '';
            },
            postUser(){
                if(this.usuario.tipo.name === 'alumno'){
                    axios.post('api/post_user',{
                        name_user:this.usuario.names,
                        email:this.usuario.email,
                        pass:this.usuario.password1,
                        rol:this.usuario.tipo.name,
                        p_name:this.persona.names,
                        p_last: this.persona.last,
                        age:this.persona.age,
                        add:this.persona.addr,
                        phone:this.persona.phone,
                        gen:this.persona.gender,
                        curp:this.students.curp
                    }).then(response => {
                        this.limpiarReg();
                    })
                        .catch(error => {
                            console.log(error.response)
                        });
                }
                else{
                    axios.post('api/post_user',{
                        name_user:this.usuario.names,
                        email:this.usuario.email,
                        pass:this.usuario.password1,
                        rol:this.usuario.tipo.name,
                        p_name:this.persona.names,
                        p_last: this.persona.last,
                        age:this.persona.age,
                        add:this.persona.addr,
                        phone:this.persona.phone,
                        gen:this.persona.gender,
                        rfc:this.worker.rfc,
                        sal:this.worker.salary
                    }).then(response => {
                        this.limpiarReg();
                    })
                        .catch(error => {
                            console.log(error.response)
                        });
                }
            }
        },
        watch:{
            "usuario.tipo.name": function(){
                switch(this.usuario.tipo.name){
                    case 'admin':
                        this.renderForm = 'admin';
                        break;
                    case 'alumno':
                        this.renderForm = 'alumno';
                        break;
                    case 'directivo':
                        this.renderForm = 'directivo';
                        break;
                    case 'profesor':
                        this.renderForm = 'profesor';
                        break;
                    case 'administrativo':
                        this.renderForm = 'administrativo';
                        break;
                }
            }
        }

    }
</script>