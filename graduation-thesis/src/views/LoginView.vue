<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import { mapActions, mapState } from 'pinia'
import { authStore } from '../stores/auth'
import LogoDannyStore from '@/components/icons/LogoDannyStore.vue'
import { defineComponent } from 'vue'
import router from '@/router'
import { toast } from 'vue3-toastify';
import 'vue3-toastify/dist/index.css';
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
            valueRouter: '',
            showLogin: true,
            showForgotPass: false,
            newPassword: '',
            retypeNewPassword: ''
        }
    },
    methods: {
        handleClick(valueRouter: string) {
            router.push({ name: valueRouter })
        },
        ...mapActions(authStore, ['login']),
        handleLogin(username: string, password: string) {
            toast.success("Thành công")
            setTimeout(() => {
                this.login(username, password); // Call the login function after 2 seconds
            }, 1000);
        },
        handleForgotPassword() {
            this.showForgotPass = true;
            this.showLogin = false;
        },
        handleLoginClick() {
            this.showForgotPass = false;
        }
    }
})
</script>
<template>
    <div class="flex flex-col justify-center items-center">
        <Header />
        <div v-if="showLogin" class="flex flex-col justify-center items-center">
            <div class="text-2xl font-bold mx-auto text-center mt-[40px]">
                <p class="">Đăng nhập vào hệ thống Danny Store</p>
            </div>
            <div class="mr-[30px] ml-[30px] mt-[40px]">
                <a href="" @click="handleClick('home')">
                    <LogoDannyStore class="w-[240px] h-[140px]" />
                </a>
            </div>
            <div class="flex flex-col justify-around items-center h-[200px]">
                <div class="flex flex-col mb-3">
                    <span>Tên đăng nhập:</span>
                    <input v-model="username"
                        class="w-[590px] h-[38px] text-[15px] rounded-xl focus:outline-none border border-gray-300"
                        type="text" placeholder="Nhập username.....">
                </div>
                <div class="flex flex-col mb-3">
                    <span>Mật khẩu:</span>
                    <input v-model="password"
                        class="w-[590px] h-[38px] text-[15px] rounded-xl focus:outline-none border border-gray-300"
                        type="password" placeholder="Nhập password.....">
                </div>
                <button @keydown.enter="login(username, password)"
                    class="w-[150px] h-[38px] text-[15px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none"
                    @click="login(username, password)">
                    Đăng nhập
                </button>
                <div>
                    <span>Chưa có tài khoản? </span>
                    <a href="" @click="handleClick('register')">Đăng ký ngay</a>
                </div>
                <div @click="handleForgotPassword" class="cursor-pointer">
                    <span>Quên mật khẩu</span>
                </div>
            </div>
        </div>
        <div v-if="showForgotPass" class="flex flex-col justify-center items-center">
            <div class="text-2xl font-bold mx-auto text-center mt-[40px]">
                <p class="">Quên mật khẩu</p>
            </div>
            <div class="mr-[30px] ml-[30px] mt-[40px]">
                <a href="" @click="handleClick('home')">
                    <LogoDannyStore class="w-[240px] h-[140px]" />
                </a>
            </div>
            <div class="flex flex-col justify-around items-center h-[200px]">
                <div class="flex flex-col mb-3">
                    <span>Tên đăng nhập:</span>
                    <input v-model="username"
                        class="w-[590px] h-[38px] text-[15px] rounded-xl focus:outline-none border border-gray-300"
                        type="text" placeholder="Nhập username.....">
                </div>
                <div class="flex flex-col mb-3">
                    <span>Số điện thoại:</span>
                    <input
                        class="w-[590px] h-[38px] text-[15px] rounded-xl focus:outline-none border border-gray-300"
                        type="password" placeholder="Nhập số điện thoại.....">
                </div>
                <button
                    class="w-[150px] h-[38px] text-[15px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none">
                    Quên mật khẩu
                </button>
                <div>
                    <span>Chưa có tài khoản? </span>
                    <a href="" @click="handleClick('register')">Đăng ký ngay</a>
                </div>
                <div>
                    <a href="" @click="handleClick('login')">Đăng nhập</a>
                </div>
            </div>
        </div>
        <Footer />
    </div>
</template>
