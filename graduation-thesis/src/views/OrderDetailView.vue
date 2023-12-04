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
            listOrderItems: 'listOrderItems'
        })
    },
    methods: {
        ...mapActions(useOrderStore, ['getOrderDetail'])
    },
    mounted() {
        this.getOrderDetail(36)
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
        <div class="w-[780px] flex flex-row justify-between items-center" v-for="orderItem in listOrderItems">
            <div class="w-[150px]">
                <span>{{ orderItem.orderId }}</span>
            </div>
            <div class="w-[150px]">
                <span>{{ orderItem.price }}</span>
            </div>
            <div class="w-[150px]">
                <span>{{ orderItem.createdAt }}</span>
            </div>
            <div class="w-[150px]">
                <span>{{ orderItem.productName }}</span>
            </div>
        </div>
        <Footer />
    </div>
</template>