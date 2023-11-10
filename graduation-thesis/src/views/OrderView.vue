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
        <div class="flex items-start mb-[20px]">
            <span class="text-[25px] font-semibold">
                Danh sách các đơn hàng đã đặt:
            </span>
        </div>
        <div class="w-[780px] flex flex-row justify-center items-center p-4 border bg-gray-200  border border-gray-400">
            <div class="w-[150px] flex flex-row justify-center items-center">
                <span class="text-[20px] mx-auto text-2xl font-semibold">Mã đơn</span>
            </div>
            <div class="w-[300px] flex flex-row justify-center items-center">
                <span class="text-[20px] mx-auto text-2xl font-semibold">Sản phẩm mua</span>
            </div>
            <div class="w-[150px] flex flex-row justify-center items-center">
                <span class="text-[20px] mx-auto text-2xl font-semibold">Giá</span>
            </div>
            <div class="w-[150px] flex flex-row justify-center items-center">
                <span class="text-[20px] mx-auto text-2xl font-semibold">Ngày mua</span>
            </div>
            <div class="w-[150px] flex flex-row justify-center items-center">
                <span class="text-[20px] mx-auto text-2xl font-semibold">Trạng thái</span>
            </div>
        </div>

        <div class="w-[780px] flex flex-row justify-center items-center p-4 border border border-gray-400" v-for="orderItem in listOrders">
            <div class="w-[150px] flex flex-row justify-center items-center">
                <span>{{ orderItem.id }}</span>
            </div>
            <div class="w-[300px] flex justify-center flex-row items-center">
                <span>{{ orderItem.listProducts }}</span>
            </div>
            <div class="w-[150px] flex flex-row justify-center items-center">
                <span>{{ orderItem.totalAmount }}</span>
            </div>
            <div class="w-[150px] flex flex-row justify-center items-center">
                <span>{{ orderItem.createdAt }}</span>
            </div>
            <div class="w-[150px] flex flex-row justify-center items-center">
                <span>{{ orderItem.status }}</span>
            </div>
        </div>
        <Footer />
    </div>
</template>