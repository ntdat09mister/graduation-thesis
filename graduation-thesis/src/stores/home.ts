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
        { id: 1, src: 'https://hanoicomputercdn.com/media/banner/10_Jul294bd0f9ecb07b3e6c234e02459a1063.jpg' },
        { id: 2, src: 'https://hanoicomputercdn.com/media/banner/25_Jul881704812919b35faec78a46dee5a555.png' },
        { id: 3, src: 'https://hanoicomputercdn.com/media/banner/28_Julbf16a308bf06183c64581b5a763da365.jpg' },
        { id: 4, src: 'https://hanoicomputercdn.com/media/banner/31_Julf855258be0815e2eb82e233d3f2954d0.jpg' }
    ],
    companyList = [
        { id: 1, name: 'Apple' },
        { id: 2, name: 'Samsung' },
        { id: 3, name: 'Xiaomi' },
        { id: 4, name: 'Oppo' },
        { id: 5, name: 'Vivo' },
        { id: 6, name: 'Realme' },
        { id: 7, name: 'Nokia' },
        { id: 8, name: 'Asus' },
        { id: 9, name: 'Tecno' },
        { id: 10, name: 'Xem tất cả' }
      ]
    const listIphones = ref([])
    function getListIphones() {
        return new Promise((resolve) => {
            axios.get('http://localhost:8080/?productType=1', {})
            .then(response => {
                const { data } = response
                listIphones.value = data
                console.log(data);
                resolve(null)
            })
        })
    }
    return {
        getListIphones,
        listIphones,
        imageList,
        contentComponents,
        companyList
    }
})