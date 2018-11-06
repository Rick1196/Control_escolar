<template>
    <div>
        <form>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <button class="btn btn-outline-secondary" type="button" v-on:click="getGroupDescription()" id="button-addon1">Buscar</button>
                </div>
                <input type="text" class="form-control" placeholder=""  v-model="identifier" aria-label="Example text with button addon" aria-describedby="button-addon1">
                </div>
                <div style="overflow-y:scroll; height:30vh;"> 
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">GRUPO</th>
                                <th scope="col">MATERIA</th>
                                <th scope="col">PROFESOR</th>
                                <th scope="col">POBLACION</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="group in groups">
                                <td>{{group.identifier}} </td>
                                <td>{{group.name}} </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
        </form>
    </div>
</template>
<script>
export default {
    data: function(){ 
        return{
            groups: [],
            identifier: '',
        };
    },
    methods:{
        getGroupsDescription(){
            this.$http.get('/groups_full_description').then(response => {
                this.groups = response.body;
            }, response => { 
                    console.log(response); 
            });
        },
        getGroupDescription(){
            if((this.identifier === '')){
                this.getGroupsDescription();
            }
            else{
                this.$http.get('/group_full_description/'+this.identifier).then(response => {
                    this.groups = response.body;
                }, response => { 
                        console.log(response); 
                });
            }
        }
    },
    created() {
        this.getGroupsDescription();
    },
}
</script>

