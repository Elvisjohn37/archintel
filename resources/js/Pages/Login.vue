<script setup>
import TextBox from '@/components/TextBox.vue'
import Button from '@/components/Button.vue'
import styles from './Login.module.scss'
import axios from 'axios'
import { ref } from 'vue'
import storeUser from './../../store/user.js'

const user = storeUser()

const username = ref('')
const password = ref('')

const handleLogin = () => {
    axios
        .post('/login', {
            username: username.value,
            password: password.value,
        })
        .then((response) => {
            const { data } = response
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
            if(data.isLogin) {

                location.reload()
            } else {
                alert("Invalid Username or Password");
            }
        })
        .catch((error) => {
            console.log(error)
        })
        .finally()
}

const handleUsername = (event) => {
    username.value = event.target.value
}

const handlePassword = (event) => {
    password.value = event.target.value
}
</script>

<template>
    <div :class="styles.login">
        <h2>Login</h2>
        <form @submit.prevent="handleLogin">
            <TextBox :change="handleUsername" label="Username:" />
            <TextBox
                :change="handlePassword"
                label="Password:"
                type="password"
            />
            <Button :class="styles.loginButton" label="Login" />
        </form>
    </div>
</template>
