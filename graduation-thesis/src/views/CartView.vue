<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import IconBack from '@/components/icons/IconBack.vue'
import { defineComponent } from 'vue'
import { mapActions, mapState } from 'pinia';
import { useCartStore } from '@/stores/cart';
import IconRemove from '@/components/icons/IconRemove.vue';
import router from '@/router'
export default defineComponent({
    components: {
        Header,
        Footer,
        IconBack,
        IconRemove
    },
    computed: {
        ...mapState(useCartStore, {
            listCart: 'listCart',
            totalAmount: 'totalAmountRef'
        })
    },
    data() {
        return {
            userId: 1,
            totalAmountShow: 0,
            checkTotalAmountBoolean: false
        }
    },
    methods: {
        ...mapActions(useCartStore, ['getListCart', 'removeCartItem','createOrderFromCart','updateCartQuantity']),
        handleClick(id: number) {
            router.push({ name: 'productDetail', params: { id: Number(id) } })
        },
        routerPage(name: string) {
            router.push({ name })
        },
        checkTotalAmount() {
            if (this.totalAmount > 0) {
                this.checkTotalAmountBoolean = true
            }
        }
    },
    mounted() {
        this.getListCart(),
        this.checkTotalAmount()
    }
})
</script>
<template>
    <div class="flex flex-col justify-center items-center">
        <Header />
        <div class="w-[580px] h-[25px] flex flex-row items-center mt-[10px]">
            <IconBack @click="routerPage('home')" class="w-[25px] h-[25px]" />
            <p class="text-[25px] font-semibold ml-[160px]">Giỏ hàng của bạn</p>
        </div>
        <div class="w-[780px] flex flex-row justify-between mt-[20px] p-2 border bg-gray-200 border border-gray-400">
            <span class="w-[121px] flex justify-center">Sản phẩm</span>
            <span class="w-[130px]">Tên sản phẩm</span>
            <span class="w-[100px]">Số lượng</span>
            <span class="w-[150px]">Thông tin</span>
            <span class="w-[50px]">Giá</span>
            <span class="w-[50px]">Xóa</span>
        </div>
        <div class="w-[780px] flex flex-col justify-between items-center border border-gray-400" v-for="cartItem in listCart">
            <div class="w-[780px] flex flex-row justify-between items-center mt-[10px]">
                <div class="w-[121px] h-[100px] flex justify-center items-center">
                    <a href="" @click="handleClick(Number(cartItem.productId))"><img class="w-[81px] h-[81px]"
                            :src="cartItem.src" alt="img_product"></a>
                </div>
                <div class="w-[130px]">
                    <p>{{ cartItem.nameProduct }}</p>
                </div>
                <div class="w-[100px] h-[30px] flex justify-between items-center flex-row ">
                    <div @click="updateCartQuantity(cartItem.cartId, false)"
                        class="w-[30px] h-[30px] flex justify-center items-center bg-gray-200 rounded-md cursor-pointer h-8 select-none w-8">
                        <button>-</button>
                    </div>
                    <span>{{ cartItem.quantity }}</span>
                    <div @click="updateCartQuantity(cartItem.cartId, true)"
                        class="w-[30px] h-[30px] flex justify-center items-center bg-gray-200 rounded-md cursor-pointer h-8 select-none w-8">
                        <button>+</button>
                    </div>
                </div>
                <div class=" w-[150px] mb-[30px] ml-[20px] mt-[30px]">
                    <p>1TB, màu vàng</p>
                </div>
                <div class="w-[50px]">
                    <p>{{ cartItem.price }}</p>
                </div>
                <div class="w-[50px] mb-[10px] flex justify-center cursor-pointer mr-[20px]" @click="removeCartItem(cartItem.cartId)">
                    <IconRemove class="w-[20px]" />
                </div>
            </div>
        </div>
        <div v-if="checkTotalAmountBoolean" class="w-[600px] h-[100px] flex flex-col justify-between">
            <div class="w-[100px] h-[100px] flex flex-col justify-center items-center ml-[520px]">
                <p>Tạm tính</p>
                <div>
                    <span>{{ totalAmount }}</span>
                    <span>đ</span>
                </div>
            </div>
            <div class="w-[140px] h-[50px] bg-[red] flex justify-center items-center rounded-xl ml-[500px] cursor-pointer" @click="createOrderFromCart">
                <p class="text-neutral-50">Tạo đơn hàng</p>
            </div>
        </div>
        <Footer />
    </div>
</template>