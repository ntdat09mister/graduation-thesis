<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import { mapActions, mapState } from 'pinia'
import { authStore } from '../stores/auth'
import LogoDannyStore from '@/components/icons/LogoDannyStore.vue'
import { defineComponent } from 'vue'
import router from '@/router'
export default defineComponent({
    components: {
        Header,
        Footer,
        LogoDannyStore
    },
    computed: {
        ...mapState(authStore, {

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
            seletedGender: 'N/A'
        }
    },
    methods: {
        handleClick(valueRouter: string) {
            router.push({ name: valueRouter })
        },
        ...mapActions(authStore, ['register'])
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
        <div class="flex flex-col justify-around items-center h-[500px]">
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
                <span>Nhập tên của bạn:</span>
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
            <div class="flex flex-col mb-3">
                <span>Nhập địa chỉ:</span>
                <input v-model="address"
                    class="w-[590px] h-[38px] text-[15px] rounded-xl focus:outline-none border border-gray-300" type="text"
                    placeholder="Nhập địa chỉ.....">
            </div>
            <div class="flex flex-col mb-3">
                <span>Nhập sđt:</span>
                <input v-model="phone"
                    class="w-[590px] h-[38px] text-[15px] rounded-xl focus:outline-none border border-gray-300" type="text"
                    placeholder="Nhập số điện thoại.....">
            </div>
            <button
                class="w-[150px] h-[38px] text-[15px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none"
                @click="register(username, password, retypePassword, name, phone, address, seletedGender)">
                Đăng ký
            </button>
            <div>
                <span>Đã tài khoản? </span>
                <a href="" @click="handleClick('login')">Đăng nhập ngay</a>
            </div>
        </div>
        <Footer />
    </div>
</template>
