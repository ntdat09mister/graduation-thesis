<script lang="ts">
import { defineComponent } from 'vue';
import LogoDannyStore from '@/components/icons/LogoDannyStore.vue'
import IconIphone from '@/components/icons/IconIphone.vue'
import IconIpad from '@/components/icons/IconIpad.vue'
import IconAccessories from '@/components/icons/IconAccessories.vue'
import IconFixing from '@/components/icons/IconFixing.vue'
import IconAboutUs from '@/components/icons/IconAboutUs.vue'
import IconCall from '@/components/icons/IconCall.vue'
import IconLocal from '@/components/icons/IconLocal.vue'
import IconOrderLookUp from './icons/IconOrderLookUp.vue';
import IconCart from './icons/IconCart.vue';
import IconLogin from './icons/IconLogin.vue';
import router from '@/router';
import IconSearch from './icons/IconSearch.vue';
import IconLogout from './icons/IconLogout.vue';
import IconInformationMySelf from './icons/IconInformationMySelf.vue';
import { useSearchStore } from '@/stores/search';
import { authStore } from '@/stores/auth';
import { mapActions, mapState } from 'pinia';
import { useUserStore } from '@/stores/user'

import { toast } from 'vue3-toastify';
export default defineComponent({
    components: {
        LogoDannyStore,
        IconIphone,
        IconIpad,
        IconAccessories,
        IconFixing,
        IconAboutUs,
        IconCall,
        IconLocal,
        IconOrderLookUp,
        IconCart,
        IconLogin,
        IconSearch,
        IconInformationMySelf,
        IconLogout
    },
    state: () => ({
        searchKeywordGlobal: sessionStorage.getItem("searchKeyword"),
        authenticatedBoolean: localStorage.getItem("authenticated")
    }),
    computed: {
        ...mapState(authStore, {
            authenticated: 'authenticated'
        }),
        ...mapState(useUserStore, {
            user: 'user'
        })
    },
    data() {
        return {
            searchKeyword: '',
            filterId: '1'
        }
    },
    methods: {
        handleClick() {
            router.push({ name: 'home' })
        },
        routerCart() {
            router.push({ name: 'cart' })
        },
        setVModelInput() {
            this.searchKeyword = String(sessionStorage.getItem("searchKeyword"))
            console.log("123")
        },
        ...mapActions(useSearchStore, ['getListSearch']),
        ...mapActions(useUserStore, ['getInforUser']),
        handleSearch() {
            const keyword = this.searchKeyword
            const filterId = this.filterId
            sessionStorage.setItem("searchKeyword", keyword)
            sessionStorage.setItem("filterId", filterId)
            this.getListSearch(String(sessionStorage.getItem("searchKeyword")), String(sessionStorage.getItem("filterId")))
            console.log(this.searchKeyword)
            router.push({ name: 'search' }).then(() => {
                location.reload();
            });
            this.setVModelInput()
        },
        handleEnter() {
            const keyword = this.searchKeyword;
            const filterId = this.filterId
            sessionStorage.setItem("searchKeyword", keyword)
            sessionStorage.setItem("filterId", filterId)
            this.getListSearch(String(sessionStorage.getItem("searchKeyword")), String(sessionStorage.getItem("filterId")))
            console.log(this.searchKeyword);
            router.push({ name: 'search' }).then(() => {
                location.reload();
            });
            this.setVModelInput()
        },
        routerPage(routerName: string) {
            router.push({ name: routerName })
        },
        logout() {
            localStorage.removeItem("accessToken"),
                localStorage.removeItem("authenticated")
            toast.success("Đăng xuất thành công")
            router.push({ name: 'home' }).then(() => {
                location.reload();
            });
        }
    },
    mounted() {
        this.getInforUser()
    }

})
</script>

<template>
    <div class="w-[100%] flex flex-col justify-center items-center mb-[20px]">
        <div class="w-[100%] h-[40px] flex flex-row justify-center item-center bg-[#e9efff]">
            <img src="https://cdn2.cellphones.com.vn/x30,webp,q100/https://dashboard.cellphones.com.vn/storage/top-banner-chinh-sach-bao-hanh-doi-tra.png"
                alt="">
            <img src="https://cdn2.cellphones.com.vn/x30,webp,q100/https://dashboard.cellphones.com.vn/storage/top-banner-chinh-hang-xuat-vat-day-du.png"
                alt="">
            <img src="https://cdn2.cellphones.com.vn/x30,webp,q100/https://dashboard.cellphones.com.vn/storage/top-banner-giao-nhanh-mien-phi.png"
                alt="">
        </div>
        <div class="w-[100%] flex justify-center items-center bg-[#e9efff]">
            <div class="w-[1300px] flex flex-row justify-between items-center mt-[10px]">
                <div class="mr-[30px] ml-[30px]">
                    <a href="" @click="handleClick()">
                        <LogoDannyStore class="w-[120px] h-[70px]" />
                    </a>
                </div>
                <div class="w-[650px] h-[42px] border-[2px] flex justify-between items-center border-red-500 rounded-xl">
                    <div action="" class="flex flex-row items-center" @keydown.enter="handleEnter">
                        <div class="w-[590px] h-[42px] flex items-center">
                            <input class="w-[590px] h-[38px] text-[15px] rounded-xl focus:outline-none" type="text"
                                placeholder="Nhập tên sản phẩm, từ khóa cần tìm kiếm...." v-model="searchKeyword">
                        </div>
                        <div class="w-[62px] h-[42px] flex justify-center items-center rounded-xl bg-[red] cursor-pointer"
                            @click="handleSearch()">
                            <IconSearch class="w-[22px] h-[22px] fill-white" />
                        </div>
                    </div>
                </div>
                <div class="w-[350px] flex flex-row justify-around">
                    <div class="flex flex-col justify-center items-center">
                        <IconCall class="w-[30px]" />
                        <span class="text-[12px]">Liên hệ</span>
                    </div>
                    <div class="flex flex-col justify-center items-center cursor-pointer" @click="routerPage('order')">
                        <IconOrderLookUp class="w-[30px]" />
                        <span class="text-[12px]">Tra cứu đơn hàng</span>
                    </div>
                    <div class="flex flex-col justify-center items-center">
                        <a href="" @click="routerCart()">
                            <IconCart class="w-[30px]" />
                        </a>
                        <span class="text-[12px]">Giỏ hàng</span>
                    </div>
                    <div class="flex flex-row justify-center items-center">
                        <template v-if="authenticated">
                            <div class="w-[90px] flex flex-col justify-center items-center">
                                <IconInformationMySelf class="w-[30px] cursor-pointer" @click="routerPage('profile')" />
                                <span class="text-[12px]">{{ user?.name }}</span>
                            </div>
                            <div class="flex flex-col justify-center items-center cursor-pointer">
                                <a href="" @click="logout()">
                                    <IconLogout class="w-[30px]" />
                                </a>
                                <span class="text-[12px]">Đăng xuất</span>
                            </div>
                        </template>
                        <template v-else>
                            <div class="flex flex-col justify-center items-center">
                                <a href="" @click="routerPage('login')">
                                    <IconLogin class="w-[30px]" />
                                </a>
                                <span class="text-[12px]">Đăng nhập</span>
                            </div>
                        </template>
                    </div>
                </div>
            </div>
        </div>

    </div>
</template>