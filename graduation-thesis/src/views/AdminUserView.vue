<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import IconShowNaviDB from '@/components/icons/IconShowNaviDB.vue'
import IconUpdateStatusOrder from '@/components/icons/IconUpdateStatusOrder.vue'
import IconRightArrow from '@/components/icons/IconRightArrow.vue'
import IconLeftArrow from '@/components/icons/IconLeftArrow.vue'
import { defineComponent, ref } from 'vue'
import { mapActions, mapState } from 'pinia'
import { useUserStore } from '@/stores/user'
import router from '@/router'

export default defineComponent({
    components: {
        Header,
        Footer,
        IconShowNaviDB,
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
            seletedGender: "none",
            currentPage: Number(sessionStorage.getItem("changePageUserAdmin")),
            seletedActive: true
        };
    },
    computed: {
        ...mapState(useUserStore, {
            listDisplayUsersAdmin: 'listDisplayUsersAdmin',
            listUsersAdmin: 'listUsersAdmin'
        })
    },
    methods: {
        ...mapActions(useUserStore, ['getUsersAdmin', 'setPage', 'updateUserAdmin']),
        handlePageChange(newPage: number) {
            this.currentPage = newPage;
            sessionStorage.setItem("changePageUserAdmin", String(newPage));
        },
        routerPage(routerName: string) {
            router.push({ name: routerName })
        },
        modifyUser(id: number, username: string, name: string, gender: string, address: string, phone: string, role: string, seletedActive: boolean) {
            this.valueId = id;
            this.usernameOuput = username,
                this.nameOuput = name,
                this.seletedGender = gender,
                this.addressOuput = address,
                this.phoneOuput = phone,
                this.seletedRole = role,
                this.seletedActive = seletedActive,
                this.showModify = true
        },
        saveUser() {
            this.showModify = false;
        },
        handlePageChangeMounted() {
            if (sessionStorage.getItem("changePageUserAdmin")) {
                this.setPage(Number(sessionStorage.getItem("changePageUserAdmin")))
            } else {
                this.setPage(1);
            }
        },
        cancel() {
            this.showModify = false
        },
        getRoleName(role: string) {
            if (role === "admin") {
                return "Chủ cửa hàng";
            } else if (role === "sales") {
                return "Nhân viên bán hàng";
            } else if (role === "warehouse") {
                return "Nhân viên kho";
            } else if (role === "customer") {
                return "Khách hàng";
            }
        },
        getActiveStatus(status: boolean) {
            if (status == true) {
                return "Hoạt động";
            } else if (status == false) {
                return "Khóa";
            }
        }
    },
    mounted() {
        this.getUsersAdmin(),
            this.handlePageChangeMounted()

    }
});
</script>
<template>
    <div class="flex flex-col justify-center items-center">
        <Header />
        <div class="flex flex-col justify-center items-center">
            <div class="w-[1438px] h-[1020] flex flex-col bg-[#F2F2F2]">
                <div class="w-[1438px] h-[80px] flex flex-row justify-between items-center">
                    <div class="flex flex-row">
                        <div
                            class="w-[36px] h-[36px] flex justify-center items-center rounded-[6px] ml-[28px] bg-[#5E81F41A] cursor-pointer">
                            <IconShowNaviDB />
                        </div>
                        <div class="flex flex-col">
                            <span class="ml-[20px]"
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 20px;line-height: 32px;color: #1C1D21;">
                                Quản lý người dùng
                            </span>
                        </div>
                    </div>
                </div>
                <div class="w-[1438px] h-[48px] flex flex-row justify-around items-center">
                    <div class="w-[1381px] h-[48px] flex flex-row items-center">
                        <div class="w-[100px] h-[80px] flex justify-center items-center">
                            <span class="w-[100px] h-[80px] flex justify-center items-center"
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Mã
                                người dùng</span>
                        </div>
                        <div class="w-[200px] h-[80px] flex items-center">
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Tên
                                đăng nhập</span>
                        </div>
                        <div class="w-[200px] h-[80px] flex items-center">
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Tên
                                người dùng</span>
                        </div>
                        <div class="w-[100px] h-[80px] flex justify-center items-center">
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Giới
                                tính</span>
                        </div>
                        <div class="w-[200px] h-[80px] flex items-center ml-[20px]">
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
                            <span class="w-[200px] h-[80px] flex items-center"
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Loại
                                tài khoản</span>
                        </div>
                        <div class="w-[100px] h-[80px] flex items-center">
                            <span class="w-[100px] h-[80px] flex items-center"
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Tình
                                trạng</span>
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
                                <option value="nam">Nam</option>
                                <option value="nữ">Nữ</option>
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
                                <option value="admin">Chủ cửa hàng</option>
                            </select>
                        </div>
                        <div class="w-[100px] h-[80px] flex items-center">
                            <select
                                class="w-[100px] h-[38px] text-[14px] rounded-xl focus:outline-none border border-gray-300"
                                v-model="seletedActive">
                                <option :value= true>Hoạt động</option>
                                <option :value= false>Khóa</option>
                            </select>
                        </div>
                        <div class="w-[80px] h-[80px] flex justify-center items-center">
                            <button
                                @click="updateUserAdmin(valueId, usernameOuput, nameOuput, seletedGender, addressOuput, phoneOuput, seletedRole, seletedActive)"
                                class="w-[50px] h-[30px] text-[12px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none">Lưu</button>
                        </div>
                        <div class="w-[50px] h-[30px] flex justify-center items-center ">
                            <button @click="cancel()"
                                class="w-[50px] h-[30px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Cancel</button>
                        </div>
                    </div>
                    <div v-for="item in listDisplayUsersAdmin" class="w-[1381px] h-[48px] flex flex-row items-center">
                        <div class="w-[100px] h-[80px] flex justify-center items-center">
                            <span class="w-[100px] h-[80px] flex justify-center items-center"
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                                {{ item.id }}
                            </span>
                        </div>
                        <div class="w-[200px] h-[80px] flex items-center">
                            <span class="w-[200px] h-[80px] flex items-center"
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                                {{ item.username }}
                            </span>
                        </div>
                        <div class="w-[200px] h-[80px] flex items-center">
                            <span class="w-[200px] h-[80px] flex items-center"
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
                        <div class="w-[200px] h-[80px] flex items-center ml-[20px]">
                            <span class="w-[200px] h-[80px] flex items-center"
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

                        <div class="w-[200px] h-[80px] flex items-center ">
                            <span class="w-[200px] h-[80px] flex items-center"
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                                {{ getRoleName(item.role) }}
                            </span>
                        </div>
                        <div class="w-[100px] h-[80px] flex items-center">
                            <span class="w-[200px] h-[80px] flex items-center"
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                                {{ getActiveStatus(item.active) }}
                            </span>
                        </div>
                        <div class=" flex justify-center items-center ">
                            <button
                                @click="modifyUser(item.id, item.username, item.name, item.gender, item.address, item.phone, item.role, item.active)"
                                class="w-[60px] h-[30px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Sửa</button>
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
        <div class="w-[1438px] flex flex-row justify-between items-center">
            <div class="w-[400px] h-[50px] flex flex-row mt-[30px] items-center">
                <a href="" @click="routerPage('adminProductView')">
                    <button @click="routerPage('adminProductView')"
                        class="w-[70px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Step -
                        Left</button>
                </a>
                <span class="text-[13px] ml-[10px]">Di chuyển tới trang quản lý sản phẩm</span>
            </div>
            <div class="w-[400px] h-[50px] flex flex-row mt-[30px] items-center">
                <span class="text-[13px] mr-[10px]">Di chuyển tới trang quản lý đơn hàng</span>
                <a href="" @click="routerPage('adminOrderView')">
                    <button @click="routerPage('adminProductView')"
                        class="w-[70px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Step -
                        right</button>
                </a>
            </div>
        </div>
        <Footer />
    </div>
</template>