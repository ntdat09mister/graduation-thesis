import axios from 'axios'
import { defineStore } from 'pinia'
import { ref } from 'vue'
export const useCartStore = defineStore('cart', () => {
    interface Cart {
        id: number,
        src: string,
        nameProduct: string,
        price: string,
        quantity: number
    }
    const listCart = ref<Cart[]>([])
    const totalAmountRef = ref<number>(0)
    function getListCart(userId: number) {
        axios.get(`http://localhost:8080/cart?userId=${userId}`, {})
        .then((response) => {
            const { cartDtoList } = response.data;
            listCart.value = cartDtoList;
            const { totalAmount } = response.data;
            totalAmountRef.value = Number(totalAmount);
            console.log(listCart)
            console.log(totalAmount)
        })
    }
    return {
        getListCart,
        listCart,
        totalAmountRef
    }
})