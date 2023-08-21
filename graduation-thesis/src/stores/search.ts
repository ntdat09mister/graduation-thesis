import { defineStore } from "pinia";
import { ref, computed } from 'vue'
import axios from 'axios'
export const useSearchStore = defineStore('search', () => {
    interface Item {
        id: number;
        name: string;
        price: number;
        description: string;
        src: string;
    }
    const listPhoneSearch = ref<Item[]>([])
    const page = ref(1)
    const limit = ref(4)

    function getListSearch(name: string) {
        return new Promise<void>((resolve) => {
            axios.get(`http://localhost:8080/search?name=${name}`, {}).then((response) => {
                const { data } = response;
                const transformedData: Item[] = data.map((item: any) => ({
                    id: item.id,
                    name: item.name,
                    price: item.price,
                    description: item.description,
                    src: item.src
                }));
                listPhoneSearch.value = transformedData;
                console.log(transformedData);
                resolve();
            });
        });
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