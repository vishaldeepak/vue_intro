<template>
  <div id="app">
    <app-header></app-header>
    <transition name="slide" mode="out-in"> 
      <router-view></router-view>
    </transition>
  </div>
</template>

<script>
  import Header from './components/Header.vue'

  export default {
    name: 'app',
    components: {
      'app-header': Header
    }
  }
</script>

<style scoped>
  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    margin-top: 40px;
    margin-left: 70px;
    margin-right: 70px;
  }

    .slide-enter{
        /*  */
        opacity: 0;
    }

    .slide-enter-active{
        animation: slide-in 0.5s ease-out forwards;
        transition: opacity 0.5s;
    }

    .slide-leave{
        
    }

    .slide-leave-active{
        animation: slide-out 0.5s ease-out forwards;
        opacity: 0;
        transition: opacity 0.5s;
    }    

    @keyframes slide-in {
        from {
            transform: translateY(50px);
        }
        to {
            transform: translateY(0);
        }
    }

    @keyframes slide-out {
        from {
            transform: translateY(0)
        }
        to {
            transform: translateY(50px)
        }
    }    
</style>
