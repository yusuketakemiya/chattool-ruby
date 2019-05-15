import Vue from 'vue'
import Router from 'vue-router'
import Sample from '../components/Sample'
import Login from '../components/Login'
import Main from '../components/Main'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Login',
      component: Login
      // name: 'Sample',
      // component: Sample
    },
    {
      path: '/main',
      name: 'Main',
      component: Main
    }
  ]
})
