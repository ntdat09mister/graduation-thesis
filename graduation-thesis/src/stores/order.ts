import axios from 'axios'
import { defineStore } from 'pinia'
import { ref } from 'vue'
export const useOrderStore = defineStore('order', () => {
    interface OrderItem {
        orderId: number,
        productName: string,
        srcProduct: string,
        price: number,
        quantity: number,
        createdAt: string
    }
    const nameCustomer = ref('')
    const address = ref('')
    const phoneNumber = ref('')
    const username = ref('')
    const listOrderItems = ref<OrderItem[]>([])
    async function getOrderDetail(orderId: number) {
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
            const response = await axios.get(`http://localhost:8080/order/detail?orderId=${orderId}`, config);
            const responseData = response.data;
            if (responseData && responseData.data) {
                const data = responseData.data;
                console.log(data)
                if (data && Array.isArray(data.orderItemList)) {
                    listOrderItems.value = data.orderItemList
                    nameCustomer.value = data.nameCustomer
                    address.value = data.address
                    phoneNumber.value = data.phoneNumber
                    username.value = data.username
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
    async function cancelOrder(orderId: number) {
        try {
            const token = localStorage.getItem("accessToken");
            if (!token) {
                console.error('Access token not found in localStorage');
                return;
            }
            const apiUrl = `http://localhost:8080/order/cancelOrder?orderId=${orderId}`;
            const headers = { Authorization: `Bearer ${token}` };
            const response = await axios.put(apiUrl, null, { headers });
            const responseData = response.data;
            console.log(responseData);
            const scrollPosition = window.scrollY;
            location.reload();
            window.scrollTo(0, scrollPosition);
        } catch (error) {
            console.error('Error fetching data:', error);
        }
    }
    interface Province {
        provinceId: string
        name: string
    }
    interface District {
        districtId: number
        provinceId: number
        name: string
    }
    interface Wards {
        wardsId: number,
        districtId: number,
        name: string
    }
    const listProvinces = ref<Province[]>([]), listDistricts = ref<District[]>([]), listWards = ref<Wards[]>([])
    async function getListProvinces() {
        try {
            axios.get(`http://localhost:8080/address/province`, {})
            .then((response) => {
                const { data } = response;
                const transformedData: Province[] = data.map((province: any) => ({
                    provinceId: province.provinceId,
                    name: province.name
                }))
                listProvinces.value = transformedData
                console.log(listProvinces)
            })
        } catch (error) {
            console.error('Error fetching data:', error);
        }
    }
    async function getListDistrictOfProvince(provinceId: number) {
        try {
            axios.get(`http://localhost:8080/address/province/district?provinceId=${provinceId}`, {})
            .then((response) => {
                const { data } = response;
                const transformedData: District[] = data.map((district: any) => ({
                    districtId: district.districtId,
                    provinceId: district.provinceId,
                    name: district.name
                }))
                listDistricts.value = transformedData
                console.log(listProvinces)
            })
        } catch (error) {
            console.error('Error fetching data:', error);
        }
    }
    return {
        listOrderItems,
        getOrderDetail,
        cancelOrder,
        nameCustomer,
        address,
        phoneNumber,
        username,
        getListProvinces,
        listProvinces,
        getListDistrictOfProvince,
        listDistricts
    }
})