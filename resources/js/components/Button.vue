<script setup>
    import styles from './Button.module.scss'

    const props = defineProps(['label', 'class'])

</script>

<template>
    <div :class="styles.button">
        <button :class="class">{{ label }}</button>
    </div>
</template>
