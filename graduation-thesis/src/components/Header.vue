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
        IconLogin
    },
    methods: {
        handleClick() {
            router.push({ name: 'home' })
        }
    }
})
</script>

<template>
    <div class="w-[100%] flex flex-col justify-center items-center">
        <div class="w-[100%] h-[40px] flex flex-row justify-center item-center bg-[#e9efff]">
            <img src="https://cdn2.cellphones.com.vn/x30,webp,q100/https://dashboard.cellphones.com.vn/storage/top-banner-chinh-sach-bao-hanh-doi-tra.png"
                alt="">
            <img src="https://cdn2.cellphones.com.vn/x30,webp,q100/https://dashboard.cellphones.com.vn/storage/top-banner-chinh-hang-xuat-vat-day-du.png"
                alt="">
            <img src="https://cdn2.cellphones.com.vn/x30,webp,q100/https://dashboard.cellphones.com.vn/storage/top-banner-giao-nhanh-mien-phi.png"
                alt="">
        </div>
        <div class="w-[1200px] flex flex-row justify-center items-center">
            <div class="w-[500px] flex flex-row justify-between">
                <div class="flex flex-col justify-center items-center">
                    <IconIphone width="40px" />
                    <span>iPhone</span>
                </div>
                <div class="flex flex-col justify-center items-center">
                    <IconIpad />
                    <span>iPad</span>
                </div>
                <div class="flex flex-col justify-center items-center">
                    <IconAccessories width="40px" />
                    <span>Phụ kiện</span>
                </div>
                <div class="flex flex-col justify-center items-center">
                    <IconFixing />
                    <span>Linh kiện</span>
                </div>
                <div class="flex flex-col justify-center items-center">
                    <IconAboutUs />
                    <span>Về chúng tôi</span>
                </div>
            </div>
            <div class="mr-[30px] ml-[30px]">
                <a href="" @click="handleClick()"><LogoDannyStore class="w-[140px] h-[100px]" /></a>
            </div>
            <div class="w-[500px] flex flex-row justify-between">
                <div class="flex flex-col justify-center items-center">
                    <IconCall />
                    <span>Liên hệ</span>
                </div>
                <div class="flex flex-col justify-center items-center">
                    <IconLocal />
                    <span>Cửa hàng gần bạn</span>
                </div>
                <div class="flex flex-col justify-center items-center">
                    <IconOrderLookUp />
                    <span>Tra cứu đơn hàng</span>
                </div>
                <div class="flex flex-col justify-center items-center">
                    <IconCart />
                    <span>Giỏ hàng</span>
                </div>
                <div class="flex flex-col justify-center items-center">
                    <IconLogin />
                    <span>Đăng nhập</span>
                </div>
            </div>
        </div>
    </div>
</template>