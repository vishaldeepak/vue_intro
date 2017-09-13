import Vue from 'vue'
import Vuex from 'vuex'

import stocks from './modules/stocks.js'

Vue.use(Vuex)

// We may add required state, getters, etc into here or another module as defined
// in counter.js
export const store = new Vuex.Store({
  state: {
    funds: 500.00,
    logged_in: !!localStorage.getItem('token')
  },
  getters: {
    getFunds: state => {
      return (state.funds).toFixed(2)
    },
    loggedInStatus: state => {
      return state.logged_in
    }
  },
  mutations: {
    setFunds: (state, payload) => {
      state.funds += payload
    },
    loggedIn: state => {
      state.logged_in = true
    },
    loggedOut: state => {
      state.logged_in = false
    }
  },
  actions: {

  },
  modules: {
    stocks
  }
})
