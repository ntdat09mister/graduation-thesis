<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import { defineComponent } from 'vue'
import { mapActions, mapState } from 'pinia';
import { useOrderStore } from '@/stores/order';
import router from '@/router';
export default defineComponent({
    components: {
        Header,
        Footer
    },
    computed: {
        ...mapState(useOrderStore, {
            listOrders: 'listOrders'
        })
    },
    methods: {
        ...mapActions(useOrderStore, ['getOrderDetail'])
    },
    mounted() {
        this.getOrderDetail(11)
    }
})
</script>
<template>
    <div class="flex flex-col justify-center items-center">
        <Header />
        <h1>Thông tin đơn hàng</h1>
        <!-- <div class="w-[780px] flex flex-row justify-between items-center mt-[10px]">
            <div class="w-[121px] h-[100px] flex justify-center items-center">
                <img class="w-[81px] h-[81px]" src="cartItem.src" alt="img_product">
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
                <p>{{ cartItem.createdAt }}</p>
            </div>
            <div class="w-[50px]">
                <p>{{ cartItem.price }}</p>
            </div>
            <div class="w-[50px] mb-[10px] flex justify-center cursor-pointer mr-[20px]"
                @click="removeCartItem(cartItem.cartId)">
                <IconRemove class="w-[20px]" />
            </div>
        </div> -->
        <Footer />
    </div>
</template>