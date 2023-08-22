import { defineStore } from "pinia"
import { ref, computed } from 'vue'
import IconHome from '@/components/icons/IconHome.vue'
import IconCheckList from '@/components/icons/IconCheckList.vue'
export const useProfileStore = defineStore('profile', () => {
    let listMenuProfile = [
        { id: 1, component: IconHome, content: 'Trang chủ' },
        { id: 2, component: IconCheckList, content: 'Lịch sử mua hàng' }
    ]
})