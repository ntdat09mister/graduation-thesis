<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import { defineComponent } from 'vue'
import { mapActions, mapState } from 'pinia';
import { useCartStore } from '@/stores/cart';
export default defineComponent({
    components: {
        Header,
        Footer
    },
    computed: {
        ...mapState(useCartStore, {
            listCart: 'listCart',
            totalAmount: 'totalAmountRef'
        })
    },
    data() {
        return {
            userId: 1,
            totalAmountShow: 0
        }
    },
    methods: {
        ...mapActions(useCartStore, ['getListCart'])
    },
    mounted() {
        this.getListCart()
    }
})
</script>
<template>
    <div class="flex flex-col justify-center items-center">
        <Header />
        <Footer />
    </div>
</template>