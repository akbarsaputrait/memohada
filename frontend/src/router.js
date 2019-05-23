import Vue from 'vue'
import Router from 'vue-router'
import Login from './views/Login.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'login',
      component: Login
    },
    {
      path: '/register',
      name: 'register',
      component: () => import('./views/Register.vue')
    },
    {
      path: '/todo',
      name: 'todo',
      component: () => import('./views/Todo.vue')
    },
    {
      path: '/profile',
      name: 'profile',
      component: () => import('./views/Profile.vue')
    }
  ]
})
