import axios from 'axios'
import { defineStore } from 'pinia'
import { ref } from 'vue'
import router from '@/router'
export const useCartStore = defineStore('cart', () => {
  interface Cart {
    cartId: number,
    productId: number,
    src: string,
    nameProduct: string,
    price: string,
    quantity: number,
    createdAt: string
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
          Authorization: `Bearer ${token}`
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

  async function addToCart(productId: number, quantity: number, priceCoefficient: number) {
    try {
      const token = localStorage.getItem("accessToken");
      if (!token) {
        console.error('Access token not found in localStorage');
        return;
      }
      const apiUrl = 'http://localhost:8080/cart/add';
      const requestData = {
        productId: productId,
        quantity: quantity,
        priceCoefficient: priceCoefficient
      }
      const headers = { Authorization: `Bearer ${token}` };
      const response = await axios.post(apiUrl, requestData, { headers });
      console.log(response);
      router.push({ name: 'cart' }).then(() => {
        location.reload();
      });
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  }
  async function removeCartItem(cartId: number) {
    try {
      const token = localStorage.getItem("accessToken");
      if (!token) {
        console.error('Access token not found in localStorage');
        return;
      }
      const apiUrl = 'http://localhost:8080/cart/delete';
      const params = { cartId: cartId };
      const headers = { Authorization: `Bearer ${token}` };
      const response = await axios.delete(apiUrl, { headers, params });
      console.log(response);
      const scrollPosition = window.scrollY;
      location.reload();
      window.scrollTo(0, scrollPosition);
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  }
  async function createOrderFromCart() {
    try {
      const token = localStorage.getItem("accessToken");
      if (!token) {
        console.error('Access token not found in localStorage');
        return;
      }
      const apiUrl = 'http://localhost:8080/order/add';
      const requestData = {}
      const headers = { Authorization: `Bearer ${token}`, };
      const response = await axios.post(apiUrl, requestData, { headers });
      console.log(response);
      router.push({ name: 'payment' }).then(() => {
        location.reload();
      });
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  }
  async function updateCartQuantity(cartId: number, statusUpdate: boolean) {
    try {
      const token = localStorage.getItem("accessToken");
      if (!token) {
        console.error('Access token not found in localStorage');
        return;
      }
      const apiUrl = `http://localhost:8080/cart/updateQuantity?statusUpdate=${statusUpdate}&cartId=${cartId}`;
      const headers = { Authorization: `Bearer ${token}`, };
      const response = await axios.put(apiUrl, null, { headers });
      const scrollPosition = window.scrollY;
      location.reload();
      window.scrollTo(0, scrollPosition);
      console.log(response)
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  }
  
  return {
    getListCart,
    listCart,
    totalAmountRef,
    addToCart,
    removeCartItem,
    createOrderFromCart,
    updateCartQuantity
  }
})