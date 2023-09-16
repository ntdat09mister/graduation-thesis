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
    function getListCart(customerId: number) {
        axios.get(`http://localhost:8080/cart?customerId=${customerId}`, {})
        .then((response) => {
            const { cartDtoList } = response.data;
            listCart.value = cartDtoList;
            const { totalAmount } = response.data;
            totalAmountRef.value = Number(totalAmount);
            // const { data } = response
            // const transformedData: Cart[] = data.map((cart: any) => ({
            //     id: cart.id,
            //     src: cart.src,
            //     nameProduct: cart.nameProduct,
            //     price: cart.price,
            //     quantity: cart.quantity
            // }))
            // listCart.value = transformedData
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