<template>
  <div>
    <ul>
      <li v-for="stock in stocks" :key="stock.id">
        <p>{{stock.name}} - {{stock.price}}</p>
      </li>
    </ul>
  </div>
</template>

<script>
  import { mapGetters } from 'vuex'

  export default {
    computed: {
      ...mapGetters([
        'stocks'
      ])
    }
  }
</script>

<style>

</style>
