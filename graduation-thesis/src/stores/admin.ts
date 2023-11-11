import axios from 'axios'
import { ref, computed } from 'vue'
import { defineStore } from 'pinia'
export const useAdminStore = defineStore('admin', () => {
    interface User {
        id: number,
        username: string,
        name: string,
        gender: string,
        address: string,
        phone: string,
        role: string,
        avatar: string,
        createdAt: string,
        modifiedAt: string
    }

    interface OrderForAdmin {
        id: number,
        src: string,
        listProducts: string,
        totalAmount: number,
        username: string,
        nameCustomer: string,
        phoneNumber: string,
        address: string,
        status: string,
        createdAt: string,
    }

    const listOrdersAdmin = ref<OrderForAdmin[]>([]);

    const user = ref<User | null>(null);

    async function getInforUser() {
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
            const response = await axios.get(`http://localhost:8080/user/info`, config);
            const responseData = response.data;
            if (responseData && responseData.data) {
                const data = responseData.data;
                if (data) { user.value = data; console.log(user.value); } else {
                    console.error('Invalid data received from the API:', data);
                }
            } else {
                console.error('No data received from the API');
            }
        } catch (error) {
            console.error('Error fetching data:', error);
        }
    }
    async function getAllOrdersAdmin(filterId: number) {
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
            const response = await axios.get(`http://localhost:8080/order/admin/all?filterId=${filterId}`, config);
            const responseData = response.data;
            if (responseData && responseData.data) {
                const data = responseData.data;
                console.log(data)
                if (data && Array.isArray(data)) {
                    listOrdersAdmin.value = data;
                    console.log(listOrdersAdmin)
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
    async function updateStatusOrder(orderId: number) {
        try {
            const token = localStorage.getItem("accessToken");
            if (!token) {
                console.error('Access token not found in localStorage');
                return;
            }
            const apiUrl = `http://localhost:8080/order/admin/updateStatusOrder?orderId=${orderId}`;
            const headers = { Authorization: `Bearer ${token}` };
            const response = await axios.put(apiUrl, null, { headers });
            const responseData = response.data;
            console.log(responseData);
            
        } catch (error) {
            console.error('Error fetching data:', error);
        }
    }
    const page = ref(1)
    function setPage(value: number) { page.value = value }
    const limit = ref(8)
    const listDisplayOrderAdmin = computed(() => {
        const fromOrder = (page.value - 1) * limit.value
        const toOrder = page.value * limit.value - 1
        return listOrdersAdmin.value.filter((baby, index) => {
            return index >= fromOrder && index <= toOrder
        })
    })
    return {
        getInforUser,
        user,
        listOrdersAdmin,
        getAllOrdersAdmin,
        setPage,
        listDisplayOrderAdmin,
        updateStatusOrder
    }
})