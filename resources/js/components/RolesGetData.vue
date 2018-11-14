<template>

   <section>
       <input class="input is-rounded" type="text" >
   </section>
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
