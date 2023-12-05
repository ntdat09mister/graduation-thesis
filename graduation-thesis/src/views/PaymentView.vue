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
    data() {
        return {
            provinceId: 1,
            districtId: 1,
            wardsId: 1,
            showAddress: false,
            paymentMethod: true,
            orderId: 1
        }
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
            
        })
    },
    methods: {
        ...mapActions(useOrderStore, ['getOrderDetail', 'getListProvinces', 'getListDistrictOfProvince', 'getListWardsOfDistrict', 'concatAddress','updatePayment']),
        handleGetListDistrict(provinceIdSelected: number) {
            provinceIdSelected = this.provinceId
            this.getListDistrictOfProvince(provinceIdSelected)
        },
        handleGetListWards(districtIdSelected: number) {
            districtIdSelected = this.districtId
            this.getListWardsOfDistrict(districtIdSelected)
        },
        concatAddressHandle(wardsId: number, districtId: number, provinceId: number) {
            console.log(wardsId, districtId, provinceId)
            wardsId = this.wardsId
            this.concatAddress(wardsId, districtId, provinceId)
            this.showAddress = true
        },
        selectPaymentMethod() {
            this.paymentMethod = !this.paymentMethod
        },
        setOrderId(id: number) {
            this.orderId = id
        }
    },
    created() {
        const { id } = this.$route.params
        this.getOrderDetail(Number(id)),
        this.setOrderId(Number(id))
    },
    mounted() {
        this.getListProvinces(),
            this.getListDistrictOfProvince(this.districtId),
            this.getListWardsOfDistrict(this.wardsId)
    }
})
</script>
<template>
    <div class="flex flex-col justify-center items-center bg-[#F2F2F2]">
        <Header />
        <div class="w-[600px] flex flex-col items-center">
            <h1>Thông tin đơn hàng</h1>
            <div class="w-[600px] flex flex-row items-center">
                <div class="w-[300px] flex justify-center">
                    <span>Thông tin</span>
                </div>
                <div class="w-[300px] flex justify-center">
                    <span>Thanh toán</span>
                </div>
            </div>
            <div v-for="item in listOrderItems" class="w-[600px] flex flex-col items-center">
                <div class="w-[580px] flex flex-col  rounded-[10px] bg-[#FFFFFF] mt-[10px]">
                    <div class="w-[580px] flex flex-row justify-between items-center">
                        <div class="w-[130px]">
                            <img class="w-[100px] h-[100px]" :src="item.srcProduct" alt="Ảnh">
                        </div>
                        <div class="w-[270px] flex flex-col">
                            <div>
                                <span>Giá gốc: {{ item.price }}đ</span>
                            </div>
                            <div>
                                <span>Giá bán: {{ item.price }}đ</span>
                            </div>
                        </div>
                        <div class="w-[200px]">
                            <span>Số lượng: {{ item.quantity }}</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="w-[600px] flex mt-[10px]">
                <p
                    style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 17px;line-height: 21px;color: #1C1D21;">
                    Thông tin khách hàng</p>
            </div>
            <div class="w-[600px] flex flex-col  rounded-[10px] bg-[#FFFFFF] mt-[10px]">
                <span>Tên khách hàng:</span>
                <input type="text" :placeholder="nameCustomer">
                <span>Số điện thoại:</span>
                <input type="text" :placeholder="phoneNumber">
                <span>Tài khoản đăng nhập:</span>
                <input type="text" :placeholder="username">
            </div>
            <div v-if="paymentMethod" class="w-[600px] flex flex-col mt-[10px] bg-[#FFFFFF]">
                <div class="flex flex-row">
                    <div
                        class="flex justify-center items-center w-[300px] h-[38px] text-[12px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none mt-[10px]">
                        <button>Thanh toán trực tiếp</button>
                    </div>
                    <div @click="selectPaymentMethod()" class="flex justify-center w-[300px]">
                        <button>Quét mã QR</button>
                    </div>
                </div>
                <div>
                    <span>Mời quý khách đến ngay cửa hàng Danny Store tọa lạc ở số 341 Xuân Phương Nam Từ Liêm để nhân viên
                        cửa hàng hỗ trợ giao dịch!</span>
                </div>
            </div>
            <div v-if="!paymentMethod" class="w-[600px] flex flex-col mt-[10px] bg-[#FFFFFF]">
                <div class="flex flex-row">
                    <div @click="selectPaymentMethod()" class="flex justify-center w-[300px]">
                        <button>Thanh toán trực tiếp</button>
                    </div>
                    <div
                        class="flex justify-center items-center w-[300px] h-[38px] text-[12px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none mt-[10px]">
                        <button>Quét mã QR</button>
                    </div>
                </div>
                <div class="w-[600px] flex justify-center mt-[20px] mb-[10px]">
                    <img class="w-[300px]" src="https://i.imgur.com/UFpL94n.jpg" alt="">
                </div>
            </div>
            <div class="w-[600px] flex flex-col mt-[10px]">
                <p
                    style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 17px;line-height: 21px;color: #1C1D21;">
                    Thông tin nhận hàng</p>
                <div class="w-[600px] flex flex-col rounded-[10px] bg-[#FFFFFF] mt-[10px]">
                    <div class="flex flex-row justify-around">
                        <span>Nhận hàng tại cửa hàng</span>
                        <span>Giao hàng tận nơi</span>
                    </div>
                    <div class="flex flex-row justify-around">
                        <div class="w-[200px] h-[80px] flex flex-col justify-center items-center">
                            <span>Chọn tỉnh thành</span>
                            <select v-model="provinceId" @change="handleGetListDistrict(provinceId)"
                                class="w-[100px] h-[38px] text-[14px] rounded-xl focus:outline-none border border-gray-300">
                                <option v-for="province in listProvinces" :value=province.provinceId>{{
                                    province.name }}</option>
                            </select>
                        </div>
                        <div class="w-[200px] h-[80px] flex flex-col justify-center items-center">
                            <span>Chọn quận huyện</span>
                            <select v-model="districtId" @change="handleGetListWards(districtId)"
                                class="w-[100px] h-[38px] text-[14px] rounded-xl focus:outline-none border border-gray-300">
                                <option v-for="district in listDistricts" :value=district.districtId>{{ district.name }}
                                </option>
                            </select>
                        </div>
                        <div class="w-[200px] h-[80px] flex flex-col justify-center items-center">
                            <span>Chọn xã phường</span>
                            <select v-model="wardsId" @change="concatAddressHandle(wardsId, districtId, provinceId)"
                                class="w-[100px] h-[38px] text-[14px] rounded-xl focus:outline-none border border-gray-300">
                                <option v-for="wards in listWards" :value=wards.wardsId>{{
                                    wards.name }}</option>
                            </select>
                        </div>
                    </div>
                    <div class="flex flex-col">
                        <span>Địa chỉ tương đối:</span>
                        <span>{{ adressSelected }}</span>
                    </div>
                    <div class="flex flex-col">
                        <span>Địa chỉ chi tiết:</span>
                        <input v-model="adressSelected" type="text" :placeholder="`${adressSelected}`">
                    </div>
                </div>
            </div>
            <div class="w-[600px] flex flex-col mt-[10px]">
                <div class="flex flex-row justify-around">
                    <p
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 19px;line-height: 21px;color: #1C1D21;">
                        Tổng tiền tạm tính</p>
                    <p
                        style="font-family: 'Lato';font-style: normal;font-weight: 500;font-size: 19px;line-height: 21px;color: #1C1D21;">
                        {{ totalAmount }}đ</p>
                </div>
                <button @click="updatePayment(orderId, adressSelected)"
                    class="w-[570px] h-[38px] text-[12px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none mt-[10px]">Tiếp
                    tục</button>
            </div>
        </div>
        <Footer />
    </div>
</template>