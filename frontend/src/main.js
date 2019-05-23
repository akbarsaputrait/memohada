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

Vue.use(IonicVue)

Vue.prototype.$http = axios

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
