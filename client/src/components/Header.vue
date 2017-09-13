<template>
  <div>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <router-link :to="{name: 'Home'}" class="navbar-brand">Stock Trader</router-link>

    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <router-link tag="li" :to="{name: 'UserStocks'}"><a>Portfolio</a></router-link>
        <router-link tag="li" :to="{name: 'Stocks'}" ><a>Stocks</a></router-link>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#" @click="endDay">End Day</a></li>
        <!-- <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Save And Load <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Save Data</a></li>
             <li role="separator" class="divider"></li>
            <li><a href="#">Load Data</a></li>
          </ul>
        </li> -->
        <li><a href="#">Funds: ${{getFunds}}</a></li>
        <router-link v-if="!loggedInStatus" tag="li" :to="{name: 'Login'}"><a>Login</a></router-link>
        <li v-else @click="logout"><a>Logout</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>    
  </div>
</template>

<script>
  import { mapGetters, mapActions, mapMutations } from 'vuex'

  export default {
    computed: {
      ...mapGetters([
        'getFunds',
        'loggedInStatus'
      ])
    },
    methods: {
      ...mapActions([
        'endDay'
      ]),
      ...mapMutations([
        'loggedOut'
      ]),
      logout () {
        localStorage.removeItem('token')
        this.loggedOut()
        this.$router.push({path: '/'})
      }
    }
  }
</script>

<style>

</style>
