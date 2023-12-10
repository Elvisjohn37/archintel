import { createRouter, createWebHistory } from 'vue-router'
import storeUser from './../store/user'

const userInfo = JSON.parse(localStorage.getItem('userInfo'))

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        {
            path: '/',
            name: 'landing',
            component: () =>
                import(`./Pages/${userInfo?.isLogin ? 'Home' : 'Login'}.vue`),
        },
        {
            path: '/createarticle',
            name: 'createarticle',
            component: () => import('./Pages/CreateArticle.vue'),
            redirect: !userInfo?.isLogin ? { name: 'landing' } : null,
        },
        {
            path: '/allmedia',
            name: 'allmedia',
            component: () => import('./Pages/AllMedia.vue'),
            redirect: !userInfo?.isLogin ? { name: 'landing' } : null,
        },
        {
            path: '/:catchAll(.*)*',
            component: () => import('./Pages/PageNotFound.vue'),
        },
    ],
})

export default router
