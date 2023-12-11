<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import { defineComponent } from 'vue'
import { mapActions, mapState } from 'pinia'
import { useOrderStore } from '@/stores/order'
import router from '@/router'
import { toast } from 'vue3-toastify'
export default defineComponent({
    components: {
        Header,
        Footer
    },
    data() {
        return {
            showAddress: false,
            paymentMethod: true,
            orderId: 1,
            atStore: true,
            phoneNumberInput: '',
            addressInput: '',
            modifyPhoneNumberBool: false,
            modifyAddressBool: false
        }
    },
    computed: {
        ...mapState(useOrderStore, {
            listOrderItems: 'listOrderItems',
            nameCustomer: 'nameCustomer',
            address: 'address',
            phoneNumber: 'phoneNumber',
            username: 'username',
            totalAmount: 'totalAmount',
            toDaytime: 'toDaytime'
        })
    },
    methods: {
        ...mapActions(useOrderStore, ['getOrderDetail', 'getListProvinces', 'getListDistrictOfProvince', 'getListWardsOfDistrict', 'concatAddress', 'updatePayment', 'updatePhone', 'updateAddress']),
        selectPaymentMethod() {
            this.paymentMethod = !this.paymentMethod
        },
        setOrderId(id: number) {
            this.orderId = id
        },
        handleUpdatePayment(orderIdInput: number, addressInput: string, phoneNumber: string) {
            if (addressInput === 'Nhận tại cửa hàng') {
                this.updatePayment(orderIdInput, 'Nhận tại cửa hàng Danny Store - 341 Xuân Phương, Nam Từ Liêm, Hà Nội', phoneNumber)
            } else {
                this.updatePayment(orderIdInput, addressInput, phoneNumber)
            }
        },
        changeLocationAtStore() {
            this.atStore = true
        },
        changeLocationAtHome() {
            this.atStore = false
        },
        modifyPhoneNumber(phoneNumberFill: string) {
            console.log(phoneNumberFill)
            this.phoneNumberInput = phoneNumberFill
            this.modifyPhoneNumberBool = true
        },
        updatePhoneNumber(phoneNumberFillUpdate: string) {
            console.log(this.orderId)
            this.updatePhone(this.orderId, '', phoneNumberFillUpdate)
            this.modifyPhoneNumberBool = false
        },
        modifyAddress(addressFill: string) {
            this.addressInput = addressFill
            this.modifyAddressBool = true
        },
        updateAddressClick(addressFillUpdate: string) {
            console.log(this.orderId)
            this.updateAddress(this.orderId, addressFillUpdate, '')
            this.modifyAddressBool = false
        }
    },
    created() {
        const { id } = this.$route.params
        this.getOrderDetail(Number(id)),
            this.setOrderId(Number(id))
    }
})
</script>
<template>
    <div class="flex flex-col justify-center items-center bg-[#F2F2F2]">
        <Header />
        <div class="w-[600px] flex flex-col items-center">
            <p
                style="font-family: 'Lato';font-style: normal;font-weight: 600;font-size: 20px;line-height: 21px;color: #1C1D21;">
                Thông tin khách hàng</p>
            <div class="w-[600px] flex flex-row items-center">
                <div class="w-[600px] flex">
                    <p
                        style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 17px;line-height: 21px;color: #1C1D21;">
                        Danh sách sản phẩm</p>
                </div>
            </div>
            <div v-for="item in listOrderItems" class="w-[600px] flex flex-col items-center">
                <div class="w-[580px] flex flex-col rounded-[10px] bg-[#FFFFFF] mt-[10px]">
                    <div class="ml-[40px] w-[400px] flex flex-row justify-between items-center">
                        <div class="w-[130px]">
                            <img class="w-[100px] h-[100px]" :src="item.srcProduct" alt="Ảnh">
                        </div>
                        <div class="w-[300px] flex flex-col">
                            <div>
                                <span>Tên sản phẩm: {{ item.productName }}</span>
                            </div>
                            <div>
                                <span>Phân loại: {{ item.classify }}</span>
                            </div>
                            <div>
                                <span>Giá: {{ item.price }}đ</span>
                            </div>
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
                <span>{{ nameCustomer }}</span>
                <span>Số điện thoại:</span>
                <div v-if="modifyPhoneNumberBool" class="w-[600px] h-[24px] flex flex-row">
                    <input v-model="phoneNumberInput" type="text" :placeholder="`${phoneNumber}`">
                    <button @click="updatePhoneNumber(phoneNumberInput)"
                        class="w-[60px] h-[24px] text-[12px] text-white rounded-xl focus:outline-none bg-red-500 hover:bg-blue-600 border border-gray-500">Lưu</button>
                </div>
                <div v-else class="w-[600px] h-[24px] flex flex-row">
                    <span>{{ phoneNumber }}</span>
                    <button @click="modifyPhoneNumber(phoneNumber)"
                        class="w-[60px] h-[24px] text-[12px] rounded-xl focus:outline-none border border-gray-500 ml-[95px]">Chỉnh
                        sửa</button>
                </div>
                <span>Tài khoản đăng nhập:</span>
                <span>{{ username }}</span>
            </div>
            <div v-if="atStore">
                <div class="w-[600px] flex flex-col mt-[10px]">
                    <p
                        style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 17px;line-height: 21px;color: #1C1D21;">
                        Thông tin nhận hàng</p>
                    <div class="w-[600px] flex flex-col rounded-[10px] bg-[#FFFFFF] mt-[10px]">
                        <div class="flex flex-row justify-around">
                            <button
                                class="flex justify-center items-center w-[300px] h-[38px] text-[12px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none">
                                <span>Giao hàng tận nơi</span>
                            </button>
                            <div @click="changeLocationAtHome()" class="flex justify-center items-center w-[300px]">
                                <button>Nhận hàng tại cửa hàng</button>
                            </div>
                        </div>
                        <div v-if="!modifyAddressBool">
                            <div class="flex flex-col justify-between h-[80px]">
                                <span>Địa chỉ nhận hàng:</span>
                                <span>{{ address }}</span>
                                <button @click="modifyAddress(address)"
                                    class="w-[60px] h-[24px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Chỉnh
                                    sửa</button>
                            </div>
                        </div>
                        <div v-else>
                            <div class="flex flex-col justify-between h-[80px]">
                                <span>Địa chỉ nhận hàng:</span>
                                <input v-model="addressInput" type="text" :placeholder="`${address}`">
                                <button @click="updateAddressClick(addressInput)"
                                    class="w-[60px] h-[24px] text-[12px] text-white rounded-xl focus:outline-none bg-red-500 hover:bg-blue-600 border border-gray-500">Lưu</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="w-[600px] mt-[10px]">
                    <p
                        style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 17px;line-height: 21px;color: #1C1D21;">
                        Hình thức thanh toán</p>
                </div>
                <div v-if="paymentMethod"
                    class="w-[600px] flex flex-col justify-center items-center mt-[10px] bg-[#FFFFFF]">
                    <div class="flex flex-row">
                        <div
                            class="flex justify-center items-center w-[300px] h-[38px] text-[12px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none mt-[10px]">
                            <button>Ship cod</button>
                        </div>
                        <div @click="selectPaymentMethod()" class="flex justify-center w-[300px]">
                            <button>Quét mã QR</button>
                        </div>
                    </div>
                    <div class="w-[500px] flex flex-col">
                        <span>Quy trình nhận hàng ship cod</span>
                        <span>- Quý khách thanh toán {{ totalAmount }} với shipper</span>
                        <span>- Nhận hàng quý khách vui lòng kiểm tra kĩ sản phẩm đối chiếu với shipper</span>
                        <span>- Quay video quá trình mở hàng để có thể khiếu nại khi sản phẩm có vấn đề</span>
                        <span>- Danny Store không xử lý các trường hợp khiếu nại thiếu bằng chứng ở khách hàng</span>
                        <span>- Đơn hàng sẽ được đóng gói và xử lý gửi đi trước ngày {{ toDaytime }}</span>
                    </div>
                </div>
                <div v-if="!paymentMethod" class="w-[600px] flex flex-col mt-[10px] bg-[#FFFFFF]">
                    <div class="flex flex-row">
                        <div @click="selectPaymentMethod()" class="flex justify-center w-[300px]">
                            <button>Ship cod</button>
                        </div>
                        <div
                            class="flex justify-center items-center w-[300px] h-[38px] text-[12px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none mt-[10px]">
                            <button>Quét mã QR</button>
                        </div>
                    </div>
                    <div class="w-[600px] flex flex-col justify-center items-center mt-[20px] mb-[10px]">
                        <img class="w-[300px]" src="https://i.imgur.com/UFpL94n.jpg" alt="">
                        <span>Vui lòng nhập đủ số tiền đơn hàng: {{ totalAmount }}</span>
                        <span>Lời nhắn: {{ nameCustomer }} chuyen tien</span>
                        <div class="w-[500px] flex flex-col justify-center">
                            <span>Nhận hàng quý khách vui lòng kiểm tra kĩ sản phẩm đối chiếu với shipper</span>
                            <span>Quay video quá trình mở hàng để có thể khiếu nại khi sản phẩm có vấn đề</span>
                            <span>Danny Store không xử lý các trường hợp khiếu nại thiếu bằng chứng ở khách hàng</span>
                            <span>Đơn hàng sẽ được đóng gói và xử lý gửi đi trước ngày {{ toDaytime }}</span>
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
                    <button @click="handleUpdatePayment(orderId, address, phoneNumber)"
                        class="w-[570px] h-[38px] text-[12px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none mt-[10px]">Tới
                        trang theo dõi đơn</button>
                </div>
            </div>
            <div v-else>
                <div class="w-[600px] flex flex-col mt-[10px]">
                    <p
                        style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 17px;line-height: 21px;color: #1C1D21;">
                        Thông tin nhận hàng</p>
                    <div class="w-[600px] flex flex-col justify-center rounded-[10px] bg-[#FFFFFF]">
                        <div @click="changeLocationAtStore()" class="flex flex-row justify-around">
                            <button class="flex justify-center items-center w-[300px]">
                                <span>Giao hàng tận nơi</span>
                            </button>
                            <div
                                class="flex justify-center items-center w-[300px] h-[38px] text-[12px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none">
                                <button>Nhận hàng tại cửa hàng</button>
                            </div>
                        </div>
                        <span>Quy trình nhận hàng tại cửa hàng:</span>
                        <span>- Quý khách tới địa chỉ 341 Xuân Phương Nam Từ Liêm Hà Nội</span>
                        <span>- Làm thủ tục nhận hàng</span>
                        <span>- Rinh máy về</span>
                        <span>- Cảm ơn quý khách, hi vọng sớm được gặp lại quý khách tại cửa hàng!</span>
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
                    <button @click="handleUpdatePayment(orderId, 'Nhận tại cửa hàng', phoneNumber)"
                        class="w-[570px] h-[38px] text-[12px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none mt-[10px]">Tới
                        trang theo dõi đơn</button>
                </div>
            </div>
        </div>
        <Footer />
    </div>
</template>