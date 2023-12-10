<script setup>
import { ref, onMounted } from 'vue'

import styles from './AllMedia.module.scss'
import axios from 'axios'

const articles = ref([])

onMounted(() => {
    axios
        .get('/getarticles')
        .then((response) => {
            articles.value = response.data
        })
        .catch(() => {})
        .finally()
})
</script>

<template>
    <div :class="styles.allMedia">
        <h1>Dashboard</h1>
        <div :class="styles.content">
            <table>
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Title</th>
                        <th>Link</th>
                        <th>Date</th>
                        <th>Writer Name</th>
                        <th>Editor Name</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="article in articles">
                        <td><img src="" /></td>
                        <td>{{ article.title }}</td>
                        <td>{{ article.link }}</td>
                        <td>{{ article.date }}</td>
                        <td>{{ article.firstname }}</td>
                        <td>{{ article.firstname }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>
