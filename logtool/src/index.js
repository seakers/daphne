import Vue from 'vue'
import vuetify from './plugins/vuetify'
import App from './App'

Vue.config.productionTip = false;

let app = new Vue({
  el: '#app',
  vuetify,
  render: h => h(App),
  components: { App }
}).$mount('#app');
