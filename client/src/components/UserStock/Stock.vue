<template>
  <div class="stock">
    <div class="alert alert-info text-left" role="alert"><h4>{{stock.name}}</h4> (Price: {{stock.price.toFixed(2)}} | Quantity: {{currentQuantity}})</div>
    <div>
      <div class="text-input inline">
        <input type="text" class="form-control" v-model.number="quantity" placeholder="Quantity">
      </div>
      <div class="inline">
        <button class="btn btn-danger" @click="sell()">Sell</button>
      </div>
    </div>
  </div>
</template>

<script>
  import { mapActions } from 'vuex'

  export default {
    data () {
      return {
        quantity: null
      }
    },
    props: {
      stock: Object,
      currentQuantity: Number
    },
    methods: {
      ...mapActions([
        'sellStock'
      ]),
      sell () {
        if (this.quantity <= this.currentQuantity) {
          this.$store.dispatch('sellStock', {id: this.stock.id, quantity: this.quantity})
        }
      }
    }
  }
</script>

<style lang="scss">

</style>
