<template>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h3>Informacion para el usuario: {{email}}</h3>
                <h4>{{role}}</h4>
            </div>
            <div class="card-body">
                <form>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">Nombre</label>
                            <input type="tetxt" maxlength="50" v-model="person.name" class="form-control" id="inputEmail4" placeholder="Nombre(s)">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputPassword4">Apellidos</label>
                            <input type="tetx" maxlength="60" v-model="person.last_name" class="form-control" id="inputPassword4" placeholder="Apellidos">
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="inputAddress">Direccion</label>
                        <input type="text" class="form-control" v-model="person.address" id="inputAddress" placeholder="1234 Calle, Colonioa">
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="input4">Numero Telefonico</label>
                            <input type="text" maxlength="10" v-model="person.phone" placeholder="7224278963">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="input5">Edad</label>
                            <input type="number" max="65" min="12" v-model="person.age" placeholder="18">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="select">Genero</label>
                            <select class="custom-select" name="genders" id="select" v-model="person.its_gender">
                                <option selected disabled>Selecciona tu genero</option>
                                <option v-for="item in genders" :key="item.key" :value="item.key">{{item.nombre}}</option>
                            </select>
                        </div>
                    </div>
                    <button type="button" class="btn btn-outline-primary">Registrar Informacion</button>
                </form>
                <form v-if="role === 'profesor'">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="rfc">RFC</label>
                            <input type="tetxt" maxlength="50" v-model="profesor.rfc" class="form-control" id="rfc" placeholder="RFC">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="salario">Salrio</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">$</span>
                                </div>
                            </div>
                            <input type="number" v-model="profesor.salario" min="4000" max="100000" class="form-control" id="salario" placeholder="4000">
                            <div class="input-group-append">
                                <span class="input-group-text">.00</span>
                            </div>
                        </div>
                    </div>
                </form>
                <form v-if="role === 'alumno'">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="curp">CURP</label>
                            <input type="text" maxlength="18" minlength="18" v-model="estudiante.curp" class="form-control" id="curp" placeholder="curp">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="salario">Matricula</label>
                            <div class="input-group mb-3">
                                <div class="input-group- mb-3">
                                    <button class="btn btn-outline-secondary" type="button">
                                        Generar matricula
                                    </button>
                                </div>
                                <input type="text" v-model="estudiante.mat" disabled class="form-control" id="salario" placeholder="Matricula">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props: ['role', 'user', 'email'],
    data(){
        return{
           genders: [],
           person:{
               name: '',
               last_name:'',
               age: 18,
               address:'',
               phone: '',
               its_gender: ''
           },
           profesor:{
               rfc:'',
               salario: '4000',
           },
           estudiante:{
               curp: '',
               mat: '',
           }
        }
    },
    methods:{
        getGenders(){
            this.$http.get('/get_genders').then(response => {
                this.genders = response.body;
            }, response => { 
                    console.log(response); 
            });
        },
        makeMat(){
            alert(estudiante.rfc);
        }
    },
    mounted(){
        this.getGenders();
    }
}
</script>
