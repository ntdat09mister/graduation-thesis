import { defineStore } from "pinia";
import { ref } from 'vue'
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

    function getListSearch(name: string) {
        return new Promise<void>((resolve) => {
            axios.get(`http://localhost:8080/search?${name}`, {}).then((response) => {
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
    return {
        getListSearch,
        listPhoneSearch
    }
})