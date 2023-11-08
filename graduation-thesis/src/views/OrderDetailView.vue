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
        ...mapActions(useOrderStore, ['getOrderDetail'])
    },
    mounted() {
        this.getOrderDetail(11)
    }
})
</script>
<template>
    <div class="flex flex-col justify-center items-center">
        <Header />
        <div class="w-[780px] flex flex-row justify-between items-center">
            <div class="w-[150px]">
                <span>ID</span>
            </div>
            <div class="w-[150px]">
                <span>Tổng tiền</span>
            </div>
            <div class="w-[150px]">
                <span>Ngày mua</span>
            </div>
            <div class="w-[150px]">
                <span>Trạng thái</span>
            </div>
        </div>
        <div class="w-[780px] flex flex-row justify-between items-center" v-for="orderItem in listOrders">
            <div class="w-[150px]">
                <span>{{ orderItem.id }}</span>
            </div>
            <div class="w-[150px]">
                <span>{{ orderItem.totalAmount }}</span>
            </div>
            <div class="w-[150px]">
                <span>{{ orderItem.createdAt }}</span>
            </div>
            <div class="w-[150px]">
                <span>{{ orderItem.status }}</span>
            </div>
        </div>
        <Footer />
    </div>
</template>