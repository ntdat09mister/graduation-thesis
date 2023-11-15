<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import IconShowNaviDB from '@/components/icons/IconShowNaviDB.vue'
import IconRevenue from '@/components/icons/IconRevenue.vue'
import IconCheckListOrder from '@/components/icons/IconCheckListOrder.vue'
import IconUpdateStatusOrder from '@/components/icons/IconUpdateStatusOrder.vue'
import IconRightArrow from '@/components/icons/IconRightArrow.vue'
import IconLeftArrow from '@/components/icons/IconLeftArrow.vue'
import { defineComponent, ref } from 'vue'
import { mapActions, mapState } from 'pinia'
import { useOrderStore } from '@/stores/order'
import { useUserStore } from '@/stores/user'
import router from '@/router'

export default defineComponent({
    components: {
        Header,
        Footer,
        IconShowNaviDB,
        IconRevenue,
        IconCheckListOrder,
        IconUpdateStatusOrder,
        IconRightArrow,
        IconLeftArrow,
    },
    setup() {
        const isPopupVisible = ref(false);

        const showPopup = () => {
            isPopupVisible.value = true;
        };

        const hidePopup = () => {
            isPopupVisible.value = false;
        };

        return {
            isPopupVisible,
            showPopup,
            hidePopup,
        };
    },
    data() {
        return {
            pageSize: 8,
            currentPage: Number(sessionStorage.getItem("changePageUserAdmin")),
            listUnderDashBoard: [
                { name: 'Số đơn hàng hôm nay', value: '50' },
                { name: 'Doanh thu', value: '50000000' }
            ],
            selected: 2,
            showPopup: false,
            notificationMessage: "Đạt đẹp trai",
            showModify: false,
            valueId: 1,
            seletedRole: "none",
            usernameOuput: "",
            nameOuput: "",
            addressOuput: "",
            phoneOuput: "",
            seletedGender: "none"
        };
    },
    computed: {
        ...mapState(useOrderStore, {
            listOrders: 'listOrders'
        }),
        ...mapState(useUserStore, {
            listDisplayUsersAdmin: 'listDisplayUsersAdmin',
            listUsersAdmin: 'listUsersAdmin'
        })
    },
    methods: {
        ...mapActions(useUserStore, ['getProductsAdmin', 'setPage', 'updateUser']),
        handlePageChange(newPage: number) {
            this.currentPage = newPage;
            sessionStorage.setItem("changePageUserAdmin", String(newPage));
        },
        routerPage(routerName: string) {
            router.push({ name: routerName })
        },
        modifyUser(id: number, username: string, name: string, gender: string, address: string, phone: string, role: string) {
            this.valueId = id;
            this.usernameOuput = username,
                this.nameOuput = name,
                this.seletedGender = gender,
                this.addressOuput = address,
                this.phoneOuput = phone,
                this.seletedRole = role,
                this.showModify = true
        },
        saveUser() {
            this.showModify = false;
        }
    },
    mounted() {
        this.getProductsAdmin(),
        this.setPage(Number(sessionStorage.getItem("changePageUserAdmin")))
    }
});
</script>
<template>
    <div class="flex flex-col justify-center items-center">
        <Header />
        <div class="flex flex-col justify-center items-center">
            <div class="w-[1438px] h-[1020] flex flex-col bg-[#F2F2F2]">
                <div class="w-[1438px] h-[84px] flex flex-row justify-between items-center">
                    <div class="flex flex-row">
                        <div
                            class="w-[36px] h-[36px] flex justify-center items-center rounded-[6px] ml-[28px] bg-[#5E81F41A] cursor-pointer">
                            <IconShowNaviDB />
                        </div>
                        <span class="ml-[20px]"
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 20px;line-height: 32px;color: #1C1D21;">
                            Quản lý người dùng
                        </span>
                    </div>
                </div>
                <div class="w-[1438px] h-[98px] flex flex-row justify-around">
                    <div v-for="item in listUnderDashBoard"
                        class="w-[650px] h-[98px] flex flex-row rounded-[10px] bg-[#FFFFFF]">
                        <div class="w-[650px] h-[98px] flex flex-row justify-around items-center">
                            <div>
                                <IconRevenue class="w-[60px] h-[60px]" />
                            </div>
                            <div class="flex flex-col justify-center items-center ml-[300px]">
                                <span
                                    style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 18px;line-height: 21px;color: #1B51E5;">{{
                                        item.name }}</span>
                                <span
                                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 20px;line-height: 32px;color: #1C1D21;">{{
                                        item.value }}</span>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="w-[1438px] h-[86px] flex flex-row rounded-[12px]">
                    <div class="w-[1281px] h-[66px] flex flex-row justify-between items-center ml-[24px]">
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 27px;color: #1C1D21;">Latest
                            sales</span>
                    </div>
                </div>
                <div class="w-[1438px] h-[48px] flex flex-row justify-around items-center">
                    <div class="w-[1381px] h-[48px] flex flex-row items-center">
                        <div class="w-[100px] h-[80px] flex justify-center items-center">
                            <span class="w-[100px] h-[80px] flex justify-center items-center"
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Mã
                                người dùng</span>
                        </div>
                        <div class="w-[200px] h-[80px] flex justify-center items-center">
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Username</span>
                        </div>
                        <div class="w-[200px] h-[80px] flex flex-col justify-center items-center">
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Tên
                                người dùng</span>
                        </div>
                        <div class="w-[100px] h-[80px] flex justify-center items-center">
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Giới
                                tính</span>
                        </div>
                        <div class="w-[200px] h-[80px] flex justify-center items-center">
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Địa
                                chỉ</span>
                        </div>
                        <div class="w-[200px] h-[80px] flex justify-center items-center">
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Số
                                điện thoại</span>
                        </div>
                        <div class="w-[200px] h-[80px] flex items-center">
                            <span class="w-[200px] h-[80px] flex justify-center items-center"
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Loại
                                tài khoản</span>
                        </div>
                    </div>
                </div>

                <div class="w-[1438px] flex flex-col justify-around items-center">
                    <div class="w-[1381px] h-[48px] flex flex-row items-center" v-if="showModify">
                        <div class="w-[100px] h-[80px] flex justify-center items-center">
                            <span class="w-[100px] h-[80px] flex justify-center items-center"
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                                {{ valueId }}
                            </span>
                        </div>
                        <div class="w-[200px] h-[80px] flex justify-center items-center">
                            <input v-model="usernameOuput"
                                class="w-[150px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-300"
                                type="text" :placeholder="`${usernameOuput}`">
                        </div>
                        <div class="w-[200px] h-[80px] flex justify-center items-center">
                            <input v-model="nameOuput"
                                class="w-[200px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-300"
                                type="text" :placeholder="`${nameOuput}`">
                        </div>
                        <div class="w-[100px] h-[80px] flex justify-center items-center">
                            <select
                                class="w-[50px] h-[38px] text-[14px] rounded-xl focus:outline-none border border-gray-300"
                                v-model="seletedGender">
                                <option value="male">Nam</option>
                                <option value="female">Nữ</option>
                                <option value="none">N/A</option>
                            </select>
                        </div>
                        <div class="w-[200px] h-[80px] flex justify-center items-center">
                            <input v-model="addressOuput"
                                class="w-[200px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-300"
                                type="text" :placeholder="`${addressOuput}`">
                        </div>
                        <div class="w-[200px] h-[80px] flex justify-center items-center">
                            <input v-model="phoneOuput"
                                class="w-[150px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-300"
                                type="text" :placeholder="`${phoneOuput}`">
                        </div>
                        <div class="w-[200px] h-[80px] flex justify-center items-center ">
                            <select
                                class="w-[140px] h-[38px] text-[14px] rounded-xl focus:outline-none border border-gray-300"
                                v-model="seletedRole">
                                <option value="customer">Khách hàng</option>
                                <option value="sales">Nhân viên bán hàng</option>
                                <option value="warehouse">Nhân viên kho</option>
                                <option value="admin">Admin</option>
                            </select>
                        </div>
                        <div class="w-[80px] h-[80px] flex justify-center items-center">
                            <button
                                @click="updateUser(valueId, usernameOuput, nameOuput, seletedGender, addressOuput, phoneOuput, seletedRole)"
                                class="w-[50px] h-[30px] text-[12px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none">Save</button>
                        </div>
                    </div>
                    <div v-for="item in listDisplayUsersAdmin" class="w-[1381px] h-[48px] flex flex-row items-center">
                        <div class="w-[100px] h-[80px] flex justify-center items-center">
                            <span class="w-[100px] h-[80px] flex justify-center items-center"
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                                {{ item.id }}
                            </span>
                        </div>
                        <div class="w-[200px] h-[80px] flex justify-center items-center">
                            <span class="w-[200px] h-[80px] flex justify-center items-center"
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                                {{ item.username }}
                            </span>
                        </div>
                        <div class="w-[200px] h-[80px] flex justify-center items-center">
                            <span class="w-[200px] h-[80px] flex justify-center items-center"
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                                {{ item.name }}
                            </span>
                        </div>
                        <div class="w-[100px] h-[80px] flex justify-center items-center">
                            <span class="w-[100px] h-[80px] flex justify-center items-center"
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                                {{ item.gender }}
                            </span>
                        </div>
                        <div class="w-[200px] h-[80px] flex justify-center items-center">
                            <span class="w-[200px] h-[80px] flex justify-center items-center"
                                style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 14px;line-height: 21px;color: #1C1D21;">
                                {{ item.address }}
                            </span>
                        </div>
                        <div class="w-[200px] h-[80px] flex justify-center items-center">
                            <span class="w-[200px] h-[80px] flex justify-center items-center"
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                                {{ item.phone }}
                            </span>
                        </div>

                        <div class="w-[200px] h-[80px] flex justify-center items-center ">
                            <span class="w-[200px] h-[80px] flex justify-center items-center"
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                                {{ item.role }}
                            </span>
                        </div>
                        <div class=" flex justify-center items-center ">
                            <button
                                @click="modifyUser(item.id, item.username, item.name, item.gender, item.address, item.phone, item.role)"
                                class="w-[70px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Modifiy</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="w-[1438px] flex justify-center items-center">
            <div class="flex justify-center items-center mt-[30px]">
                <el-pagination :page-size="pageSize" :total="listUsersAdmin.length" :current-page.sync="currentPage"
                    @current-change="handlePageChange" @click="setPage(Number(currentPage))" />
            </div>
        </div>
        <!-- <div class="w-[1438px] flex flex-row justify-between items-center">
            <div class="w-[400px] h-[50px] flex flex-row mt-[30px] items-center">
                <a href="" @click="routerPage('adminProductView')">
                    <IconLeftArrow class="w-[50px]" />
                </a>
                <span class="text-[13px]">Di chuyển tới trang quản lý sản phẩm</span>
            </div>
            <div class="w-[400px] h-[50px] flex flex-row mt-[30px] items-center">
                <span class="text-[13px]">Di chuyển tới trang quản lý đơn hàng</span>
                <a href="" @click="routerPage('adminOrderView')">
                    <IconRightArrow class="w-[50px]" />
                </a>
            </div>
        </div> -->
        <Footer />
    </div>
</template>