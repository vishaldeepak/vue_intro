<template>
  <div class="stock">
    <div class="alert alert-success text-left" role="alert"><h4>{{stock.name}}</h4> (Price: {{stock.price.toFixed(2)}})</div>
    <div>
      <div class="text-input inline">
        <input type="text" class="form-control" v-model.number="quantity" placeholder="Quantity">
      </div>
      <div class="inline">
        <button class="btn btn-success" @click="buyStock({id: stock.id, quantity: quantity})">Buy</button>
      </div>
    </div>
  </div>
</template>

<script>
  import { mapActions } from 'vuex'

  export default {
    data () {
      return {
        quantity: null,
        id: this.stock.id
      }
    },
    props: {
      stock: Object
    },
    methods: {
      ...mapActions([
        'buyStock'
      ])
    }
  }
</script>

<style lang="scss">
  .stock{
    border: 1px solid grey;
    border-radius: 5px;

    h4{
      margin-bottom: 0px;
      display: inline;
    }
    
    .text-input{
      margin-left: 15px;
      margin-bottom: 20px;
      width: 30%;
      text-align: left;
    }

    .inline{
      display: inline-block;
    }
  }

</style>
