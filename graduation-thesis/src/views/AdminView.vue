<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import { defineComponent } from 'vue'
import { mapActions, mapState } from 'pinia';
import { useOrderStore } from '@/stores/order';
export default defineComponent({
    components: {
        Header,
        Footer
    },
    computed: {
        ...mapState(useOrderStore, {
            listOrders: 'listOrders'
        })
    },
    methods: {
        ...mapActions(useOrderStore, ['getAllOrders'])
    },
    mounted() {
        this.getAllOrders()
    }
})
</script>
<template>
    <div class="flex flex-col justify-center items-center">
        <Header />
        
        <Footer />
    </div>
</template>