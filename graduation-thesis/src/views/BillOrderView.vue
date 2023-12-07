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
            statusDetail: 'statusDetail'
        })
    },
    methods: {
        ...mapActions(useOrderStore, ['getOrderDetail'])
    },
    mounted() {

    },
    created() {
        const { id } = this.$route.params
        this.getOrderDetail(Number(id))
    }
})
</script>
<template>
    <div class="flex flex-col justify-center items-center">
        <div class="w-[800px] flex flex-row justify-around items-center">
            <div>
                <span class="text-[20px] font-[600]">Cửa hàng điện thoại Danny Store</span>
            </div>
            <div>
                <span class="text-[30px] font-[600]">Hóa đơn bán hàng</span>
            </div>
        </div>
        <div class="w-[800px] flex flex-row justify-around">
            <div class="flex flex-col">
                <span>Địa chỉ: 341 Xuân Phương, Nam Từ Liêm, Hà Nội</span>
                <span>ĐT: 0329735190</span>
            </div>
            <div>
                <span>Điện thoại di động</span>
            </div>
        </div>
        <div class="w-[800px] flex flex-col">
            <span>Tên khách
                hàng:.....................................................................................................................................................................................................</span>
            <span>Địa
                chỉ:.......................................................................................................................................................................................................................</span>
        </div>
        <div class="w-[800px] flex flex-col">
            <div class="w-[800px] flex flex-row justify-between">
                <div class="w-[400px] flex flex-row border">
                    <div class="w-[100px] flex justify-center items-center border">
                        <span>TT</span>
                    </div>
                    <div class="w-[300px] flex justify-center items-center">
                        <span>TÊN SẢN PHẨM</span>
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
            <div v-for="item in 15">
                <div class="w-[800px] flex flex-row justify-between">
                    <div class="w-[400px] flex flex-row">
                        <div class="w-[100px] flex justify-center items-center border">
                            <span>{{ item }}</span>
                        </div>
                        <div class="w-[300px] flex justify-center items-center border">
                            <span>Iphone 13 promax</span>
                        </div>
                    </div>
                    <div class="w-[400px] flex flex-row">
                        <div class="w-[133px] flex justify-center items-center border">
                            <span>1</span>
                        </div>
                        <div class="w-[133px] flex justify-center items-center border">
                            <span>5000</span>
                        </div>
                        <div class="w-[133px] flex justify-center items-center border">
                            <span>5000</span>
                        </div>
                    </div>

                </div>
            </div>

            <div class="w-[800px] flex flex-row">
                <span>TỔNG CỘNG</span>
            </div>
            <div class="w-[800px]">
                <span>Thành tiền (viết bằng chữ):.........................................................</span>
                <span>.....................................................................................</span>
            </div>
            <div class="w-[800px] flex flex-row justify-around">
                <div>
                    <span>KHÁCH HÀNG</span>
                </div>
                <div class="flex flex-col items-center">
                    <span>Ngày...... tháng........ năm 20.......</span>
                    <span>NGƯỜI BÁN HÀNG</span>
                </div>
            </div>
        </div>
    </div>
</template>