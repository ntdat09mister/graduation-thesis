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
    const listCart = ref<Cart[]>([]);
    const totalAmountRef = ref<number>(0);
    async function getListCart(userId: number) {
      try {
        const response = await axios.get(`http://localhost:8080/cart?userId=${userId}`);
        const responseData = response.data;
        // Kiểm tra xem response có thuộc tính "data" không
        if (responseData && responseData.data) {
          const data = responseData.data;
          // Kiểm tra xem data có thuộc tính "cartDtoList" và "totalAmount" không
          if (data.cartDtoList && Array.isArray(data.cartDtoList) && typeof data.totalAmount === 'number') {
            // Dùng data.cartDtoList để cập nhật listCart
            listCart.value = data.cartDtoList;
            // Dùng data.totalAmount để cập nhật totalAmountRef
            totalAmountRef.value = data.totalAmount;
    
            console.log(listCart);
            console.log(totalAmountRef.value);
          } else {
            console.error('Invalid data received from the API:', data);
          }
        } else {
          console.error('No data received from the API');
        }
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    }
    return {
        getListCart,
        listCart,
        totalAmountRef
    }
})