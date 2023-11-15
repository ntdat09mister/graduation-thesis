import axios from 'axios'
import { defineStore } from 'pinia'
import { computed, ref } from 'vue'
export const useProductStore = defineStore('product', () => {
    interface Product {
        id: number;
        name: string;
        description: string;
        qty: number;
        price: number
        unitCount: string;
    }
    interface ProductAdmin {
        id: number;
        name: string;
        price: number
        description: string;
        src: string
        quantity: string
        statusProduct: string
    }
    function changeProduct(id: number, name: string, description: string, qty: number, price: number, unitCount: string) {
        axios.put(`http://localhost:8080/product?id=${id}&name=${name}&description=${description}&qty=${qty}&price=${price}&unitCount=${unitCount}`, {})
        .then((response) => {
            const { data } = response;
            console.log(data);
        })
    }
    const listProducts = ref<Product[]>([]);
    function getProducts() {
        axios.get(`http://localhost:8080/product`, {})
        .then((response) => {
            const { data } = response;
            const transformedData: Product[] = data.map((product: any) => ({
              id: product.id,
              name: product.name,
              description: product.description,
              qty: product.qty,
              price: product.price,
              unitCount: product.unitCount,
            }));
            listProducts.value = transformedData;
            console.log(transformedData);
        })
    }
    const listProductsAdmin = ref<ProductAdmin[]>([]);
    async function getProductsAdmin() {
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
            const response = await axios.get(`http://localhost:8080/product/admin/all`, config);
            const responseData = response.data;
            if (responseData && responseData.data) {
                const data = responseData.data;

                if (data && Array.isArray(data)) {
                    const transformedData: ProductAdmin[] = data.map((product: any) => ({
                        id: product.id,
                        name: product.name,
                        price: product.price,
                        description: product.description,
                        src: product.src,
                        quantity: product.quantity,
                        statusProduct: product.statusProduct,
                      }));
                    listProductsAdmin.value = transformedData;
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
    const page = ref(1)
    function setPage(value: number) { page.value = value }
    const limit = ref(8)
    const listDisplayProductAdmin = computed(() => {
        const fromOrder = (page.value - 1) * limit.value
        const toOrder = page.value * limit.value - 1
        return listProductsAdmin.value.filter((baby, index) => {
            return index >= fromOrder && index <= toOrder
        })
    })
    async function updateStatusProduct(productId: number) {
        try {
            const token = localStorage.getItem("accessToken");
            if (!token) {
                console.error('Access token not found in localStorage');
                return;
            }
            const apiUrl = `http://localhost:8080/product/admin/updateStatus?productId=${productId}`;
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
    async function updateProduct(nameInput: string, priceInput: string, descriptionInput: string, quantityInput: string, statusInput: string) {
        try {
            const token = localStorage.getItem("accessToken");
            if (!token) {
              console.error('Access token not found in localStorage');
              return;
            }
            const apiUrl = 'http://localhost:8080/user/admin/updateProduct';
            const requestData = {
                name: nameInput,
                price: priceInput,
                description: descriptionInput,
                quantity: quantityInput,
                status: statusInput
            }
            const headers = { Authorization: `Bearer ${token}` };
            const response = await axios.put(apiUrl, requestData, { headers });
            console.log(response)
            const scrollPosition = window.scrollY;
            location.reload();
            window.scrollTo(0, scrollPosition);
        } catch (error) {
            console.error('Error fetching data:', error);
          }
    }
    return {
        getProducts,
        listProducts,
        changeProduct,
        getProductsAdmin,
        listDisplayProductAdmin,
        setPage,
        listProductsAdmin,
        updateStatusProduct,
        updateProduct
    }
})