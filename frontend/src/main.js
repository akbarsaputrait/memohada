import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './registerServiceWorker'
import './assets/colors.css'
/* eslint-disable */
import '@ionic/core/css/core.css'
import '@ionic/core/css/ionic.bundle.css'
import IonicVue from '@ionic/vue'

import axios from 'axios'

const moment = require('moment')
require('moment/locale/id')

Vue.use(require('vue-moment'), {
  moment
})

Vue.use(IonicVue)
Vue.config.productionTip = false

Vue.prototype.$http = axios;
const token = localStorage.getItem('token')
if (token) {
  Vue.prototype.$http.defaults.headers.common['Authorization'] = 'Bearer ' + token
}
axios.defaults.baseURL = 'http://localhost/memohada/backend/public/api';

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')