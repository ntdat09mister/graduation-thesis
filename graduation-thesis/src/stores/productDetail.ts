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

    const listImagesDetailProducts = ref<imagesDetailProduct[]>([]);

    async function getProductImgDetail(productId: Number) {
      try {
        const response = await axios.get(`http://localhost:8080/product/detail/${productId}`);
        const responseData = response.data;
    
        // Kiểm tra xem responseData có thuộc tính "data" và "data" là mảng không
        if (responseData && Array.isArray(responseData.data)) {
          const transformedData: imagesDetailProduct[] = responseData.data.map((idp: any) => ({
            id: idp.id,
            productId: idp.productId,
            imageSrc: idp.imageSrc
          }));
          listImagesDetailProducts.value = transformedData;
          console.log(transformedData);
        } else {
          console.error('Data is not an array:', responseData);
        }
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    }

    interface Item {
        id: number
        name: string
        originalPrice: number
        sellingPrice: number
        description: string
        src: string
        quantity: number
    }
    const defaultProduct: Item = { id: 0, name: '', originalPrice: 0, sellingPrice: 0, description: '', src: '', quantity: 0 }
    const productDto = ref<Item>(defaultProduct);

    async function getProductDtoById(id: Number) {
      try {
        const response = await axios.get(`http://localhost:8080/product/${id}`);
        const data = response.data;
    
        // Kiểm tra xem response có dữ liệu không và có thuộc tính "data" không
        if (data && data.data) {
          const productData = data.data;
          const transformedData: Item = {
            id: productData.id,
            name: productData.name,
            originalPrice: parseFloat(productData.originalPrice || "0"), // Sử dụng 0 nếu không có giá trị price
            sellingPrice: parseFloat(productData.sellingPrice || "0"), // Sử dụng 0 nếu không có giá trị price
            description: productData.description,
            src: productData.src ? productData.src.replace(/\\/g, '/') : '', // Kiểm tra src trước khi thực hiện replace
            quantity: productData.quantity
          };
          productDto.value = transformedData;
          console.log(productDto.value.description);
        } else {
          console.error('No data received for ID:', id);
        }
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    }
    return {
        imageList,
        getProductImgDetail,
        listImagesDetailProducts,
        getProductDtoById,
        productDto
    }
})