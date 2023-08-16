<script lang="ts">
import { Carousel, Slide, Pagination, Navigation } from 'vue3-carousel'
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import { defineComponent } from 'vue';
import { useProductDetailStore } from '@/stores/productDetail';
import { mapState } from 'pinia';
export default defineComponent({
    components: {
        Carousel,
        Slide,
        Pagination,
        Navigation,
        Header,
        Footer
    },
    computed: {
        ...mapState(useProductDetailStore, {
            imageList: 'imageList'
        })
    }

})
</script>
<template>
    <div class="flex flex-col justify-center items-center">
        <Header />
        <div class="w-[1200px] flex flex-col justify-between mt-[10px]">
            <div class="w-[1200px] h-[60px] flex flex-row justify-between items-center rounded-lg shadow-lg">
                <h2 class="text-[25px] font-[600]">Samsung Galaxy Z Fold5 12GB 512GB</h2>
            </div>
            <div class="w-[1200px] flex flex-row justify-between mt-[10px]">
                <div class="w-[720px]">
                    <carousel :items-to-show="1" :autoplay="2000" :wrap-around="true">
                        <slide v-for="item in imageList" :key="item.id">
                            <img class="w-[800px] h-[370px]" :src="item.src" alt="image_alt">
                        </slide>
                        <template #addons>
                            <navigation />
                            <pagination />
                        </template>
                    </carousel>
                </div>
                <div class="w-[480px]">
                    <div class="flex flex-row justify-around items-center">
                        <div class="w-[146] h-[51px] flex flex-col justify-between items-center">
                            <strong>1TB</strong>
                            <span>1000000</span>
                        </div>
                        <div class="w-[146] h-[51px] flex flex-col justify-between items-center">
                            <strong>512GB</strong>
                            <span>1000000</span>
                        </div>
                        <div class="w-[146] h-[51px] flex flex-col justify-between items-center">
                            <strong>256GB</strong>
                            <span>1000000</span>
                        </div>
                    </div>
                    <div>
                        <p>Chọn màu để xem giá và chi nhánh có hàng</p>
                    </div>
                    <div class="flex flex-row justify-around items-center">
                        <div class="w-[146] h-[51px] flex flex-col justify-between items-center">
                            <strong>Vàng</strong>
                            <span>1000000</span>
                        </div>
                        <div class="w-[146] h-[51px] flex flex-col justify-between items-center">
                            <strong>Đen</strong>
                            <span>1000000</span>
                        </div>
                        <div class="w-[146] h-[51px] flex flex-col justify-between items-center">
                            <strong>Đỏ</strong>
                            <span>1000000</span>
                        </div>
                    </div>
                    <div class="flex flex-row">
                        <img src="https://cdn2.cellphones.com.vn/x120/https://dashboard.cellphones.com.vn/storage/B2SDIENTHOAI.jpg" alt="">
                    </div>
                    <div class="flex flex-col">
                        <div>
                            <p>Khuyến mãi</p>
                        </div>
                        <div class="flex flex-col">
                            <span>Thu cũ lên đời trợ giá 2 triệu - Giá thu tốt nhất thị trường</span>
                            <span>Tặng gói Microsoft Office 365 6 tháng</span>
                            <span>Tặng gói Samsung Care+ 1 năm</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <Footer />
    </div>
</template>