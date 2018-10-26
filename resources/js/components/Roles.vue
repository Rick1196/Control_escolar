<template>
    <div class="input-group col-mb-6">
        <div class="input-group-append">
            <label class="input-group-text" for="inputGroupSelect02">Roles</label>
        </div>
        <select class="custom-select" v-model="selected" name="rol" id="rol">
            <option v-for="rol in roles" v-bind:key="rol.id" v-bind:value="rol.id">{{rol.name}}</option>
        </select>
    </div>
</template>
<script>
    export default{
        data: function(){
            return {
                roles:[],
                selected: null,
            }
        },
        methods:{
            get_roles(clave){
                this.$http.get('/roles').then(response => {
                    this.roles = response.body;
                    console.log(this.roles);
                }, response => { 
                        console.log(response); 
                });
            },
        },
        created: function() {
            this.get_roles();
        }
    }
</script>