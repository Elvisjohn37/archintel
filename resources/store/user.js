import { defineStore } from 'pinia'

const storeUser = defineStore('user', {
    state: () => ({
        userInfo: {
            isLogin: false,
        }
    }),
    actions: {
        logout() {
            this.userInfo = { isLogin: false };
        },
        setUserInfo(userInfo) {
            this.userInfo.isLogin = userInfo.isLogin
            this.userInfo.firstname = userInfo.firstname
            this.userInfo.lastname = userInfo.lastname
            this.userInfo.status = userInfo.status
            this.userInfo.userType = userInfo.userType
        },
    },
    getters: {
        getUserInfo(state) {
            return state.userInfo
        }
    },
})

export default storeUser
