<template>
  <div>
    <ul class="stock-container">
      <li v-for="stock in stocks" :key="stock.id">
        <app-stock :stock="stock"></app-stock>
      </li>
    </ul>
  </div>
</template>

<script>
  import { mapGetters } from 'vuex'
  import Stock from './Stock.vue'

  export default {
    computed: {
      ...mapGetters([
        'stocks'
      ])
    },
    components: {
      'app-stock': Stock
    }
  }
</script>

<style lang="scss">
  .stock-container{
    margin: 2%;  
    list-style: none;
    margin: auto;

    li{
      width: 48%;
      float: left;
      margin-right: 10px;
      margin-left: 10px;
      margin-bottom: 20px;
    }
  }
</style>
