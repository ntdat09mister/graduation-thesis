<script lang="ts">
import { defineComponent } from 'vue'
import { useProductStore } from '@/stores/product'
import { mapActions } from 'pinia'
export default defineComponent({
    methods: {
        ...mapActions(useProductStore, ['getProducts'])
    }
})
</script>
<template>

</template>