<template>
    <div>
        <div class="notification is-success" v-if="errores">
            <button class="delete" v-on:click="clearErr"></button>
            <strong>{{mensajes}}</strong>
        </div>
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
                                <div class="field">
                                    <div class="control">
                                        <div class="control">
                                            <p>Tipo de usuario</p>
                                        </div>
                                        <div class="select is-primary">
                                            <select v-model="buscados" v-on:change="getUsers()">
                                                <option :value="'todos'">Todos</option>
                                                <option  v-for="rol in roles" :value="rol.name" :key="rol.id">{{rol.description}}</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                            </section>
                            <section style="overflow-y: scroll; max-height: 400px;">
                                <center>
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
                                </center>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="column" v-if="importacionRender">

        </div>
        <div v-if="renderNotificaciones">
            <div class="section">
                <section>  
                    <div class="field">
                        <label class="label">Titulo</label>
                        <div class="control">
                            <input class="input" v-model="notificacion.titulo" type="text" placeholder="Titulo de la notificacion">
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Cuerpo de la notificacion</label>
                        <div class="control">
                            <textarea class="textarea" v-model="notificacion.texto" placeholder="Cuerpo de la notificacion"></textarea>
                        </div>
                    </div>
                    <div class="field is-grouped">
                    <div class="control">
                        <button class="button is-link" v-on:click="postNotificacion">Registrar</button>
                    </div>
                    <div class="control">
                        <button class="button is-text" v-on:click="clearNot">Cancelar</button>
                    </div>
                    </div>
                </section>
            </div>
            <div class="section">
                <section style="overflow-y: scroll; max-height: 400px;">
                    <center>
                        <table class="table" style="with: 100vh">
                            <thead>
                                <th><abbr title="Numero">#</abbr></th>
                                <th><abbr title="Titulo">Titulo</abbr></th>
                                <th><abbr title="Texto">Texto</abbr></th>
                                <th><abbr title="Acciones">Acciones</abbr></th>
                            </thead>
                            <tbody>
                                <tr v-for="(not,num) in notificaciones">
                                    <th>{{num}}</th>
                                    <td><input class="input" type="text"  v-model="not.titulo"></td>
                                    <td><input class="textarea" type="text"  v-model="not.texto" ></td>
                                    <td>
                                        <button class="button is-link is-rounded" v-on:click="upDateNot(not.titulo,not.texto)">Actualizar</button>
                                        <button class="button is-danger is-rounded" v-on:click="delNot(not.id)">Eliminar</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </center>
                </section>
            </div>
        </div>
        <div v-if="renderReportes">
            <div class="section">
                <section>
                    <div class="field is-horizontal">
                        <div class="field-label is-normal">
                            <label class="label">Rango de edades</label>
                        </div>
                        <div class="field-body">
                            <div class="field">
                                <p class="control">
                                    <div class="select is-fullwidth">
                                        <select v-model="reporteUsrs.edad1">
                                            <option v-for="i in 100" :key="i" :value="i">{{i}}</option>
                                        </select>
                                    </div>
                                </p>
                            </div>
                            <div class="field">
                                <p class="control">
                                    <div class="select is-fullwidth">
                                        <select v-model="reporteUsrs.edad2">
                                            <option v-for="i in 100" :key="i" :value="i">{{i}}</option>
                                        </select>
                                    </div>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="field is-horizontal">
                        <div class="field-label is-normal">
                            <label class="label">Tipo de usuario</label>
                        </div>
                        <div class="field-body">
                            <div class="field">
                                <p class="control">
                                    <div class="select is-fullwidth">
                                        <select v-model="reporteUsrs.rol">
                                            <option v-for="rol in roles" :key="rol.name" :value="rol.name">{{rol.description}}</option>
                                        </select>
                                    </div>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="field is-horizontal">
                        <div class="field-label is-normal">
                            <label class="label">Genero</label>
                        </div>
                        <div class="field-body">
                            <div class="field">
                                <p class="control">
                                    <div class="select is-fullwidth">
                                        <select v-model="reporteUsrs.gen">
                                            <option v-for="gen in genders" :key="gen.id" :value="gen.id">{{gen.nombre}}</option>
                                        </select>
                                    </div>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="field is-horizontal">
                        <div class="field-label">
                            <label>Rango de salarios</label>
                        </div>
                        <div class="field-body">
                            <div class="field is-expanded">
                                <div class="field has-addons">
                                    <p class="control">
                                    <a class="button is-static">
                                        $
                                    </a>
                                    </p>
                                    <p class="control is-expanded">
                                    <input v-model="reporteUsrs.sal1" class="input" type="number" placeholder="Salario">
                                    </p>
                                </div>
                                <div class="field has-addons">
                                    <p class="control">
                                    <a class="button is-static">
                                        $
                                    </a>
                                    </p>
                                    <p class="control is-expanded">
                                    <input class="input"  v-model="reporteUsrs.sal2" type="number" placeholder="Salario">
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="field is-horizontal">
                    <div class="field-label">
                        <!-- Left empty for spacing -->
                    </div>
                    <div class="field-body">
                        <div class="field">
                        <div class="control">
                            <button class="button is-primary">
                            Buscar
                            </button>
                        </div>
                        </div>
                    </div>
                    </div>
                </section>
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
                buscados:'',
                mensajes:'',
                errores: false,
                notificaciones:[],
                notificacion:{
                    titulo:'',
                    texto:'',
                },
                reporteUsrs:{
                    edad1:'',
                    edad2:'',
                    rol:'',
                    gen:'',
                    sal1:'',
                    sla2:'',
                }
            };
        },
        mounted(){
            this.registro();
            this.getNumS();
            this.getNumT();
            this.getNumU();
            this.$root.$on('usuarios',() => {
                this.renderUsers =true;
                this.renderImportar= false;
                this.renderNotificaciones=false;
                this.renderReportes= false;
            });
            this.$root.$on('notificaciones',() => {
                this.renderUsers =false;
                this.renderImportar= false;
                this.renderNotificaciones=true;
                this.renderReportes= false;
                this.getNotificaciones();
            });
            this.$root.$on('reportes',() => {
                this.renderUsers =false;
                this.renderImportar= false;
                this.renderNotificaciones=false;
                this.renderReportes= true;
            });
            this.$root.$on('importar',() => {
                this.renderUsers =false;
                this.renderImportar= true;
                this.renderNotificaciones=false;
                this.renderReportes= false;
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
                this.getRoles();
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
            getUsers(){
                axios.post('api/get_users',{
                    tipo:this.buscados
                }).then(response => {
                    this.usuarios = response.data;
                    console.log(response);
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
            getNotificaciones(){
                axios.get('api/get_notificaciones').then(response => {
                    this.notificaciones = response.data;
                }).catch(error => {
                        console.log(error.response)
                });
            },
            deleteU(id){
                axios.post('api/delete_user',{
                    id:id
                }).then(response => {
                    this.getAlumnosAll();
                    this.getNumS();
                    this.getNumT();
                    this.getNumU();
                    this.mensajes = 'Usuario eliminado';
                    this.errores = true;
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
                        this.getNumS();
                        this.getNumT();
                        this.getNumU();
                        this.mensajes = 'Registro exitoso';
                        this.errores = true;
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
                        this.getNumS();
                        this.getNumT();
                        this.getNumU();
                        this.mensajes = 'Registro exitoso';
                        this.errores = true;
                    })
                        .catch(error => {
                            console.log(error.response)
                        });
                }
            },
            clearErr(){
                this.mensajes = '';
                this.errores = false;
            },
            postNotificacion(){
                axios.post('api/post_notificacion',{
                        titulo:this.notificacion.titulo,
                        texto:this.notificacion.texto
                    }).then(response => {
                        this.errores = true;
                        this.mensajes = 'Notificacion registrada';
                        this.getNotificaciones();
                    }).catch(error => {
                            console.log(error.response)
                    });
            },
            clearNot(){
                this.notificacion.titulo = '';
                this.notificacion.texto = '';
            },
            upDateNot(titulo,texto){
                axios.post('api/put_notificacion',{
                        titulo:titulo,
                        texto:texto
                    }).then(response => {
                        this.errores = true;
                        this.mensajes = 'Notificacion actualizada';
                        this.getNotificaciones();
                    }).catch(error => {
                            console.log(error.response)
                    });
            },
            delNot(id){
                axios.post('api/delete_notificacion',{
                        id:id
                    }).then(response => {
                        this.errores = true;
                        this.mensajes = 'Notificacion eliminada';
                        this.getNotificaciones();
                    }).catch(error => {
                            console.log(error.response)
                    });
            },

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