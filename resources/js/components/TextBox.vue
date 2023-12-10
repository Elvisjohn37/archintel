<script setup>
import styles from './TextBox.module.scss'
import { ref } from 'vue'

const data = ref('')

const props = defineProps(['type', 'label', 'change'])



</script>

<template>
    <div :class="styles.textBox">
        <span v-if="label">{{ label }}</span>
        <input :type="type" v-model="data" @change="change" />
    </div>
</template>
