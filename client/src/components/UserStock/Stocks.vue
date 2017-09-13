<template>
  <div>
    <ul class="stock-container">
      <template v-if="userStocks.length > 0">
        <li v-for="stock in userStocks" :key="stock.id">
          <app-stock :stock="stockWithId(stock.id)" :currentQuantity="stock.quantity"></app-stock>
        </li>
      </template>
      <template v-else>
        <div class="alert alert-danger text-center" role="alert"><h3>Get Some Stock</h3></div>
      </template>
    </ul>
  </div>
</template>

<script>
  import { mapGetters } from 'vuex'
  import Stock from './Stock.vue'

  export default {
    computed: {
      ...mapGetters([
        'userStocks',
        'stockWithId'
      ])
    },
    components: {
      'app-stock': Stock
    }
  }
</script>

<style lang="scss">
</style>
