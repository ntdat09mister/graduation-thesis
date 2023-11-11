<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import IconRightArrow from '@/components/icons/IconRightArrow.vue';
import { defineComponent } from 'vue'
import { mapActions, mapState } from 'pinia';
import { useUserStore } from '@/stores/user';
import router from '@/router';
export default defineComponent({
    components: {
        Header,
        Footer,
        IconRightArrow
    },
    computed: {
        ...mapState(useUserStore, {
            user: 'user'
        })
    },
    data() {
        return {
            userId: 1,
            totalAmountShow: 0
        }
    },
    methods: {
        ...mapActions(useUserStore, ['getInforUser']),
        routerPage(routerName: string) {
            router.push({ name: routerName })
        }
    },
    mounted() {
        this.getInforUser()
    }
})
</script>
<template>
    <div class="w-[1000ox] flex flex-col justify-center items-center">
        <Header />
        <div class="flex items-start mb-[20px]">
            <span class="text-[25px] font-semibold">
                Cảm ơn {{ user?.name }} đã đồng hành cùng Danny's Store:
            </span>
        </div>
        <div class="w-[800px] h-[600px] flex flex-row justify-around">
            <div class="w-[400px] flex flex-col items-center p-4 border">
                <div class="h-[85px] flex flex-row items-center">
                    <span class="text-[20px] mx-auto text-2xl font-semibold">Tên đăng nhập</span>
                </div>
                <div class="h-[85px] flex flex-row items-center">
                    <span class="text-[20px] mx-auto text-2xl font-semibold">Tên khách hàng:</span>
                </div>
                <div class="h-[85px] flex flex-row items-center">
                    <span class="text-[20px] mx-auto text-2xl font-semibold">Giới tính:</span>
                </div>
                <div class="h-[85px] flex flex-row items-center">
                    <span class="text-[20px] mx-auto text-2xl font-semibold">Địa chỉ:</span>
                </div>
                <div class="h-[85px] flex flex-row items-center">
                    <span class="text-[20px] mx-auto text-2xl font-semibold">Số điện thoại:</span>
                </div>
                <div class="h-[85px] flex flex-row items-center">
                    <span class="text-[20px] mx-auto text-2xl font-semibold">Chức danh:</span>
                </div>
                <div class="h-[85px] flex flex-row items-center">
                    <span class="text-[20px] mx-auto text-2xl font-semibold">Ngày tạo tài khoản:</span>
                </div>
            </div>

            <div class="w-[400px] h-[600px] flex flex-col justify-center items-center p-4 border">
                <div class="h-[85px] flex flex-row justify-center items-center">
                    <span class="text-[20px]">{{ user?.username }}</span>
                </div>
                <div class="h-[85px] flex flex-row justify-center items-center">
                    <span class="text-[20px]">{{ user?.name }}</span>
                </div>
                <div class="h-[85px] flex flex-row justify-center items-center">
                    <span class="text-[20px]">{{ user?.gender }}</span>
                </div>
                <div class="h-[85px] flex flex-row justify-center items-center">
                    <span class="text-[20px]">{{ user?.address }}</span>
                </div>
                <div class="h-[85px] flex flex-row justify-center items-center">
                    <span class="text-[20px]">{{ user?.phone }}</span>
                </div>
                <div class="h-[85px] flex flex-row justify-center items-center">
                    <span class="text-[20px]">{{ user?.role }}</span>
                </div>
                <div class="h-[85px] flex flex-row justify-center items-center">
                    <span class="text-[20px]">{{ user?.createdAt }}</span>
                </div>
            </div>
        </div>
        <div class="w-[300px] flex flex-row mt-[30px] justify-between items-center">
            <span class="text-[20px]">Di chuyển tới trang admin</span>
            <a href="" @click="routerPage('adminView')">
            <IconRightArrow class="w-[50px]" />
        </a>
        </div>
        <Footer />
    </div>
</template>