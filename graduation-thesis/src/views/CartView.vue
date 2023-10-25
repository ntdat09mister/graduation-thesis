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
            totalAmountShow: 0
        }
    },
    methods: {
        ...mapActions(useCartStore, ['getListCart', 'removeCartItem']),
        handleClick(id: number) {
            router.push({ name: 'productDetail', params: { id: Number(id) } })
        }
    },
    mounted() {
        this.getListCart()
    }
})
</script>
<template>
    <div class="flex flex-col justify-center items-center">
        <Header />
        <div class="w-[580px] h-[25px] flex flex-row items-center mt-[10px]">
            <IconBack class="w-[25px] h-[25px]" />
            <p class="text-[25px] font-semibold ml-[160px]">Giỏ hàng của bạn</p>
        </div>
        <div class="w-[780px] flex flex-row justify-between mt-[20px]">
            <span class="w-[121px] flex justify-center">Sản phẩm</span>
            <span class="w-[130px]">Tên sản phẩm</span>
            <span class="w-[100px]">Số lượng</span>
            <span class="w-[200px]">Thời gian mua</span>
            <span class="w-[100px]">Giá</span>
            <span>Xóa</span>
        </div>
        <div class="w-[780px] flex flex-col justify-between items-center" v-for="cartItem in listCart">
            <div class="w-[780px] flex flex-row justify-between items-center mt-[10px]">
                <div class="w-[121px] h-[81px] flex justify-center items-center">
                    <a href="" @click="handleClick(Number(cartItem.productId))"><img class="w-[81px] h-[81px]"
                            :src="cartItem.src" alt="img_product"></a>
                </div>
                <div class="w-[130px]">
                    <p>{{ cartItem.nameProduct }}</p>
                </div>
                <div class="w-[100px] h-[30px] flex justify-between items-center flex-row ">
                    <div
                        class="w-[30px] h-[30px] flex justify-center items-center bg-gray-200 rounded-md cursor-pointer h-8 select-none w-8">
                        <span>-</span>
                    </div>
                    <span>{{ cartItem.quantity }}</span>
                    <div
                        class="w-[30px] h-[30px] flex justify-center items-center bg-gray-200 rounded-md cursor-pointer h-8 select-none w-8">
                        <span>+</span>
                    </div>
                </div>
                <div class="w-[200px] mb-[30px] ml-[20px] mt-[30px]">
                    <p>{{ cartItem.createdAt }}</p>
                </div>
                <div class="w-[100px]">
                    <p>{{ cartItem.price }}</p>
                </div>
                <div class="w-[30px] mb-[10px] flex justify-center cursor-pointer" @click="removeCartItem(cartItem.cartId)">
                    <IconRemove class="w-[20px]" />
                </div>
            </div>
        </div>
        <div class="w-[600px] h-[100px] flex flex-col justify-between">
            <div class="w-[100px] h-[100px] flex flex-col justify-center items-center ml-[520px]">
                <p>Tạm tính</p>
                <div>
                    <span>{{ totalAmount }}</span>
                    <span>đ</span>
                </div>
            </div>
            <div class="w-[140px] h-[50px] bg-[red] flex justify-center items-center rounded-xl ml-[500px]">
                <p class="text-neutral-50">Thanh toán</p>
            </div>
        </div>
        <Footer />
    </div>
</template>