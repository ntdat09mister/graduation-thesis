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
            paymentStatus: 'paymentStatus'
        })
    },
    methods: {
        ...mapActions(useOrderStore, ['getOrderDetail']),
        checkStatusDetail(orderId: number) {
            if (this.statusDetail === 'Tiếp nhận đơn') {
                router.push({ name: 'payment', params: { id: Number(orderId) } })
            }
        },
        getPaymentName(paymentStatus : string) {
            if (paymentStatus === "1") {
                return "Đã thanh toán";
            } else {
                return "Chưa thanh toán";
            }
        }
    },
    mounted() {
        const { id } = this.$route.params
        this.checkStatusDetail(Number(id))
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
        <div class="w-[780px] flex flex-col justify-between bg-[#F2F2F2]">
            <div class="w-[500px] h-[30px] flex flex-row items-center">
                <span
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #1B51E5;">Mã
                    đơn hàng:</span>
                <span
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #1B51E5;">{{
                        idOrder }}</span>
            </div>
            <div class="w-[500px] h-[30px] flex flex-row items-center">
                <span
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #1B51E5;">Tên
                    người nhận:</span>
                <span
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #1B51E5;">{{
                        nameCustomer }}</span>
            </div>
            <div class="w-[500px] h-[30px] flex flex-row items-center">
                <span
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #1B51E5;">Số
                    điện thoại người nhận:</span>
                <span
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #1B51E5;">{{
                        phoneNumber }}</span>
            </div>
            <div class="w-[500px] h-[30px] flex flex-row items-center">
                <span
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #1B51E5;">Địa
                    chỉ nhận hàng:</span>
                <span
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #1B51E5;">{{
                        address }}</span>
            </div>
            <div class="flex flex-col">
                <div class="w-[500px] h-[30px] flex flex-row items-center">
                    <span
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #1B51E5;">Danh
                        sách sản phẩm đã đặt:</span>
                </div>
                <div v-for="item in listOrderItems" class="flex flex-row">
                    <div>
                        <img class="w-[80px]" :src="item.srcProduct" alt="">
                    </div>
                    <div class="flex flex-col justify-center">
                        <div>
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #1B51E5;">Tên:
                            </span>
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #2ce51b;">{{
                                    item.productName }}</span>
                        </div>
                        <div>
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #1B51E5;">Số
                                lượng:</span>
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #2ce51b;">{{
                                    item.quantity }}</span>
                        </div>
                        <div>
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #1B51E5;">Giá:</span>
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #2ce51b;">{{
                                    item.price }}đ</span>
                        </div>
                    </div>

                </div>
                <div>
                    <span style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #1B51E5;">Trạng thái đơn hàng:</span>
                    <span style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #2ce51b;">{{ statusDetail }}</span>
                </div>
                <div>
                    <span style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #1B51E5;">Trạng thái thanh toán:</span>
                    <span style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #2ce51b;">{{ getPaymentName(String(paymentStatus)) }}</span>
                </div>
            </div>

        </div>
        <div>
            <span
                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #e5431b;">Tổng
                tiền:</span>
            <span
                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 18px;color: #e51b1b;">{{
                    totalAmount }}đ</span>
        </div>
        <Footer />
    </div>
</template>