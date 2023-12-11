<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import { defineComponent } from 'vue'
import { mapActions, mapState } from 'pinia';
import { useOrderStore } from '@/stores/order';
import router from '@/router';
export default defineComponent({
    components: {
        Header,
        Footer
    },
    computed: {
        ...mapState(useOrderStore, {
            listOrderItems: 'listOrderItems',
            nameCustomer: 'nameCustomer',
            address: 'address',
            phoneNumber: 'phoneNumber',
            username: 'username',
            listProvinces: 'listProvinces',
            listDistricts: 'listDistricts',
            listWards: 'listWards',
            adressSelected: 'adressSelected',
            totalAmount: 'totalAmount',
            idOrder: 'idOrder',
            statusDetail: 'statusDetail',
            paymentStatus: 'paymentStatus',
            createdAt: 'createdAt'
        })
    },
    methods: {
        ...mapActions(useOrderStore, ['getOrderDetail']),
        getPaymentName(paymentStatus: string) {
            if (paymentStatus === "1") {
                return "Đã thanh toán";
            } else {
                return "Chưa thanh toán";
            }
        },
        routerBillOrder(orderId: number) {
            router.push({ name: 'billOrder', params: { id: orderId } })
        }
    },
    mounted() {
        const { id } = this.$route.params
        this.getOrderDetail(Number(id))
    },
    created() {
        const { id } = this.$route.params
        this.getOrderDetail(Number(id))
    }
})
</script>
<template>
    <div class="flex flex-col justify-center items-center">
        <Header />
        <div class="flex flex-col justify-center items-center">
            <div>
                <span class="text-[30px] font-[600]">Chi tiết đơn hàng</span>
            </div>
            <div class="w-[800px] flex flex-col">
                <span class="text-[20px] font-[600]">Thông tin đơn hàng</span>
            </div>
            <div class="w-[800px] flex flex-col">
                <span class="h-[25px]">Mã đơn: {{ idOrder }}</span>
                <span class="h-[25px]">Tên khách hàng: {{ nameCustomer }}</span>
                <span class="h-[25px]">Địa chỉ nhận hàng: {{ address }}</span>
                <span class="h-[25px]">Số điện thoại: {{ phoneNumber }}</span>
                <span class="h-[25px]">Trạng thái đơn hàng: {{ statusDetail }}</span>
                <span class="h-[25px]">Trạng thái thanh toán: {{ getPaymentName(String(paymentStatus)) }}</span>
                <span class="h-[25px]">Thời gian mua: {{ createdAt }}</span>
            </div>
            <div class="w-[1000px] flex flex-col mt-[10px]">
                <div class="w-[1000px] flex flex-col">
                    <span class="text-[20px] font-[600]">Thông tin sản phẩm</span>
                </div>
                <div class="w-[1000px] flex flex-row justify-between mt-[10px]">
                    <div class="w-[600px] flex flex-row border">
                        <div class="w-[100px] flex justify-center items-center border">
                            <span>TT</span>
                        </div>
                        <div class="w-[300px] flex justify-center items-center">
                            <span>TÊN SẢN PHẨM</span>
                        </div>
                        <div class="w-[200px] flex justify-center items-center">
                            <span>PHÂN LOẠI</span>
                        </div>
                    </div>
                    <div class="w-[400px] flex flex-row border">
                        <div class="w-[133px] flex justify-center items-center">
                            <span>SỐ LƯỢNG</span>
                        </div>
                        <div class="w-[133px] flex justify-center items-center border">
                            <span>ĐƠN GIÁ</span>
                        </div>
                        <div class="w-[133px] flex justify-center items-center">
                            <span>THÀNH TIỀN</span>
                        </div>
                    </div>
                </div>
                <div v-for="(item, index) in listOrderItems">
                    <div class="w-[1000px] flex flex-row justify-between">
                        <div class="w-[600px] flex flex-row">
                            <div class="w-[100px] flex justify-center items-center border">
                                <span>{{ index + 1 }}</span>
                            </div>
                            <div class="w-[300px] flex justify-center items-center border">
                                <span>{{ item.productName }}</span>
                            </div>
                            <div class="w-[200px] flex justify-center items-center border">
                                <span>{{ item.classify }}</span>
                            </div>
                        </div>
                        <div class="w-[400px] flex flex-row">
                            <div class="w-[133px] flex justify-center items-center border">
                                <span>{{ item.quantity }}</span>
                            </div>
                            <div class="w-[133px] flex justify-center items-center border">
                                <span>{{ item.price.toLocaleString('vi-VN') }}</span>
                            </div>
                            <div class="w-[133px] flex justify-center items-center border">
                                <span>{{ parseFloat(item.totalAmount).toLocaleString('vi-VN') }}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="w-[1000px] h-[50px] text-[20px] font-[600] flex flex-row justify-end items-center">
                    <span>TỔNG CỘNG: {{ totalAmount.toLocaleString('vi-VN') }}đ</span>
                </div>
                <div class="w-[1000px] h-[50px] text-[20px] font-[600] flex flex-row justify-end items-center">
                    <button @click="routerBillOrder(idOrder)"
                        class="w-[100px] h-[30px] text-[12px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none">Xem
                        hóa đơn</button>
                </div>
            </div>
        </div>
        <Footer />
    </div>
</template>