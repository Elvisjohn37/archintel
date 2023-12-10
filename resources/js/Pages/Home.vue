<script setup>
import { ref, onMounted } from 'vue'

import styles from './Home.module.scss'
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
    <div :class="styles.home">
        <h1>Dashboard</h1>
        <div :class="styles.dashboardContent">
            <div :class="styles.articleContainer" v-for="article in articles">
                <div :class="styles.heading">
                    <div :class="styles.image">
                        <img
                            src="https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png"
                        />
                    </div>
                    <div :class="styles.info">
                        <div :class="styles.title">{{ article.title }}</div>
                        <div :class="styles.company">{{ article.company }}</div>
                        <div :class="styles.writer">{{ article.writer }}</div>
                        <div :class="styles.editor">{{ `${article.firstname} ${article.lastname}` }}</div>
                        <div :class="styles.status">{{ article.status ? 'Published' : 'For Edit' }}</div>
                        <a :href="article.link" target="_blank">View More</a>
                    </div>
                </div>
                <div :class="styles.content">{{ article.content }}</div>
            </div>
        </div>
    </div>
</template>
