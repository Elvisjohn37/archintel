<script setup>
import styles from './CreateArticle.module.scss'
import Button from '@/components/Button.vue'
import { ref } from 'vue'
import axios from 'axios'

const image = ref('')
const title = ref('')
const link = ref('')
const company = ref('')
const content = ref('')

const handleSubmit = () => {
    axios
        .post('savearticle', {
            title: title.value,
            link: link.value,
            company: company.value,
            content: content.value,
        })
        .then(() => {
            alert("Article successfully submitted!")
            resetForm()
        })
        .catch(() => alert("Something went wrong!"))
        .finally()
}

const resetForm = () => {
    title.value = ''
    link.value = ''
    company.value = ''
    content.value = ''
}

</script>

<template>
    <div :class="styles.createArticle">
        <h1>Create Article</h1>
        <form @submit.prevent="handleSubmit" enctype="multipart/form-data">
            <div :class="styles.formContent">
                <div :class="styles.inputs">
                    <div :class="styles.formGroup">
                        <label>Image:</label>
                        <input
                            @change="handleImage"
                            type="file"
                            accept=".jpg, .jpeg, .png, .gif"
                        />
                    </div>
                    <div :class="styles.formGroup">
                        <label>Title:</label>
                        <input
                            required
                            v-model="title"
                            type="text"
                        />
                    </div>
                    <div :class="styles.formGroup">
                        <label>Link</label>
                        <input
                            required
                            v-model="link"
                            ty
                            pe="text"
                        />
                    </div>
                    <div :class="styles.formGroup">
                        <label>Company</label>
                        <input
                            required
                            v-model="company"
                            type="text"
                        />
                    </div>
                </div>
                <div :class="styles.formGroup">
                    <label>Content</label>
                    <textarea
                        v-model="content"
                        id=""
                        cols="30"
                        rows="13"
                    ></textarea>
                </div>
            </div>
            <div :class="styles.formActions">
                <Button
                    :class="styles.createButton"
                    label="Create"
                    type="submit"
                />
            </div>
        </form>
    </div>
</template>
