<script setup>
import styles from './SideBarMenu.module.scss'
import { RouterLink } from 'vue-router'
</script>

<template>
    <div :class="styles.sideBarMenu">
        <ul>
            <li>
                <RouterLink :class="styles.link" to="/">Dashboard</RouterLink>
            </li>
            <li>
                <RouterLink :class="styles.link" to="/createarticle">Create Article</RouterLink>
            </li>
            <li>
                <RouterLink :class="styles.link" to="/allmedia">All Media</RouterLink>
            </li>
        </ul>
    </div>
</template>