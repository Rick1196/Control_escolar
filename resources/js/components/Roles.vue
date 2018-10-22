<template>
    <div class="input-group col-mb-6">
        <div class="input-group-append">
            <label class="input-group-text" for="inputGroupSelect02">Roles</label>
        </div>
        <select class="custom-select" name="rol" id="rol">
            <option value="0">Uno</option>
            <option v-for="rol in roles">{{rol.name}}</option>
        </select>
    </div>
</template>
<script>
    export default{
        data (){
            return{
                roles:[],
                selected: null,
            }
        },
        methods:{
            get_materias(clave){
                this.$http.get('/roles').then(response => {
                    this.roles = response.body;
                    console.log(response.body);
                }, response => { 
                        console.log(response); 
                });
            },
        },
        mounted() {
            this.get_materias();
        }
    }
</script>