import axios from 'axios'
import { defineStore } from 'pinia'
import { ref } from 'vue'
import { toast } from 'vue3-toastify'
import router from '@/router'
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
    const totalAmount = ref(1)
    const idOrder = ref(1)
    const statusDetail = ref('')
    const listOrderItems = ref<OrderItem[]>([])
    const today = new Date(); 
    const toDaytime = ref('')
    const day = today.getDate(); 
    const month = today.getMonth(); 
    const year = today.getFullYear();
    const paymentStatus = ref(0)
    toDaytime.value = `${day + 1}/${month}/${year}`
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
                    totalAmount.value = data.totalAmount
                    idOrder.value = data.orderId
                    statusDetail.value = data.status
                    paymentStatus.value = data.paymentStatus
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
    interface Order {
        id: number,
        src: string,
        listProducts: string,
        totalAmount: number,
        status: string,
        createdAt: string
    }
    const listOrders = ref<Order[]>([])
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
            const responseData = response.data
            if (responseData && responseData.data) {
                listOrders.value = responseData.data
                console.log(listOrders)
            }
        } catch (error) {
            console.error('Error fetching data:', error);
        }
    }
    async function addOrderInstant(productId: number, price: number, productQuantity: number) {
        try {
            if (productQuantity === 0) {
                toast.error("Sản phẩm đã hết vui lòng chọn sản phẩm khác");
                return;
              }
            if (!productId || !price) {
                toast.error("Không tạo được đơn hàng");
                return;
            }
            const token = localStorage.getItem("accessToken");
            if (!token) {
                console.error('Access token not found in localStorage');
                return;
            }
            const apiUrl = 'http://localhost:8080/order/addOrderInstant';
            const requestData = {
                productId: productId,
                price: price
            }
            const headers = { Authorization: `Bearer ${token}` };
            const response = await axios.post(apiUrl, requestData, { headers });
            if (response.data) {
                console.log(response.data)
                toast.loading('Đang tạo đơn hàng....')
                setTimeout(() => {
                    router.push({ name: 'payment', params: { id: Number(response.data.data) } })
                }, 2000);
            }
        } catch (error) {
            toast.error("Không tạo được đơn hàng!")
        }
    }
    async function cancelOrder(orderId: number) {
        try {
            const token = localStorage.getItem("accessToken");
            if (!token) {
                console.error('Access token not found in localStorage');
                return;
            }
            toast.loading('Đang hủy đơn hàng....')
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
    async function updatePayment(orderId: number, address: string, phoneNumber: string) {
        try {
            if (!phoneNumber) {
                toast.error("Vui lòng nhập số điện thoại");
                return;
            }
            if (phoneNumber.length > 11 || phoneNumber.length < 10) {
                toast.error("Số điện thoại phải là 10 hoặc 11 số");
                return;
            }
            if (!address) {
                toast.error("Vui lòng nhập địa chỉ");
                return;
            }
            const token = localStorage.getItem("accessToken");
            if (!token) {
                console.error('Access token not found in localStorage');
                return;
            }
            const requestData = {
                orderId: orderId,
                address: address,
                phoneNumber: phoneNumber
            }
            const apiUrl = `http://localhost:8080/order/updatePayment`;
            const headers = { Authorization: `Bearer ${token}` };
            const response = await axios.put(apiUrl, requestData, { headers });
            if (response.data) {

                toast.loading('Đang tạo đơn hàng....')
                console.log(orderId)
                setTimeout(() => {
                    router.push({ name: 'orderDetail', params: { id: orderId } })
                }, 2000);
            }

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
    async function getListWardsOfDistrict(districtId: number) {
        try {
            axios.get(`http://localhost:8080/address/province/district/wards?districtId=${districtId}`, {})
                .then((response) => {
                    const { data } = response;
                    const transformedData: Wards[] = data.map((wards: any) => ({
                        wardsId: wards.wardsId,
                        districtId: wards.districtId,
                        name: wards.name
                    }))
                    listWards.value = transformedData
                    console.log(listProvinces)
                })
        } catch (error) {
            console.error('Error fetching data:', error);
        }
    }

    const adressSelected = ref('')
    async function concatAddress(wardsId: number, districtId: number, provinceId: number) {
        const response = await axios.get(`http://localhost:8080/address/concatAddress?wardsId=${wardsId}&districtId=${districtId}&provinceId=${provinceId}`)
        adressSelected.value = response.data
        console.log(response.data)
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
        listDistricts,
        addOrderInstant,
        getListWardsOfDistrict,
        listWards,
        concatAddress,
        adressSelected,
        totalAmount,
        idOrder,
        statusDetail,
        getAllOrders,
        listOrders,
        updatePayment,
        toDaytime,
        paymentStatus
    }
})