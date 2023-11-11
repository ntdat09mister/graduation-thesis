<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import IconShowNaviDB from '@/components/icons/IconShowNaviDB.vue';
import { defineComponent } from 'vue'
import { mapActions, mapState } from 'pinia';
import { useOrderStore } from '@/stores/order';
import { useAdminStore } from '@/stores/admin';
export default defineComponent({
    components: {
        Header,
        Footer,
        IconShowNaviDB
    },
    computed: {
        ...mapState(useOrderStore, {
            listOrders: 'listOrders'
        }),
        ...mapState(useAdminStore, {
            listOrdersAdmin: 'listOrdersAdmin'
        })
    },
    methods: {
        ...mapActions(useAdminStore, ['getInforUser','getAllOrdersAdmin'])
    },
    data() {
        return {
            listUnderDashBoard: [
                { name: 'New Sales', value: '1.345', icon: '<IconShowNaviDB />' },
                { name: 'New leads', value: '2.890' },
                { name: 'Income per lead', value: '$1.870' },
                { name: 'Conversion rate', value: '5.10%' }
            ],
            listStatistical: [
                { name: 'Day' },
                { name: 'Week' },
                { name: 'Month' },
            ],
            pages: [
                { number: 1 }, { number: 2 }, { number: 3 }, { number: 4 }, { number: 5 }
            ]
        }
    },
    mounted() {
        this.getAllOrdersAdmin()
    }
})
</script>
<template>
    <div class="flex flex-col justify-center items-center">
        <Header />
        <div class="w-[1438px] h-[1020] bg-[#F2F2F2]">
            <div class="w-[1438px] h-[84px] flex flex-row justify-between items-center">
                <div class="flex flex-row">
                    <div
                        class="w-[36px] h-[36px] flex justify-center items-center rounded-[6px] ml-[28px] bg-[#5E81F41A] cursor-pointer">
                        <IconShowNaviDB />
                    </div>
                    <span class="ml-[20px]"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 20px;line-height: 32px;color: #1C1D21;">
                        Admin
                    </span>
                </div>
            </div>
            <div class="w-[1438px] h-[98px] flex flex-row justify-around">
                <div v-for="item in listUnderDashBoard"
                    class="w-[324px] h-[98px] flex flex-row justify-between rounded-[10px] bg-[#FFFFFF]">
                    <div class="flex flex-col justify-center ml-[18px]">
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 14px;line-height: 21px;color: #8181A5;">{{
                                item.name }}</span>
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 20px;line-height: 32px;color: #1C1D21;">{{
                                item.value }}</span>
                    </div>
                    <div class="flex items-center mr-[24px]">
                        <IconNewSales />
                    </div>
                </div>
            </div>
            <div class="w-[1152px] h-[86px] flex flex-row rounded-[12px]">
                <div class="w-[1381px] h-[66px] flex flex-row justify-between items-center ml-[24px]">
                    <span
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 27px;color: #1C1D21;">Latest
                        sales</span>
                    <div class="flex flex-row">
                        <div class="w-[62px] h-[40px]" v-for="item in listStatistical">
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 17px;text-align: center;color: #1C1D21;">
                                {{ item.name }}
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="w-[1381px] h-[48px] flex flex-row justify-between items-center">
                <span class="ml-[26px]"
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #8181A5;">Product</span>
                <span class="ml-[189px]"
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #8181A5;">Customer</span>
                <span class="ml-[176px]"
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #8181A5;">Delivery</span>
                <span class="ml-[372px]"
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #8181A5;">Subtotal</span>
                <span class="ml-[40px]"
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #8181A5;">Shipping</span>
                <span class="ml-[61px]"
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #8181A5;">Total</span>
            </div>
            <div class="w-[1381px] h-[649px]">
                <div v-for="item in listOrdersAdmin" class="w-[1381px] h-[80px] flex flex-row justify-between items-center">
                    <img class="w-[52px] h-[52px] ml-[25px]" :src="item.src" alt="product-img">
                    <div class="flex flex-col ml-[16px]">
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.listProducts }}
                        </span>
                    </div>
                    <div class="flex flex-col ml-[72px]">
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.username }}
                        </span>
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.nameCustomer }}
                        </span>
                    </div>
                    <div class="flex flex-col ml-[73px]">
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.address }}
                        </span>
                    </div>
                    <div class="w-[98px] h-[36px] flex justify-center items-center ml-[53px]">
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 17px;text-align: center;color: #1B51E5;">
                            {{ item.status }}
                        </span>
                    </div>
                    <span class="ml-[50px]"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                        {{ item.totalAmount }}
                    </span>
                    <span class="mr-[39px]"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                        {{ item.createdAt }}
                    </span>
                    <span class="mr-[23px]"
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                    {{ item.totalAmount }}
                </span>
            </div>
            <div class="flex flex-row justify-between items-center">
                <IconPrevPage class="cursor-pointer" />
                <div class="w-[212px] flex flex-row justify-between">
                    <div v-for="item in pages" class="flex flex-row">
                        <div
                            class="w-[50px] h-[50px] flex justify-center items-center hover:border-b-[2px] border-[#5E81F4]">
                            <div
                                class="w-[36px] h-[36px] flex justify-center items-center cursor-pointer bg-[#5E81F41A] hover:bg-[#3648831a]">
                                <span>
                                    {{ item.number }}
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <IconNextPage class="cursor-pointer" />
            </div>
        </div>
    </div>
    <Footer />
</div></template>