<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import { defineComponent } from 'vue'
import { mapActions, mapState } from 'pinia';
import { useOrderStore } from '@/stores/order';
import router from '@/router'
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
    data() {
        return {

        }
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
        <div class="w-[780px] flex flex-row justify-between items-center">
            <span>ID</span>
            <span>Tổng tiền</span>
            <span>Ngày mua</span>
            <span>Trạng thái</span>
        </div>
        <div class="w-[780px] flex flex-row justify-between items-center" v-for="orderItem in listOrders">
            <span>{{ orderItem.id }}</span>
            <span>{{ orderItem.totalAmount }}</span>
            <span>{{ orderItem.createdAt }}</span>
            <span>{{ orderItem.status }}</span>
        </div>
        <Footer />
    </div>
</template>