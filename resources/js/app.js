
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');
window.Vue = require('vue');
var jsPDF = require('jspdf');
require('jspdf-autotable');


/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

Vue.component('example-component', require('./components/ExampleComponent.vue'));

Vue.component('roles-component', require('./components/RolesGetData.vue'));
Vue.component('nav-slider-adm', require('./components/NavAdmn.vue'));
Vue.component('adm-view', require('./components/AdmView.vue'));
Vue.component('nav-slider-dir',require('./components/NavDirec.vue'));
Vue.component('direc-view',require('./components/DirecView.vue'));
Vue.component('main-view',require('./components/MainView.vue'));
Vue.component('nav-slider-prof',require('./components/NavProf.vue'));
Vue.component('prof-view',require('./components/ProfView.vue'));
Vue.component('std-view',require('./components/StdView.vue'));
Vue.component('nav-slider-std',require('./components/NavStd.vue'));
const app = new Vue({
    el: '#app'
});


// Bulma NavBar Burger Script
document.addEventListener('DOMContentLoaded', function () {

    // Get all "navbar-burger" elements
    const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);
    var bulmaCarousel = require('bulma-extensions/bulma-carousel/dist/js/bulma-carousel');
    bulmaCarousel.attach();
    // Check if there are any navbar burgers
    if ($navbarBurgers.length > 0) {
        
        // Add a click event on each of them
        $navbarBurgers.forEach(function ($el) {
            $el.addEventListener('click', function () {
                
                // Get the target from the "data-target" attribute
                let target = $el.dataset.target;
                let $target = document.getElementById(target);
                
                // Toggle the class on both the "navbar-burger" and the "navbar-menu"
                $el.classList.toggle('is-active');
                $target.classList.toggle('is-active');
                
            });
        });
    }
    
});



require('./bulma-extensions');
