<script lang="ts">
import Header from '@/components/Header.vue';
import Footer from '@/components/Footer.vue';
import IconShowNaviDB from '@/components/icons/IconShowNaviDB.vue';
import IconRevenue from '@/components/icons/IconRevenue.vue';
import IconCheckListOrder from '@/components/icons/IconCheckListOrder.vue';
import IconUpdateStatusOrder from '@/components/icons/IconUpdateStatusOrder.vue'
import IconRightArrow from '@/components/icons/IconRightArrow.vue';
import IconLeftArrow from '@/components/icons/IconLeftArrow.vue';
import { defineComponent } from 'vue';
import { mapActions, mapState } from 'pinia';
import { useProductStore } from '@/stores/product';
import router from '@/router';

export default defineComponent({
    components: {
        Header,
        Footer,
        IconShowNaviDB,
        IconRevenue,
        IconCheckListOrder,
        IconUpdateStatusOrder,
        IconRightArrow,
        IconLeftArrow
    },
    data() {
        return {
            pageSize: 8,
            currentPage: Number(sessionStorage.getItem("changePageProductAdmin")),
            listUnderDashBoard: [
                { name: 'Số sản phẩm trong kho', value: '50' },
                { name: 'Sản phẩm tồn kho', value: '50000000' }
            ],
            showModify: false,
            selected: 2,
            srcOutput: "",
            nameOutput: "",
            priceOutput: "",
            descriptionOutput: "",
            quantityOutput: "",
            seletedStatus: true,
            idValue: 1
        };
    },
    computed: {
        ...mapState(useProductStore, {
            listDisplayProductAdmin: 'listDisplayProductAdmin',
            listProductsAdmin: 'listProductsAdmin'
        })
    },
    methods: {
        ...mapActions(useProductStore, ['getProductsAdmin', 'setPage', 'updateStatusProduct', 'updateProduct']),
        handlePageChange(newPage: number) {
            this.currentPage = newPage;
            sessionStorage.setItem("changePageProductAdmin", String(newPage));
        },
        routerPage(routerName: string) {
            router.push({ name: routerName })
        },
        modifyProduct(id: number, src: string, name: string, price: string, description: string, quantity: string) {
            this.idValue = id,
                this.srcOutput = src,
                this.nameOutput = name,
                this.priceOutput = price,
                this.descriptionOutput = description,
                this.quantityOutput = quantity,
                this.showModify = true;
        }
    },
    mounted() {
        this.getProductsAdmin(),
            this.setPage(Number(sessionStorage.getItem("changePageProductAdmin")))
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
                <div class="w-[1381px] h-[66px] flex flex-row justify-between items-center ml-[24px]">
                    <span
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 27px;color: #1C1D21;">Latest
                        sales</span>
                </div>
            </div>
            <div class="w-[1381px] h-[48px] flex flex-row justify-between items-center">
                <div class="w-[70px] h-[80px] flex items-center">
                    <span class="w-[70px] h-[80px] flex justify-center items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Mã
                        SP</span>
                </div>
                <div class="w-[110px] h-[80px] flex justify-center items-center">
                    <span class="w-[110px] h-[80px] flex justify-center items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Sản
                        phẩm</span>
                </div>
                <div class="w-[160px] h-[80px] flex justify-center items-center">
                    <span class="w-[160px] h-[80px] flex justify-center items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Tên
                        sản phẩm</span>
                </div>
                <div class="w-[100px] h-[80px] flex flex-col justify-center items-center">
                    <span class="w-[100px] h-[80px] flex flex-col justify-center items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Đơn
                        giá</span>
                </div>
                <div class="w-[250px] h-[80px] flex justify-center items-center">
                    <span class="w-[250px] h-[80px] flex justify-center items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Mô
                        tả</span>
                </div>
                <div class="w-[100px] h-[80px] flex justify-center items-center">
                    <span class="w-[100px] h-[80px] flex justify-center items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Số
                        lượng</span>
                </div>
                <div class="w-[100px] h-[80px] flex justify-center items-center">
                    <span class="w-[100px] h-[80px] flex justify-center items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Tình
                        trạng</span>
                </div>
                <div class="w-[50px] h-[38px] flex justify-center items-center ">
                    <span
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;"></span>
                </div>
            </div>
            <div v-if="showModify" class="w-[1381px] h-[48px] flex flex-row justify-between items-center">
                <div class="w-[70px] h-[80px] flex items-center">
                    <span class="w-[70px] h-[80px] flex justify-center items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                        {{ idValue }}
                    </span>
                </div>
                <div class="w-[110px] h-[80px] flex justify-center items-center">
                    <div class="w-[110px] h-[80px] flex justify-center items-center">
                        <img class="w-[52px] h-[52px] flex justify-center items-center" :src="srcOutput" alt="product-img">
                    </div>
                </div>
                <div class="w-[160px] h-[80px] flex justify-center items-center">
                    <input v-model="nameOutput"
                        class="w-[150px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-300"
                        type="text" :placeholder="`${nameOutput}`">
                </div>
                <div class="w-[100px] h-[80px] flex justify-center items-center">
                    <input v-model="priceOutput"
                        class="w-[100px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-300"
                        type="text" :placeholder="`${priceOutput}`">
                </div>
                <div class="w-[200px] h-[80px] flex justify-center items-center">
                    <input v-model="descriptionOutput"
                        class="w-[200px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-300"
                        type="text" :placeholder="`${descriptionOutput}`">
                </div>
                <div class="w-[100px] h-[80px] flex justify-center items-center">
                    <input v-model="quantityOutput"
                        class="w-[100px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-300"
                        type="text" :placeholder="`${quantityOutput}`">
                </div>
                <div class="w-[100px] h-[80px] flex justify-center items-center">
                    <select class="w-[100px] h-[38px] text-[14px] rounded-xl focus:outline-none border border-gray-300"
                        v-model="seletedStatus">
                        <option :value=true>Đang bán</option>
                        <option :value=false>Ngừng bán</option>
                    </select>
                </div>
                <div class="w-[50px] h-[80px] flex justify-center items-center">
                    <button
                        @click="updateProduct(idValue, nameOutput, priceOutput, descriptionOutput, quantityOutput, seletedStatus)"
                        class="w-[50px] h-[30px] text-[12px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none">Save</button>
                </div>
            </div>
            <div class="w-[1381px] h-[649px] flex flex-col">
                <div v-for="(item, index ) in listDisplayProductAdmin" :key="index"
                    class="w-[1381px] h-[80px] flex flex-row justify-between items-center">
                    <div class="w-[70px] h-[80px] flex items-center">
                        <span class="w-[70px] h-[80px] flex justify-center items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.id }}
                        </span>
                    </div>
                    <div class="w-[110px] h-[80px] flex justify-center items-center">
                        <img class="w-[52px] h-[52px] flex justify-center items-center" :src="item.src" alt="product-img">
                    </div>
                    <div class="w-[160px] h-[80px] flex items-center">
                        <span class="w-[160px] h-[80px] flex justify-center items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.name }}
                        </span>
                    </div>
                    <div class="w-[100px] h-[80px] flex flex-col justify-center items-center">
                        <span class="w-[100px] h-[80px] flex flex-col justify-center items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.price }}
                        </span>
                    </div>
                    <div class="w-[250px] h-[80px] flex justify-center items-center">
                        <span class="w-[250px] h-[80px] flex justify-center items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.description }}
                        </span>
                    </div>
                    <div class="w-[50px] h-[80px] flex justify-center items-center">
                        <span class="w-[50px] h-[80px] flex justify-center items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.quantity }}
                        </span>
                    </div>
                    <div :class="{ 'bg-green-100 border-green-500': item.statusProduct, 'bg-red-100 border-red-600 rounded-xl': !item.statusProduct }"
                        class="w-[80px] h-[40px] flex justify-center items-center cursor-pointer border rounded-xl"
                        @click="updateStatusProduct(item.id)">
                        <span class="text-[13px]">{{ item.statusProduct ? 'Đang bán' : 'Ngừng bán' }}</span>
                    </div>
                    <div class="w-[50px] h-[38px] flex justify-center items-center ">
                        <button
                            @click="modifyProduct(item.id, item.src, item.name, item.price, item.description, item.quantity)"
                            class="w-[50px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Modifiy</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="w-[1438px] flex flex-row justify-between items-center">
            <div class="w-[400px] h-[50px] flex flex-row mt-[30px] items-center">
                <a href="" @click="routerPage('adminUserView')">
                    <IconLeftArrow class="w-[50px]" />
                </a>
                <span class="text-[13px]">Di chuyển tới trang quản lý người dùng</span>
            </div>
            <div class="flex justify-center items-center mt-[30px]">
                <el-pagination :page-size="pageSize" :total="listProductsAdmin.length" :current-page.sync="currentPage"
                    @current-change="handlePageChange" @click="setPage(Number(currentPage))" />
            </div>
            <div class="w-[400px] h-[50px] flex flex-row mt-[30px] items-center">
                <span class="text-[13px]">Di chuyển tới trang quản lý đơn hàng</span>
                <a href="" @click="routerPage('adminOrderView')">
                    <IconRightArrow class="w-[50px]" />
                </a>
            </div>
        </div>

    </div>
    <Footer />
</template>