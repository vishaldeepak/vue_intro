<template>
   <div class="jumbotron">
     <h2>Trade or View Your Portfolio</h2>
     <p>You may save or load your data</p>
     <p>Click on 'End Day' to begin a new day</p>
     <hr>
     <h3>Your Funds is: ${{getFunds}}</h3>
   </div>
</template>

<script>
  import { mapGetters } from 'vuex'

  export default {
    computed: {
      ...mapGetters([
        'getFunds'
      ])
    }
  }
</script>

<style scoped>
  .jumbotron {
    text-align: left;
    padding: 20px;
  }
</style>
