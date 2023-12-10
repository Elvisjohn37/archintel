
// import './bootstrap'
import '../css/app.css'

import { createApp } from 'vue'
import router from './router.js'
import { createPinia } from 'pinia'
import App from './App.vue'

const pinia = createPinia()

const appName = import.meta.env.VITE_APP_NAME || 'Laravel'

createApp(App).use(router).use(pinia).mount('#app')
