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
    data() {
        return {
            autoFill: true
        }
    },
    methods: {
        ...mapActions(useOrderStore, ['getOrderDetail']),
        autoFillSelected() {
            this.autoFill = !this.autoFill
        }
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
    <div class="flex flex-col items-center bg-[#e9efff] h-[1100px]">
        <div class="w-[1000px] h-[50px] text-[15px] font-[600] flex flex-row items-center">
            <button
                class="w-[100px] h-[30px] text-[12px] rounded-xl bg-blue-500 hover:bg-red-600 text-white focus:outline-none"
                @click="autoFillSelected()">Hoá đơn tự động</button>
        </div>
        <div class="w-[1000px] bg-[#FFFFFF]">
            <div v-if="autoFill" class="flex flex-col justify-center items-center">
                <div class="w-[800px] flex flex-row justify-around items-center mt-[100px]">
                    <div>
                        <span class="text-[20px] font-[600]">Cửa hàng điện thoại Danny Store</span>
                    </div>
                    <div>
                        <span class="text-[30px] font-[600]">Hóa đơn bán hàng</span>
                    </div>
                </div>
                <div class="w-[800px] flex flex-row">
                    <div class="flex flex-col">
                        <span>Địa chỉ: 341 Xuân Phương, Nam Từ Liêm, Hà Nội</span>
                        <span class="mt-[5px]">Liên hệ: 0329735190</span>
                    </div>
                </div>
                <div class="w-[800px] flex flex-col">
                    <span class="mt-[5px]">Tên khách hàng: {{ nameCustomer }}</span>
                    <span class="mt-[5px]">Số điện thoại:{{ phoneNumber }}</span>
                    <span class="mt-[5px]">Địa chỉ: {{ address }}</span>
                </div>
                <div class="w-[800px] flex flex-col mt-[10px]">
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
                    <div v-for="(item, index) in listOrderItems">
                        <div class="w-[800px] flex flex-row justify-between">
                            <div class="w-[400px] flex flex-row">
                                <div class="w-[100px] flex justify-center items-center border">
                                    <span>{{ index + 1 }}</span>
                                </div>
                                <div class="w-[300px] flex justify-center items-center border">
                                    <span>{{ item.productName }}</span>
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
                    <div class="w-[800px] flex flex-row justify-around mt-[10px]">
                        <span>TỔNG CỘNG</span>
                        <span>{{ totalAmount }}đ</span>
                    </div>
                    <div class="w-[800px]">
                        <span>Thành tiền (viết bằng chữ):......................................................................</span>
                        <span>.....................................................................................</span>
                    </div>
                    <div class="w-[1000px] h-[200px] flex flex-row justify-around">
                        <div class="w-[1000px] flex flex-row justify-around">
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
            </div>
            <div v-else class="flex flex-col justify-center items-center">
                <div class="w-[800px] flex flex-row justify-around items-center mt-[100px]">
                    <div>
                        <span class="text-[20px] font-[600]">Cửa hàng điện thoại Danny Store</span>
                    </div>
                    <div>
                        <span class="text-[30px] font-[600]">Hóa đơn bán hàng</span>
                    </div>
                </div>
                <div class="w-[800px] flex flex-row">
                    <div class="flex flex-col">
                        <span class="mt-[5px]">Địa chỉ: 341 Xuân Phương, Nam Từ Liêm, Hà Nội</span>
                        <span class="mt-[5px]">Liên hệ: 0329735190</span>
                    </div>
                </div>
                <div class="w-[800px] flex flex-col">
                    <span class="mt-[5px]">Tên khách
                        hàng:.....................................................................................................................................................................................................</span>
                    <span class="mt-[5px]">Số điện
                        thoại:..................................................................................................................................................................................................</span>
                    <span class="mt-[5px]">Địa
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
                    <div class="w-[1000px]" v-for="item in 15">
                        <div class="w-[800px] flex flex-row justify-between">
                            <div class="w-[400px] flex flex-row">
                                <div class="w-[100px] flex justify-center items-center border">
                                    <span>{{ item }}</span>
                                </div>
                                <div class="w-[300px] flex justify-center items-center border">
                                    <span></span>
                                </div>
                            </div>
                            <div class="w-[400px] flex flex-row">
                                <div class="w-[133px] flex justify-center items-center border">
                                    <span></span>
                                </div>
                                <div class="w-[133px] flex justify-center items-center border">
                                    <span></span>
                                </div>
                                <div class="w-[133px] flex justify-center items-center border">
                                    <span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="w-[1000px] flex flex-row">
                        <span>TỔNG CỘNG</span>
                    </div>
                    <div class="w-[800px]">
                        <span>Thành tiền (viết bằng chữ):.........................................................</span>
                        <span>.....................................................................................</span>
                    </div>
                    <div class="w-[1000px] h-[200px]">
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
            </div>
        </div>
    </div>
</template>