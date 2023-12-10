<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import { mapActions, mapState } from 'pinia'
import { authStore } from '../stores/auth'
import LogoDannyStore from '@/components/icons/LogoDannyStore.vue'
import { defineComponent } from 'vue'
import { useOrderStore } from '@/stores/order'
import router from '@/router'
export default defineComponent({
    components: {
        Header,
        Footer,
        LogoDannyStore
    },
    computed: {
        ...mapState(authStore, {
        }),
        ...mapState(useOrderStore, {
            listProvinces: 'listProvinces',
            listDistricts: 'listDistricts',
            listWards: 'listWards',
            adressSelected: 'adressSelected'
        })
    },
    data() {
        return {
            username: '',
            password: '',
            retypePassword: '',
            name: '',
            phone: '',
            valueRouter: '',
            address: '',
            seletedGender: 'N/A',
            provinceId: 1,
            districtId: 1,
            wardsId: 1,
        }
    },
    methods: {
        handleClick(valueRouter: string) {
            router.push({ name: valueRouter })
        },
        ...mapActions(authStore, ['register']),
        ...mapActions(useOrderStore, ['getListProvinces', 'getListDistrictOfProvince', 'getListWardsOfDistrict', 'concatAddress']),
        handleGetListWards(districtIdSelected: number) {
            districtIdSelected = this.districtId
            this.getListWardsOfDistrict(districtIdSelected)
        },
        concatAddressHandle(wardsId: number, districtId: number, provinceId: number) {
            console.log(wardsId, districtId, provinceId)
            wardsId = this.wardsId
            this.concatAddress(wardsId, districtId, provinceId)
        },
        handleGetListDistrict(provinceIdSelected: number) {
            provinceIdSelected = this.provinceId
            this.getListDistrictOfProvince(provinceIdSelected)
        }
    },
    mounted() {
        this.getListProvinces(),
            this.getListDistrictOfProvince(this.districtId),
            this.getListWardsOfDistrict(this.wardsId),
            this.concatAddressHandle(this.wardsId, this.districtId, this.provinceId)
    }
})
</script>
<template>
    <div class="flex flex-col justify-center items-center">
        <Header />
        <div class="text-2xl font-bold mx-auto text-center mt-[40px]">
            <p class="">Đăng ký tài khoản Danny Store</p>
        </div>
        <div class="mr-[30px] ml-[30px] mt-[40px] mb-3">
            <a href="" @click="handleClick('home')">
                <LogoDannyStore class="w-[240px] h-[140px]" />
            </a>
        </div>
        <div class="flex flex-col justify-around items-center h-[600px]">
            <div class="flex flex-col mb-3">
                <span>Tên tài khoản:</span>
                <input v-model="username"
                    class="w-[590px] h-[38px] text-[15px] rounded-xl focus:outline-none border border-gray-300" type="text"
                    placeholder="Nhập username.....">
            </div>
            <div class="flex flex-col mb-3">
                <span>Mật khẩu:</span>
                <input v-model="password"
                    class="w-[590px] h-[38px] text-[15px] rounded-xl focus:outline-none border border-gray-300"
                    type="password" placeholder="Nhập password.....">
            </div>
            <div class="flex flex-col mb-3">
                <span>Nhập lại mật khẩu:</span>
                <input v-model="retypePassword"
                    class="w-[590px] h-[38px] text-[15px] rounded-xl focus:outline-none border border-gray-300"
                    type="password" placeholder="Nhập lại password.....">
            </div>
            <div class="flex flex-col mb-3">
                <span>Họ tên:</span>
                <input v-model="name"
                    class="w-[590px] h-[38px] text-[15px] rounded-xl focus:outline-none border border-gray-300" type="text"
                    placeholder="Nhập tên của bạn.....">
            </div>
            <div class="flex flex-col mb-3">
                <span>Giới tính:</span>
                <select class="w-[590px] h-[38px] text-[14px] rounded-xl focus:outline-none border border-gray-300"
                    v-model="seletedGender">
                    <option value="1">Nam</option>
                    <option value="0">Nữ</option>
                    <option value="">N/A</option>
                </select>
            </div>
            <div class="flex flex-row mb-3">
                <div class="w-[200px] h-[80px] flex flex-col justify-center items-center">
                    <span>Chọn tỉnh thành</span>
                    <select v-model="provinceId" @change="handleGetListDistrict(provinceId)"
                        class="w-[120px] h-[38px] text-[14px] rounded-xl focus:outline-none border border-gray-300">
                        <option v-for="province in listProvinces" :value=province.provinceId>{{
                            province.name }}</option>
                    </select>
                </div>
                <div class="w-[200px] h-[80px] flex flex-col justify-center items-center">
                    <span>Chọn quận huyện</span>
                    <select v-model="districtId" @change="handleGetListWards(districtId)"
                        class="w-[150px] h-[38px] text-[14px] rounded-xl focus:outline-none border border-gray-300">
                        <option v-for="district in listDistricts" :value=district.districtId>{{
                            district.name }}
                        </option>
                    </select>
                </div>
                <div class="w-[200px] h-[80px] flex flex-col justify-center items-center">
                    <span>Chọn xã phường</span>
                    <select v-model="wardsId" @change="concatAddressHandle(wardsId, districtId, provinceId)"
                        class="w-[150px] h-[38px] text-[14px] rounded-xl focus:outline-none border border-gray-300">
                        <option v-for="wards in listWards" :value=wards.wardsId>{{
                            wards.name }}</option>
                    </select>
                </div>
            </div>
            <div class="flex flex-col mb-3">
                <span>Địa chỉ:</span>
                <span class="w-[590px] h-[38px] text-[15px] flex items-center rounded-xl border border-gray-300">{{
                    adressSelected }}</span>
            </div>
            <div class="flex flex-col mb-3">
                <span>Nhập sđt:</span>
                <input v-model="phone"
                    class="w-[590px] h-[38px] text-[15px] rounded-xl focus:outline-none border border-gray-300" type="text"
                    placeholder="Nhập số điện thoại.....">
            </div>
            <div class="h-[35px]">
                <button
                    class="w-[150px] h-[35px] text-[15px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none"
                    @click="register(username, password, retypePassword, name, phone, adressSelected, seletedGender)">
                    Đăng ký
                </button>
            </div>
            <div>
                <span>Đã tài khoản? </span>
                <a href="" @click="handleClick('login')">Đăng nhập ngay</a>
            </div>
        </div>
        <Footer />
    </div>
</template>
