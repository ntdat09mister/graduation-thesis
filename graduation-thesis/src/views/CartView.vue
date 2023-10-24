<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import IconBack from '@/components/icons/IconBack.vue'
import { defineComponent } from 'vue'
import { mapActions, mapState } from 'pinia';
import { useCartStore } from '@/stores/cart';
export default defineComponent({
    components: {
        Header,
        Footer,
        IconBack
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
        ...mapActions(useCartStore, ['getListCart'])
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
        <div class="w-[550px] flex flex-row justify-between mt-[20px]">
            <span>Sản phẩm</span>
            <span>Tên sản phẩm</span>
            <span>Giá</span>
            <span>Số lượng</span>
        </div>
        <div class="w-[600px] flex flex-col justify-between items-center" v-for="cartItem in listCart">
            <div class="w-[580px] j-[100px] flex flex-row justify-between items-center mt-[15px]">
                <div class="w-[121px] h-[81px] flex justify-center items-center">
                    <img class="w-[81px] h-[81px]" :src="cartItem.src" alt="img_product">
                </div>
                <div class="w-[435px] h-[55px] flex flex-row justify-around">
                    <div class="w-[130px]">
                        <p>{{ cartItem.nameProduct }}</p>
                    </div>
                    <div class="mr-[40px]">
                        <p>{{ cartItem.price }}</p>
                    </div>
                </div>
                <div class="w-[100px] h-[30px] flex justify-between items-center flex-row mb-[25px]">
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
            </div>
        </div>
        <div class="w-[600px] h-[100px] flex flex-row justify-between items-center">
            <div class="w-[100px] h-[100px] flex flex-col justify-center items-center">
                <p>Tạm tính</p>
                <div>
                    <span>{{ totalAmount }}</span>
                    <span>đ</span>
                </div>
            </div>
            <div class="w-[140px] h-[50px] bg-[red] flex justify-center items-center rounded-xl">
                <p class="text-neutral-50">Thanh toán</p>
            </div>
        </div>
        <Footer />
    </div>
</template>