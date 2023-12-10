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
    methods: {
        ...mapActions(useOrderStore, ['getAllOrders', 'cancelOrder', 'updateReceived', 'refundOrder']),
        routerOrderDetail(orderId: number, status: string) {
            if (status === 'Tiếp nhận đơn') {
                console.log(status)
                router.push({ name: 'payment', params: { id: orderId } })
            } else {
                router.push({ name: 'orderDetail', params: { id: orderId } })
            }
        }
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
        <div class="w-[1000px] flex flex-row justify-between items-center p-4 border bg-gray-200  border border-gray-400">
            <div class="w-[150px] flex flex-row justify-center items-center">
                <span class="text-[20px] mx-auto text-2xl font-semibold">Mã đơn</span>
            </div>
            <div class="w-[150px] flex flex-row justify-center items-center">
                <span class="text-[20px] mx-auto text-2xl font-semibold">Sản phẩm</span>
            </div>
            <div class="w-[300px] flex flex-row justify-center items-center">
                <span class="text-[20px] mx-auto text-2xl font-semibold">Sản phẩm mua</span>
            </div>
            <div class="w-[150px] flex flex-row justify-center items-center">
                <span class="text-[20px] mx-auto text-2xl font-semibold">Số tiền</span>
            </div>
            <div class="w-[150px] flex flex-row justify-center items-center">
                <span class="text-[20px] mx-auto text-2xl font-semibold">Ngày mua</span>
            </div>
            <div class="w-[170px] flex flex-row justify-center items-center">
                <span class="text-[20px] mx-auto text-2xl font-semibold">Trạng thái</span>
            </div>
            <div class="w-[70px] h-[50px] flex justify-center items-center"></div>
        </div>

        <div class="w-[1000px] flex flex-row justify-center items-center p-4 border border border-gray-400"
            v-for="orderItem in listOrders">
            <div class="w-[150px] flex flex-row justify-center items-center">
                <button @click="routerOrderDetail(orderItem.id, orderItem.status)"
                    class="w-[50px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-500"> {{
                        orderItem.id }} </button>
            </div>
            <div class="w-[150px] flex flex-row justify-center items-center">
                <img class="w-[52px] h-[52px] ml-[25px]" :src="orderItem.src" alt="product-img">
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
            <div class="w-[170px] flex flex-row justify-center items-center">
                <span>{{ orderItem.status }}</span>
            </div>
            <template v-if="orderItem.status === 'Tiếp nhận đơn' || orderItem.status === 'Lên đơn'">
                <div class="w-[70px] h-[50px] flex justify-center items-center">
                    <button @click="cancelOrder(orderItem.id)"
                        class="w-[50px] h-[30px] text-[12px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none">Hủy
                        đơn</button>
                </div>
            </template>
            <template v-if="orderItem.status === 'Đang giao'">
                <div class="w-[70px] h-[50px] flex justify-center items-center">
                    <button @click="updateReceived(orderItem.id)"
                        class="w-[50px] h-[30px] text-[12px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none">Đã
                        nhận hàng</button>
                </div>
            </template>
            <template v-if="orderItem.status === 'Đã nhận hàng'">
                <div class="w-[70px] h-[50px] flex justify-center items-center">
                    <button @click="refundOrder(orderItem.id)"
                        class="w-[50px] h-[30px] text-[12px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none">Trả
                        hàng</button>
                </div>
            </template>
            <template v-else>
                <div class="w-[70px] h-[50px] flex justify-center items-center"></div>
            </template>
        </div>
        <Footer />
    </div>
</template>