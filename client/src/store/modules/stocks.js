const state = {
  stocks: [
    {id: 0, name: 'BMW', price: 10},
    {id: 1, name: 'Google', price: 5.53},
    {id: 2, name: 'Apple', price: 9.3},
    {id: 3, name: 'Twitter', price: 7.34}
  ],
  userStocks: []
}

const getters = {
  stocks: state => {
    return state.stocks
  },
  userStocks: state => {
    return state.userStocks
  },
  stockWithId: (state, getters) => (id) => {
    return state.stocks.find(stock => stock.id === id)
  },
  userStockWithId: (state, getters) => (id) => {
    return state.userStocks.find(stock => stock.id === id)
  },
  userStockIndexWithId: (state, getters) => (id) => {
    return state.userStocks.findIndex(stock => stock.id === id)
  }
}

const mutations = {
  changeStockPrice: (state, payload) => {
    state.stocks[payload.id].price += payload.variation
  },
  setNewStock: (state, payload) => {
    state.userStocks.push({id: payload.id, quantity: payload.quantity})
  },
  addToStock: (state, payload) => {
    state.userStocks[payload.id].quantity += payload.quantity
  },
  removeFromStock: (state, payload) => {
    state.userStocks[payload.id].quantity -= payload.quantity
    if (state.userStocks[payload.id].quantity === 0) {
      state.userStocks.splice(payload.id, 1)
    }
  }
}

const actions = {
  endDay: ({commit, state}) => {
    state.stocks.forEach(function (element, i) {
      var randomBoolean = Math.random() >= 0.5
      var variation = parseFloat((Math.random() * 10).toFixed(2))
      var cal = (variation / 100) * (element.price)
      if (randomBoolean) {
        cal = -cal
      }
      commit('changeStockPrice', {id: i, variation: cal})
    })
  },
  buyStock: (context, payload) => {
    let stock = context.getters.stockWithId(payload.id)
    let totalPrice = stock.price * payload.quantity
    let userStock = context.getters.userStockWithId(payload.id)
    if (userStock) {
      context.commit('addToStock', {id: userStock.id, quantity: payload.quantity})
    } else {
      context.commit('setNewStock', {id: payload.id, quantity: payload.quantity})
    }

    context.commit('setFunds', -totalPrice)
    console.log(state.userStocks)
    state.funds -= totalPrice
  },
  sellStock: (context, payload) => {
    let stock = context.getters.stockWithId(payload.id)
    let totalPrice = stock.price * payload.quantity
    let userStockId = context.getters.userStockIndexWithId(payload.id)

    context.commit('removeFromStock', {id: userStockId, quantity: payload.quantity})
    context.commit('setFunds', totalPrice)
  }
}

export default {
  state,
  getters,
  mutations,
  actions
}
