import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import Stocks from '@/components/Stock/Stocks.vue'
import Login from '@/components/Login'
import UserStocks from '@/components/UserStock/Stocks.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/stocks',
      name: 'Stocks',
      component: Stocks
    },
    {
      path: '/userStocks',
      name: 'UserStocks',
      component: UserStocks
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    }
  ],
  mode: 'history'
})
