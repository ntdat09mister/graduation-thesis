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
        IconRightArrow,
        IconLeftArrow
    },
    data() {
        return {
            pageSize: 8,
            currentPage: Number(sessionStorage.getItem("changePageProductAdmin")),
            listUnderDashBoard: [
                { component: IconRevenue, name: 'Số sản phẩm trong kho', value: '50' },
                { component: IconCheckListOrder, name: 'Sản phẩm tồn kho', value: '50000000' }
            ],
            showModify: false,
            selected: 2,
            srcOutput: "",
            nameOutput: "",
            priceOutput: "",
            descriptionOutput: "",
            quantityOutput: "",
            seletedStatus: true,
            idValue: 1,
            promotionId: 1,
            showCreate: false,
            showCreateButton: true
        };
    },
    computed: {
        ...mapState(useProductStore, {
            listDisplayProductAdmin: 'listDisplayProductAdmin',
            listProductsAdmin: 'listProductsAdmin',
            countProductsAll: 'countProductsAll',
            countProductsTrue: 'countProductsTrue',
            countTotalProducts: 'countTotalProducts',
            listPromotions: 'listPromotions'
        }),
        ...mapState(useUserStore, {
            user: 'user'
        })
    },
    methods: {
        ...mapActions(useProductStore, ['getProductsAdmin', 'setPage', 'updateStatusProduct', 'updateProduct', 'getAllPromotions', 'createProduct']),
        handlePageChange(newPage: number) {
            this.currentPage = newPage;
            sessionStorage.setItem("changePageProductAdmin", String(newPage));
        },
        routerPage(routerName: string) {
            router.push({ name: routerName })
        },
        modifyProduct(id: number, src: string, name: string, price: string, description: string, quantity: string, promotionId: number) {
            this.idValue = id,
                this.srcOutput = src,
                this.nameOutput = name,
                this.priceOutput = price,
                this.descriptionOutput = description,
                this.quantityOutput = quantity,
                this.showModify = true,
                this.promotionId = promotionId
        },
        handleClick(id: number) {
            router.push({ name: 'productDetail', params: { id: Number(id) } })
        },
        handlePageChangeMounted() {
            if (sessionStorage.getItem("changePageProductAdmin")) {
                this.setPage(Number(sessionStorage.getItem("changePageProductAdmin")))
            } else {
                this.setPage(1);
            }
        },
        cancel() {
            this.showModify = false
        },
        cancelCrateProd() {
            this.showCreate = false
            this.showCreateButton = true
        },
        clickShowCreate() {
            this.showCreate = true
            this.showCreateButton = false
        }
    },
    mounted() {
        this.getProductsAdmin(),
            this.handlePageChangeMounted(),
            this.getAllPromotions()
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
                        Quản lý sản phẩm
                    </span>
                </div>
                <div class="w-[200px] h-[50px] flex flex-row mt-[30px] items-center">
                    <button @click="routerPage('adminPromotionView')"
                        class="w-[140px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Quản lý
                        khuyến mại</button>
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
                                style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 18px;line-height: 21px;color: #1B51E5;">Sản
                                phẩm đang bán</span>
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 20px;line-height: 32px;color: #1C1D21;">{{
                                    countProductsTrue }}/{{ countProductsAll }}</span>
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
                                style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 18px;line-height: 21px;color: #1B51E5;">Sản
                                phẩm trong kho</span>
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 20px;line-height: 32px;color: #1C1D21;">{{
                                    countTotalProducts }}</span>
                        </div>
                    </div>
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
                <div class="w-[160px] h-[80px] flex items-center">
                    <span class="w-[160px] h-[80px] flex items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Tên
                        sản phẩm</span>
                </div>
                <div class="w-[100px] h-[80px] flex items-center">
                    <span class="w-[100px] h-[80px] flex items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Đơn
                        giá</span>
                </div>
                <div class="w-[250px] h-[80px] flex items-center">
                    <span class="w-[250px] h-[80px] flex items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Mô
                        tả</span>
                </div>
                <div class="w-[100px] h-[80px] flex items-center">
                    <span class="w-[100px] h-[80px] flex items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Số
                        lượng</span>
                </div>
                <div class="w-[100px] h-[80px] flex justify-center items-center">
                    <span class="w-[100px] h-[80px] flex justify-center items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Tình
                        trạng</span>
                </div>
                <div class="w-[100px] h-[80px] flex justify-center items-center">
                    <span class="w-[100px] h-[80px] flex justify-center items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #1B51E5;">Khuyến
                        mại</span>
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
                <div class="w-[100px] h-[80px] flex justify-center items-center">
                    <select v-model="promotionId"
                        class="w-[100px] h-[38px] text-[14px] rounded-xl focus:outline-none border border-gray-300">
                        <option v-for="itemPromotion in listPromotions" :value=itemPromotion.id>{{
                            itemPromotion.percentValue }}%</option>
                    </select>
                </div>
                <div class="w-[120px] h-[80px] flex justify-between items-center">
                    <button
                        @click="updateProduct(idValue, nameOutput, priceOutput, descriptionOutput, quantityOutput, seletedStatus, promotionId)"
                        class="w-[50px] h-[30px] text-[12px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none">Save</button>
                    <div class="w-[50px] h-[30px] flex justify-center items-center ">
                        <button @click="cancel()"
                            class="w-[50px] h-[30px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Cancel</button>
                    </div>
                </div>
            </div>
            <div class="w-[1381px] h-[649px] flex flex-col items-center">
                <div v-for="(item, index ) in listDisplayProductAdmin" :key="index"
                    class="w-[1381px] h-[80px] flex flex-row justify-between items-center">
                    <div class="w-[70px] h-[80px] flex items-center">
                        <span class="w-[70px] h-[80px] flex justify-center items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.id }}
                        </span>
                    </div>
                    <div @click="handleClick(item.id)"
                        class="w-[110px] h-[80px] flex justify-center items-center cursor-pointer">
                        <img class="w-[52px] h-[52px] flex justify-center items-center" :src="item.src" alt="product-img">
                    </div>
                    <div class="w-[160px] h-[80px] flex items-center">
                        <span class="w-[160px] h-[80px] flex items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.name }}
                        </span>
                    </div>
                    <div class="w-[100px] h-[80px] flex items-center">
                        <span class="w-[100px] h-[80px] flex items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.price }}
                        </span>
                    </div>
                    <div class="w-[250px] h-[80px] flex items-center">
                        <span class="w-[250px] h-[80px] flex items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.description }}
                        </span>
                    </div>
                    <div class="w-[100px] h-[80px] flex items-center">
                        <span class="w-[100px] h-[80px] flex items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.quantity }}
                        </span>
                    </div>
                    <div :class="{ 'bg-green-100 border-green-500': item.statusProduct, 'bg-red-100 border-red-600 rounded-xl': !item.statusProduct }"
                        class="w-[80px] h-[40px] flex justify-center items-center cursor-pointer border rounded-xl"
                        @click="updateStatusProduct(item.id)">
                        <span class="text-[13px]">{{ item.statusProduct ? 'Đang bán' : 'Ngừng bán' }}</span>
                    </div>
                    <div class="w-[100px] h-[80px] flex justify-center items-center">
                        <span class="w-[50px] h-[80px] flex justify-center items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.promotion }}%
                        </span>
                    </div>
                    <div class="w-[50px] h-[38px] flex justify-center items-center ">
                        <button
                            @click="modifyProduct(item.id, item.src, item.name, item.price, item.description, item.quantity, item.promotionId)"
                            class="w-[50px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Modifiy</button>
                    </div>
                </div>
            </div>
            <div class="w-[1381px] flex flex-col items-center">
                <div v-if="showCreate" class="w-[1381px] h-[48px] flex flex-row justify-between items-center">
                    <div class="w-[70px] h-[80px] flex items-center">
                        <span class="w-[70px] h-[80px] flex justify-center items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                        </span>
                    </div>
                    <div class="w-[110px] h-[80px] flex justify-center items-center">
                        <div class="w-[110px] h-[80px] flex justify-center items-center">
                            <img class="w-[52px] h-[52px] flex justify-center items-center" src="data:image/jpeg;base64,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WpxOEkb2U2ad3hcWDT4lUO0lJT/4GiGcbp6wiV472xM7DTyKxeONznBjQ5zjoGalxWXUfR1WvaHOLGE/FLiT7bNUjA45sbz19VRnfEw4Kqcn+UfCOYbc+JWMYnic9S/rZ5nyv4OJ3dzWjRo7gArQCyzKTo3rxu6s+D7faxfBuwFcXMa6OzXOGdwc02F/esGKRxzBUg2hRRRHo3DLRoyv5Kd6K8D7Lq6RuruzHfgOJWzI2K1w+kbGxsbRZrAAB4K/aF0WNDRYLyEkjpHl7tTmqgKtlVFso0RERERERERERERERERERERERERERERERFBbT7K09cGdYXMcy9nstex+Kbg3F9f/AKVBU/RlRMN3l8ncSAPc1Z0i06Nt72U4qZgzow84eF1DUGz9NCLRwRs8Gi/vXvE8ApqluSaJrhwO5w+i4ahSyLawIsomuLTiabHjvWpdo+jSVl30p60fo3WEg8OD/I9xWJ0Oz9VLKIWwuDjvLmloYOJ1C6GVHNB3hQGlZe/kuqNtVIiLCRf8W/5X7ViWyuyMFG0EDPIfWkO/wHILJ2MX0DF6AVgC2S5JJJuVQBMq9IiwvOVVAVURERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERF//Z"
                                alt="product-img">
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
                    </div>
                    <div class="w-[100px] h-[80px] flex justify-center items-center">
                    </div>
                    <div class="w-[120px] h-[80px] flex justify-between items-center">
                        <button
                            @click="createProduct(nameOutput, priceOutput, descriptionOutput, quantityOutput)"
                            class="w-[50px] h-[30px] text-[12px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none">Save</button>
                        <div class="w-[50px] h-[30px] flex justify-center items-center ">
                            <button @click="cancelCrateProd()"
                                class="w-[50px] h-[30px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
            <div v-if="showCreateButton" class="w-[120px] h-[38px] flex justify-center items-center ">
                <button @click="clickShowCreate()"
                    class="w-[120px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Tạo
                    sản phẩm mới</button>
            </div>
        </div>

        <div class="w-[1438px] flex flex-row justify-center items-center">
            <div class="flex justify-center items-center mt-[30px]">
                <el-pagination :page-size="pageSize" :total="listProductsAdmin.length" :current-page.sync="currentPage"
                    @current-change="handlePageChange" @click="setPage(Number(currentPage))" />
            </div>
        </div>
        <template v-if="user?.role === 'admin'">
            <div class="w-[1438px] flex flex-row justify-between items-center">
                <div class="w-[400px] h-[50px] flex flex-row mt-[30px] items-center">
                    <button @click="routerPage('adminUserView')"
                        class="w-[70px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Step -
                        Left</button>
                    <span class="text-[13px] ml-[10px]">Di chuyển tới trang quản lý người dùng</span>
                </div>
                <div class="w-[400px] h-[50px] flex flex-row mt-[30px] items-center">
                    <span class="text-[13px] mr-[10px]">Di chuyển tới trang quản hóa đơn</span>
                    <button @click="routerPage('adminOrderView')"
                        class="w-[70px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Step -
                        right</button>
                </div>
            </div>
        </template>
    </div>
    <Footer />
</template>