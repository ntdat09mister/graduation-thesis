<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import { mapActions, mapState } from 'pinia'
import { uathStore } from '../stores/auth'
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
        ...mapState(uathStore, {

        })
    },
    data() {
        return {
            username: '',
            password: ''
        }
    },
    methods: {
        handleClick() {
            router.push({ name: 'home' })
        },
        ...mapActions(uathStore, ['login'])
    }
})
</script>
<template>
    <div class="flex flex-col justify-center items-center">
        <Header />
        <div class="text-2xl font-bold mx-auto text-center mt-[40px]">
            <p class="">Đăng nhập vào hệ thống Danny Store</p>
        </div>
        <div class="mr-[30px] ml-[30px] mt-[40px]">
            <a href="" @click="handleClick()">
                <LogoDannyStore class="w-[240px] h-[140px]" />
            </a>
        </div>
        <div class="flex flex-col justify-around items-center h-[200px]">
            <input v-model="username"
                class="w-[590px] h-[38px] text-[15px] rounded-xl focus:outline-none border border-gray-300 " type="text"
                placeholder="Nhập username.....">
            <input v-model="password"
                class="w-[590px] h-[38px] text-[15px] rounded-xl focus:outline-none border border-gray-300 " type="password"
                placeholder="Nhập password.....">
            <button
                class="w-[150px] h-[38px] text-[15px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none" @click="login(username, password)">
                Login
            </button>
        </div>
        <Footer />
    </div>
</template>
