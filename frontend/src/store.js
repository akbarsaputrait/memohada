import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    status: '',
    token: localStorage.getItem('token') || '',
    user: {},
    loading: false,
    todos: []
  },
  mutations: {
    change_token(state, token) {
      state.token = token
      state.status = 'success'
    },
    user(state, user) {
      state.user = user
      state.status = 'success'
    },
    error(state) {
      state.status = 'error'
    },
    isLoading(state, loading) {
      state.loading = loading
    },
    logout(state) {
      state.status = ''
      state.token = ''
      state.user = {}
    },
    todos(state, todos) {
      state.todos = todos
    }
  },
  actions: {
    user({commit, state}) {
      commit('isLoading', true)
      return new Promise((resolve, reject) => {
        axios.get('/user', {
          params: {
            token: state.token
          }
        }).then((response) => {
          // if(response.data.success) {
          //   commit('user', response.data)
          // }
          commit('isLoading', false)
          resolve(response)
        })
        .catch((error) => {
          commit('isLoading', false)
          commit('error')
          reject(error)
        })
      })
    },
    login({commit, dispatch}, payload) {
      commit('isLoading', true)
      return new Promise((resolve, reject) => {
        axios.post('/auth/login', {
          email: payload.email,
          password: payload.password
        }).then((response) => {
          if(response.data.success) {
            const token = response.data.access_token
            localStorage.setItem('token', token)
            commit('change_token', token)
            dispatch('todos')
            dispatch('user')
          }
          commit('isLoading', false)
          resolve(response)
        })
        .catch((error) => {
          localStorage.removeItem('token')
          commit('isLoading', false)
          commit('error')
          reject(error)
        })
      })
    },
    register({commit}, payload) {
      commit('isLoading', true)
      return new Promise((resolve, reject) => {
        axios.post('/auth/register', {
          first_name: payload.first_name,
          last_name: payload.last_name,
          email: payload.email,
          password: payload.password,
          password_confirmation: payload.password_confirmation,
        }).then((response) => {
          commit('isLoading', false)
          resolve(response)
        })
        .catch((error) => {
          commit('isLoading', false)
          commit('error')
          reject(error)
        })
      })
    },
    logout({commit}) {
      commit('isLoading', true)
      return new Promise((resolve, reject) => {
        axios.get('/auth/logout', {
          params: {
            token: localStorage.getItem('token')
          }
        }).then((response) => {
          if(response.data.success) {
            commit('logout')
            localStorage.removeItem('token')
          }
          commit('isLoading', false)
          resolve(response)
        }).catch((error) => {
          commit('isLoading', false)
          reject(error)
        })
      })
    },
    todos({commit, state}) {
      commit('isLoading', true)
      return new Promise((resolve, reject) => {
        axios.get('/todo', {
          params: {
            token: state.token
          }
        })
        .then((response) => {
          const todos = response.data.data
          commit('todos', todos)
          commit('isLoading', false)
          resolve(response)
        })
        .catch((error) => {
          commit('isLoading', false)
          reject(error)
        })
      })
    }
  },
  getters: {
    isLogin: state => !!state.token,
    authStatus: state => state.status,
    user: state => state.user,
    loading: state => state.loading,
    todos: state => state.todos
  },
})
