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

import VeeValidate from 'vee-validate'
import VCalendar from 'v-calendar'
import axios from 'axios'

const moment = require('moment')
require('moment/locale/id')

Vue.use(VeeValidate, {
  classes: true,
  classNames: {
    valid: 'is-valid',
    invalid: 'is-invalid'
  }
});
Vue.use(require('vue-moment'), {
  moment
})

Vue.use(VCalendar, {
  componentPrefix: 'v',
  screens: {
    tablet: '576px',
    laptop: '992px',
    desktop: '1200px',
  },
});

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
