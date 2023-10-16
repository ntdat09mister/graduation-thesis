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
  async function getListCart() {
    try {
      const token = localStorage.getItem("accessToken");
      if (!token) {
        console.error('Access token not found in localStorage');
        return;
      }
      const config = {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      };
      const response = await axios.get(`http://localhost:8080/cart/all`, config);
      const responseData = response.data;
      if (responseData && responseData.data) {
        const data = responseData.data;
        if (data.cartDtoList && Array.isArray(data.cartDtoList) && typeof data.totalAmount === 'number') {
          listCart.value = data.cartDtoList;
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