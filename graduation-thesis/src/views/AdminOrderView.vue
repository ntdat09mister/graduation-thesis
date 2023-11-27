<script lang="ts">
import Header from '@/components/Header.vue';
import Footer from '@/components/Footer.vue';
import IconShowNaviDB from '@/components/icons/IconShowNaviDB.vue';
import IconRevenue from '@/components/icons/IconRevenue.vue';
import IconRightArrow from '@/components/icons/IconRightArrow.vue';
import IconLeftArrow from '@/components/icons/IconLeftArrow.vue';
import IconCheckListOrder from '@/components/icons/IconCheckListOrder.vue';
import IconUpdateStatusOrder from '@/components/icons/IconUpdateStatusOrder.vue'
import { defineComponent } from 'vue';
import { mapActions, mapState } from 'pinia';
import { useOrderStore } from '@/stores/order';
import { useAdminStore } from '@/stores/admin';
import { useUserStore } from '@/stores/user';
import router from '@/router';

export default defineComponent({
    components: {
        Header,
        Footer,
        IconShowNaviDB,
        IconRevenue,
        IconCheckListOrder,
        IconUpdateStatusOrder,
        IconLeftArrow,
        IconRightArrow
    },
    data() {
        return {
            pageSize: 8,
            listUnderDashBoard: [
                { component: IconCheckListOrder, name: 'Số đơn hàng', value: '50' },
                { component: IconRevenue, name: 'Doanh thu', value: '50000000' }
            ],
            selected: Number(localStorage.getItem("selectedFilter")),
            currentPage: Number(sessionStorage.getItem("changePageOrderAdmin"))
        };
    },
    computed: {
        ...mapState(useOrderStore, {
            listOrders: 'listOrders',
        }),
        ...mapState(useAdminStore, {
            listOrdersAdmin: 'listOrdersAdmin',
            listDisplayOrderAdmin: 'listDisplayOrderAdmin',
            totalAmount: 'totalAmount',
            totalOrders: 'totalOrders',
            successOrders: 'successOrders',
            ordersReceived: 'ordersReceived'
        }),
        ...mapState(useUserStore, {
            user: 'user'
        })
    },
    methods: {
        ...mapActions(useAdminStore, ['getInforUser', 'getAllOrdersAdmin', 'setPage', 'updateStatusOrder']),
        handlePageChange(newPage: number) {
            this.currentPage = newPage;
            sessionStorage.setItem("changePageOrderAdmin", String(newPage));
        },
        changeBackground(value: number) {
            this.selected = value;
            localStorage.setItem("selectedFilter", String(this.selected));
            this.getAllOrdersAdmin(this.selected)
        },
        routerPage(routerName: string) {
            router.push({ name: routerName })
        },
        checkNullSelected() {
            if (this.selected == null) {
                this.selected == 1;
            }
        },
        handlePageChangeMounted() {
            if (sessionStorage.getItem("changePageOrderAdmin")) {
                this.setPage(Number(sessionStorage.getItem("changePageOrderAdmin")))
            } else {
                this.setPage(1);
            }
        },
        handleFilterSelected() {
            if (localStorage.getItem("selectedFilter")) {
                this.getAllOrdersAdmin(this.selected)
            } else {
                this.getAllOrdersAdmin(1)
            }
        }
    },
    mounted() {
        this.handleFilterSelected(),
        this.handlePageChangeMounted()
    }
});
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
                        Quản lý đơn hàng
                    </span>
                </div>
            </div>
            <div class="w-[1438px] h-[98px] flex flex-row justify-around">
                <div class="w-[650px] h-[98px] flex flex-row rounded-[10px] bg-[#FFFFFF]">
                    <div class="w-[650px] h-[98px] flex flex-row justify-around items-center">
                        <div>
                            <IconCheckListOrder class="w-[60px] h-[60px]" />
                        </div>
                        <div class="flex flex-col justify-center items-center">
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 18px;line-height: 21px;color: #1B51E5;">Số
                                đơn hàng</span>
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 20px;line-height: 32px;color: #1C1D21;">{{
                                    totalOrders }}</span>
                        </div>
                        <div class="flex flex-col justify-center items-center">
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 18px;line-height: 21px;color: #1B51E5;">Số
                                đơn hàng chờ xác nhận</span>
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 20px;line-height: 32px;color: #1C1D21;">{{
                                    ordersReceived }}</span>
                        </div>
                    </div>
                </div>
                <div class="w-[650px] h-[98px] flex flex-row rounded-[10px] bg-[#FFFFFF]">
                    <div class="w-[650px] h-[98px] flex flex-row justify-around items-center">
                        <div>
                            <IconRevenue class="w-[60px] h-[60px]" />
                        </div>
                        <div class="flex flex-col justify-center items-center">
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 18px;line-height: 21px;color: #1B51E5;">Số
                                đơn hoàn thành</span>
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 20px;line-height: 32px;color: #1C1D21;">{{
                                    successOrders }}</span>
                        </div>
                        <div class="flex flex-col justify-center items-center">
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 18px;line-height: 21px;color: #1B51E5;">Doanh
                                thu</span>
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 20px;line-height: 32px;color: #1C1D21;">{{
                                    totalAmount }}</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="w-[1438px] h-[86px] flex flex-row rounded-[12px]">
                <div class="w-[1381px] h-[66px] flex flex-row justify-between items-center ml-[24px]">
                    <span
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 27px;color: #1C1D21;">Latest
                        sales</span>
                    <div class="flex flex-row">
                        <template
                            v-for="(value, index) in [{ label: 'Day', key: 2 }, { label: 'Month', key: 3 }, { label: 'Year', key: 4 }, { label: 'Tất cả', key: 1 }]">
                            <div @click="changeBackground(value.key)"
                                :class="{ 'w-[62px] h-[40px] flex justify-center items-center cursor-pointer': selected !== value.key, 'w-[62px] h-[40px] flex justify-center items-center cursor-pointer border bg-red-100 border-solid border-red-600 rounded-xl': selected === value.key }">
                                <span
                                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 17px;text-align: center;color: #1C1D21;">{{
                                        value.label }}</span>
                            </div>
                        </template>
                    </div>
                </div>
            </div>
            <div class="w-[1381px] h-[48px] flex flex-row justify-between items-center">
                <div class="w-[80px] h-[80px] flex justify-center items-center">
                    <span
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Mã
                        đơn</span>
                </div>
                <div class="w-[80px] h-[80px] flex justify-center items-center">
                    <span
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Sản
                        phẩm</span>
                </div>
                <div class="w-[160px] h-[80px] flex justify-center items-center">
                    <span
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Tên
                        sản phẩm</span>
                </div>
                <div class="w-[160px] h-[80px] flex flex-col justify-center items-center">
                    <span
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Khách
                        hàng</span>
                </div>
                <div class="w-[160px] h-[80px] flex justify-center items-center">
                    <span
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Địa
                        chỉ</span>
                </div>
                <div class="w-[130px] h-[80px] flex justify-center items-center">
                    <span
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Ngày
                        tạo đơn</span>
                </div>
                <div class="w-[130px] h-[80px] flex justify-center items-center">
                    <span
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Số
                        tiền</span>
                </div>
                <div class="w-[130px] h-[80px] flex items-center">
                    <span
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Trạng
                        thái</span>
                </div>
                <div class="w-[50px] h-[40px] flex justify-center items-center"></div>
            </div>
            <div class="w-[1381px] h-[649px]">
                <div v-for="item in listDisplayOrderAdmin"
                    class="w-[1381px] h-[80px] flex flex-row justify-between items-center">
                    <div class="w-[80px] h-[80px] flex justify-center items-center">
                        <span class="w-[80px] h-[80px] flex justify-center items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.id }}
                        </span>
                    </div>
                    <div class="w-[80px] h-[80px] flex justify-center items-center">
                        <img class="w-[52px] h-[52px] ml-[25px]" :src="item.src" alt="product-img">
                    </div>
                    <div class="w-[160px] h-[80px] flex items-center">
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.listProducts }}
                        </span>
                    </div>
                    <div class="w-[160px] h-[80px] flex flex-col justify-center items-center">
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.username }}
                        </span>
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.phoneNumber }}
                        </span>
                    </div>
                    <div class="w-[160px] h-[80px] flex justify-center items-center">
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.address }}
                        </span>
                    </div>
                    <span class="w-[130px] h-[80px] flex justify-center items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                        {{ item.createdAt }}
                    </span>
                    <span class="w-[130px] h-[80px] flex justify-center items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                        {{ item.totalAmount }}
                    </span>
                    <div class="w-[130px] h-[80px] flex flex-row justify-between items-center">
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 17px;text-align: center;color: #1B51E5;">
                            {{ item.status }}
                        </span>
                    </div>
                    <div class="w-[50px] h-[40px] flex justify-center items-center">
                        <button @click="updateStatusOrder(item.id)"
                            class="w-[50px] h-[30px] text-[12px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none">Update</button>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div class="flex justify-center items-center mt-[30px]">
                <el-pagination :page-size="pageSize" :total="listOrdersAdmin.length" :current-page.sync="currentPage"
                    @current-change="handlePageChange" @click="setPage(Number(currentPage))" />
            </div>
        </div>
        <template v-if="user?.role === 'admin'">
            <div class="w-[1438px] flex flex-row justify-between items-center">
            <div class="w-[400px] h-[50px] flex flex-row mt-[30px] items-center">
                <button @click="routerPage('adminProductView')"
                    class="w-[70px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Step -
                    Left</button>
                <span class="text-[13px] ml-[10px]">Di chuyển tới trang quản sản phẩm</span>
            </div>
            <div class="w-[400px] h-[50px] flex flex-row mt-[30px] items-center">
                <span class="text-[13px] mr-[10px]">Di chuyển tới trang quản người dùng</span>
                <button @click="routerPage('adminUserView')"
                    class="w-[70px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Step -
                    right</button>
            </div>
        </div>
        </template>
    </div>
    <Footer />
</template>