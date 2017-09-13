<template>
  <div id="login">
    <form>
      <div class="form-group">
        <label for="username">User Name</label>
        <input type="text" v-model="user.username" class="form-control" id="username" placeholder="Username">
      </div>
      <div class="form-group">
        <label for="InputPassword">Password</label>
        <input type="password" v-model="user.password" class="form-control" id="InputPassword" placeholder="Password">
      </div>  
      <a class="btn btn-success" @click="login">Login</a> 
      <div v-if="errors" class="alert alert-danger" style="margin-top: 20px">
        <p>{{errors}}</p>
      </div>

    </form>
  </div>
</template>

<script>
import { mapMutations } from 'vuex'

export default {

  data () {
    return {
      user: {
        username: '',
        password: ''
      },
      errors: null
    }
  },
  methods: {
    ...mapMutations([
      'loggedIn'
    ]),
    login () {
      this.$http.post('http://localhost:4000/api/login', {username: this.user.username, password: this.user.password})
          .then(response => {
            return response.json()
          }
          , error => {
            this.errors = error.body.errors[0].detail
            throw new Error('Router Error')
          })
          .then(data => {
            localStorage.setItem('token', data.token)
            this.loggedIn()
            this.$router.push({path: '/'})
          })
          .catch(e => console.log(e))
    }
  },
  computed: {
    haveError () {
      return this.errors.length > 0
    }
  }
}
</script>

<style>
#login{
  margin-left: 35%;
  margin-right: 35%;
}

</style>
