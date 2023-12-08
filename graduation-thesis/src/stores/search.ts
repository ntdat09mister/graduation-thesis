import { defineStore } from "pinia";
import { ref, computed } from 'vue'
import axios from 'axios'
export const useSearchStore = defineStore('search', () => {
    interface Item {
        id: number;
        name: string;
        originalPrice: number;
        sellingPrice:number
        description: string;
        src: string;
    }

    const page = ref(1)
    const limit = ref(4)

    const listPhoneSearch = ref<Item[]>([]);

    async function getListSearch(name: string) {
        try {
            const response = await axios.get(`http://localhost:8080/product/search?name=${name}`);
            const responseData = response.data;
            // Kiểm tra xem response có thuộc tính "data" không
            if (responseData && Array.isArray(responseData.data)) {
                const data = responseData.data;
                const transformedData: Item[] = data.map((item: any) => ({
                    id: item.id,
                    name: item.name,
                    originalPrice: parseFloat(item.originalPrice),
                    sellingPrice: parseFloat(item.sellingPrice), // Chuyển đổi giá trị thành số
                    description: item.description,
                    src: item.src
                }));
                listPhoneSearch.value = transformedData;
                console.log(transformedData);
            } else {
                console.error('Invalid data received from the API:', responseData);
            }
        } catch (error) {
            console.error('Error fetching data:', error);
        }
    }
    const listDisplayProducts = computed(() => {
        const fromProduct = (page.value - 1) * limit.value
        const toProduct = page.value * limit.value - 1
        return listPhoneSearch.value.filter((product, index) => {
            return index >= fromProduct && index <= toProduct
        })
    })
    const totalProducts = computed(() => listPhoneSearch.value.length)
    function setPage(value: number) { page.value = value }
    const totalPage = computed(() => Math.ceil(listPhoneSearch.value.length / limit.value))
    return {
        getListSearch,
        listPhoneSearch,
        totalProducts,
        listDisplayProducts,
        setPage,
        page,
        totalPage
    }
})