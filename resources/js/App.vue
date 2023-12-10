<template>
    <div v-if="isMountComponent" :class="styles.app">
        <MainNavigation />
        <div :class="styles.mainContent">
            <SideBarMenu
                :class="sideBarMenu"
                v-if="userInfo?.isLogin"
            /><RouterView />
        </div>
        <MainFooter />
    </div>
</template>

<script setup>
import { RouterView } from 'vue-router'
import MainNavigation from './components/MainNavigation.vue'
import MainFooter from './components/MainFooter.vue'
import styles from './App.module.scss'
import axios from 'axios'
import storeUser from './../store/user.js'
import { ref } from 'vue'
import SideBarMenu from './components/SideBarMenu.vue'

const isMountComponent = ref(false)

const user = storeUser()

const userInfo = JSON.parse(localStorage.getItem('userInfo'))

axios
    .get('/getuserdata')
    .then((response) => {
        const { data } = response

        if (data.isLogin) {
            !userInfo?.isLogin &&
                localStorage.setItem(
                    'userInfo',
                    JSON.stringify({
                        isLogin: data.isLogin,
                        firstname: data.firstname,
                        lastname: data.lastname,
                        userType: data.type,
                        status: data.status,
                    })
                )
        } else {
            userInfo?.isLogin && localStorage.removeItem('userInfo')
        }
        isMountComponent.value = true
    })
    .catch((response) => {})
    .finally()
</script>
