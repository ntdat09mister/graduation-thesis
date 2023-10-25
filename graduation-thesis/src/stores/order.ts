import axios from 'axios'
import { defineStore } from 'pinia'
import { ref } from 'vue'
import router from '@/router'
export const useOrderStore = defineStore('order', () => {
    interface Order {
        id: number,
        userId: number,
        totalAmount: number,
        status: string,
        createdAt: string,
    }
    const listOrders = ref<Order[]>([]);
    async function getAllOrders() {
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
            const response = await axios.get(`http://localhost:8080/order/all`, config);
            const responseData = response.data;
            if (responseData && responseData.data) {
                const data = responseData.data;
                
                if (data && Array.isArray(data)) {
                    listOrders.value = data;                    
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
        getAllOrders,
        listOrders
    }
})