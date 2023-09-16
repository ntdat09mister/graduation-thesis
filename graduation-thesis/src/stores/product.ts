import axios from 'axios'
import { defineStore } from 'pinia'
import { ref } from 'vue'
export const useProductStore = defineStore('product', () => {
    interface Product {
        id: number;
        name: string;
        description: string;
        qty: number;
        price: number
        unitCount: string;
    }
    const listProducts = ref<Product[]>([]);
    function changeProduct(id: number, name: string, description: string, qty: number, price: number, unitCount: string) {
        axios.put(`http://localhost:8080/?id=${id}&name=${name}&description=${description}&qty=${qty}&price=${price}&unitCount=${unitCount}`, {})
        .then((response) => {
            const { data } = response;
            console.log(data);
        })
    }
    function getProducts() {
        axios.get(`http://localhost:8080/`, {})
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
    return {
        getProducts,
        listProducts,
        changeProduct,
    }
})