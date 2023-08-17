import axios from "axios";
import { defineStore } from "pinia";
import { ref } from 'vue'
export const useProductDetailStore = defineStore('productDetail', () => {
    let imageList = [
        { id: 1, src: 'https://hanoicomputercdn.com/media/banner/10_Jul294bd0f9ecb07b3e6c234e02459a1063.jpg' },
        { id: 2, src: 'https://hanoicomputercdn.com/media/banner/25_Jul881704812919b35faec78a46dee5a555.png' },
        { id: 3, src: 'https://hanoicomputercdn.com/media/banner/28_Julbf16a308bf06183c64581b5a763da365.jpg' },
        { id: 4, src: 'https://hanoicomputercdn.com/media/banner/31_Julf855258be0815e2eb82e233d3f2954d0.jpg' }
    ]
    interface imagesDetailProduct {
        id: number,
        productId: number,
        imageSrc: string
    }

    const listImagesDetailProducts = ref<imagesDetailProduct[]>([])
    function getProductImgDetail(productId: Number) {
        return new Promise<void>((resolve) => {
            axios.get(`http://localhost:8080/detail/${productId}`, {}).then((response) => {
                const { data } = response;
                const transformedData: imagesDetailProduct[] = data.map((idp: any) => ({
                    id: idp.id,
                    productId: idp.productId,
                    imageSrc: idp.imageSrc
                }))
                listImagesDetailProducts.value = transformedData
                console.log(transformedData);
                resolve();
            })
        })
    }
    interface Item {
        id: number;
        name: string;
        price: number;
        description: string;
        src: string;
    }
    const productDto = ref<Item | null>(null);
    function getProductDtoById(id: Number) {
        return new Promise<void>((resolve) => {
          axios.get(`http://localhost:8080/${id}`, {}).then((response) => {
            const { data } = response;
            const transformedData: Item = {
              id: data.id,
              name: data.name,
              price: parseFloat(data.price),
              description: data.description,
              src: data.src.replace(/\\/g, '/'),
            };
            productDto.value = transformedData;
            console.log(transformedData);
            resolve();
          });
        });
      }
    return {
        imageList,
        getProductImgDetail,
        listImagesDetailProducts,
        getProductDtoById,
        productDto
    }
})