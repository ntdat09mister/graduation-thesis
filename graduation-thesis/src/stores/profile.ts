import { defineStore } from "pinia"
import { ref, computed } from 'vue'
import IconHome from '@/components/icons/IconHome.vue'
import IconCheckList from '@/components/icons/IconCheckList.vue'
import IconWarranty from '@/components/icons/IconWarranty.vue'
import IconPromoCheck from '@/components/icons/IconPromoCheck.vue'
import IconRank from '@/components/icons/IconRank.vue'
import IconLogin from '@/components/icons/IconLogin.vue'
import IconSupport from '@/components/icons/IconSupport.vue'
import IconLogout from '@/components/icons/IconLogout.vue'
export const useProfileStore = defineStore('profile', () => {
    let listMenuProfile = [
        { id: 1, component: IconHome, content: 'Trang chủ' },
        { id: 2, component: IconCheckList, content: 'Lịch sử mua hàng' },
        { id: 2, component: IconWarranty, content: 'Tra cứu bảo hành' },
        { id: 2, component: IconPromoCheck, content: 'Ưu đãi của bạn' },
        { id: 2, component: IconRank, content: 'Hạng thành viên' },
        { id: 2, component: IconLogin, content: 'Tài khoản của bạn' },
        { id: 2, component: IconSupport, content: 'Hỗ trợ' },
        { id: 2, component: IconLogout, content: 'Đăng xuất' }
    ]
    return {
        listMenuProfile
    }
})