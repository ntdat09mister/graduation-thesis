import { defineStore } from "pinia";
import { ref } from 'vue'
import axios from 'axios'
import IconIphone from '@/components/icons/IconIphone.vue'
import IconLaptop from '@/components/icons/IconLaptop.vue'
import IconHeadPhone from '@/components/icons/IconHeadPhone.vue'
import IconAppleWatch from '@/components/icons/IconAppleWatch.vue'
import IconSmartHome from '@/components/icons/IconSmartHome.vue'
import IconAccessory from '@/components/icons/IconAccessory.vue'
import IconDesktop from '@/components/icons/IconDesktop.vue'
import IconTV from '@/components/icons/IconTV.vue'
import IconPhoneExchange from '@/components/icons/IconPhoneExchange.vue'
import IconOldPhone from '@/components/icons/IconOldPhone.vue'
import IconSale from '@/components/icons/IconSale.vue'
import IconNews from '@/components/icons/IconNews.vue'
export const useHomeStore = defineStore('home', () => {
  let contentComponents = [
    { id: 1, component: IconIphone, content: 'Iphone, Tablet' },
    { id: 2, component: IconLaptop, content: 'Laptop' },
    { id: 3, component: IconHeadPhone, content: 'Âm thanh' },
    { id: 4, component: IconAppleWatch, content: 'Đồng hồ' },
    { id: 5, component: IconSmartHome, content: 'Đồ gia dụng' },
    { id: 6, component: IconAccessory, content: 'Phụ kiện' },
    { id: 7, component: IconDesktop, content: 'Desktop' },
    { id: 8, component: IconTV, content: 'TV, màn hình' },
    { id: 9, component: IconPhoneExchange, content: 'Thu cũ đổi mới' },
    { id: 10, component: IconOldPhone, content: 'Hàng cũ' },
    { id: 11, component: IconSale, content: 'Khuyến mại' },
    { id: 12, component: IconNews, content: 'Tin tức công nghệ' }
  ], imageList = [
    { id: 1, src: 'https://news.khangz.com/wp-content/uploads/2022/09/tinh-nang-moi-cua-iPhone-14-pro-max-8.jpg' },
    { id: 2, src: 'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2022/8/4/1077179/Anh-Chup-Man-Hinh-20-04.png' },
    { id: 3, src: 'https://cdn.sforum.vn/sforum/wp-content/uploads/2022/01/iPhone-14-se-khong-co-man-hinh-120Hz.jpg' },
    { id: 4, src: 'https://minhtuanmobile.com/uploads/blog/cach-chup-anh-thien-van-cuc-dep-chi-voi-iphone-cua-ban-220805072120.jpg' }
  ]
  interface Item {
    id: number,
    name: string,
    originalPrice: number,
    sellingPrice: number,
    description: string,
    src: string
  }

  interface Manufacturer {
    id: number,
    manufacturer: string,
    productType: number
  }

  const listIphones = ref<Item[]>([]);

  async function getListIphones(productType: number | null, manufacturerId: number | null) {
    try {
      let url = 'http://localhost:8080/product';
      const params = new URLSearchParams();
  
      if (productType !== null) {
        params.append('productType', productType.toString());
      }
  
      if (manufacturerId !== null) {
        params.append('manufacturerId', manufacturerId.toString());
      }
  
      if (params.toString()) {
        url += `?${params.toString()}`;
      }
      const response = await axios.get(url);
      const responseData = response.data;
      console.log('123123123')
      // Kiểm tra xem responseData có thuộc tính "data" và "data" là mảng không
      if (responseData && Array.isArray(responseData.data)) {
        const transformedData: Item[] = responseData.data.map((item: any) => ({
          id: item.id,
          name: item.name,
          originalPrice: parseFloat(item.originalPrice),
          sellingPrice: parseFloat(item.sellingPrice),
          description: item.description,
          src: item.src.replace(/\\/g, '/'),
        }));
        listIphones.value = transformedData;
        console.log(transformedData);
      } else {
        console.error('Data is not an array:', responseData);
      }
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  }

  const listManufacturers = ref<Manufacturer[]>([]);

  async function getListManufacturers() {
    try {
      const response = await axios.get('http://localhost:8080/product/manufacturer');
      const responseData = response.data;
  
      // Kiểm tra xem responseData có thuộc tính "data" và "data" là mảng không
      if (responseData && Array.isArray(responseData.data)) {
        const transformedData: Manufacturer[] = responseData.data.map((manu: any) => ({
          id: manu.id,
          manufacturer: manu.manufacturer,
          productType: manu.productType
        }));
        listManufacturers.value = transformedData;
        console.log(transformedData);
      } else {
        console.error('Data is not an array:', responseData);
      }
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  }

  return {
    getListIphones,
    listIphones,
    imageList,
    contentComponents,
    getListManufacturers,
    listManufacturers
  }
})