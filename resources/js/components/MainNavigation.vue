<template>
    <div :class="styles.mainNavigation">
        <div :class="styles.brand">
            <img src="" />
        </div>
        <div :class="styles.options">
            <ul>
                <li>
                    <a v-if="userInfo?.isLogin" @click="handleLogout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</template>

<script setup>
import styles from './MainNavigation.module.scss'
import { RouterLink } from 'vue-router'
import storeUser from './../../store/user'
import axios from 'axios'

const user = storeUser()
const userInfo = JSON.parse(localStorage.getItem('userInfo'))

const handleLogout = () => {
    localStorage.removeItem('userInfo')
    axios
        .post('/logout')
        .then(() => {
            user.logout()
            location.reload()
        })
        .catch((error) => {
            console.log(error)
        })
        .finally(() => {})
}
</script>
