<script lang="ts">
import { Carousel, Slide, Pagination, Navigation } from 'vue3-carousel'
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import { defineComponent } from 'vue';
import { useProductDetailStore } from '@/stores/productDetail';
import { mapActions, mapState } from 'pinia';
import IconGift from '@/components/icons/IconGift.vue'
import IconAddToCart from '@/components/icons/IconAddToCart.vue'
import { useCartStore } from '@/stores/cart';
export default defineComponent({
    components: {
        Carousel,
        Slide,
        Pagination,
        Navigation,
        Header,
        Footer,
        IconAddToCart,
        IconGift
    },
    computed: {
        ...mapState(useProductDetailStore, {
            imageList: 'imageList',
            listImagesDetailProducts: 'listImagesDetailProducts',
            productDto: 'productDto'
        })
    },
    data() {
        return {
            selected: 'Đen',
            selectedVar: 1.25
        };
    },
    methods: {
        ...mapActions(useProductDetailStore, ['getProductImgDetail', 'getProductDtoById']),
        ...mapActions(useCartStore, ['addToCart']),
        changeVariant(variant: number) {
            this.selectedVar = variant;
        },
        changeBackground(value: string) {
            this.selected = value;
        },
        clickAddToCart() {
            this.addToCart(Number(this.productDto?.id), 1, this.selectedVar)
        }
    },
    created() {
        const { id } = this.$route.params
        this.getProductImgDetail(Number(id))
        this.getProductDtoById(Number(id))
    }
})
</script>
<template>
    <div class="flex flex-col justify-center items-center">
        <Header />
        <div class="w-[1200px] flex flex-col justify-between mt-[10px]">
            <div class="w-[1200px] h-[60px] flex flex-row justify-between items-center rounded-lg shadow-lg">
                <h2 class="text-[25px] font-[600]">{{ productDto?.name }}</h2>
            </div>
            <div class="w-[1200px] flex flex-row justify-between mt-[20px]">
                <div class="w-[720px]">
                    <carousel :items-to-show="1" :autoplay="2000" :wrap-around="true">
                        <slide v-for="item in listImagesDetailProducts" :key="item.id">
                            <img class="w-[400px] h-[370px]" :src="item.imageSrc" alt="image_alt">
                        </slide>
                        <template #addons>
                            <navigation />
                            <pagination />
                        </template>
                    </carousel>
                </div>
                <div class="w-[465px]">
                    <div class="mb-[10px]">
                        <p>Chọn dung lượng mong muốn</p>
                    </div>
                    <div class="flex flex-row justify-around items-center">
                        <template v-for="variant in [1.25, 1, 0.75]">
                            <div :class="{
                                'w-[147px] h-[51px] flex flex-col justify-around items-center bg-slate-200 rounded-xl cursor-pointer': selectedVar !== variant,
                                'w-[147px] h-[51px] flex flex-col justify-around items-center bg-red-500 rounded-xl cursor-pointer': selectedVar === variant
                            }" @click="changeVariant(variant)">
                                <strong>{{ variant === 1 ? '512GB' : variant === 0.75 ? '256GB' : '1TB' }}</strong>
                                <span>{{ (productDto?.price || 0) * variant }}đ</span>
                            </div>
                        </template>
                    </div>
                    <div class="mt-[10px] mb-[10px]">
                        <p>Chọn màu để xem giá và chi nhánh có hàng</p>
                    </div>
                    <div class="flex flex-row justify-around items-center cursor-pointer">
                        <template v-for="value in ['Đen', 'Vàng', 'Trắng']">
                            <div :class="{ 'w-[147px] h-[51px] flex flex-col justify-center items-center bg-slate-200 rounded-xl': selected !== value, 'w-[147px] h-[51px] flex flex-col justify-center items-center bg-red-500 rounded-xl': selected === value }"
                                @click="changeBackground(value)">
                                <strong>{{ value }}</strong>
                            </div>
                        </template>
                    </div>
                    <div class="flex flex-row mt-[20px]">
                        <img src="https://cdn2.cellphones.com.vn/x120/https://dashboard.cellphones.com.vn/storage/B2SDIENTHOAI.jpg"
                            alt="">
                    </div>
                    <p>Số lượng còn lại trong kho: {{ productDto?.quantity }}</p>
                    <div class="w-[460px] h-[70px] flex flex-row justify-around items-center mt-[10px]">
                        <div
                            class="w-[390px] h-[60px] flex flex-col justify-center items-center bg-[red] rounded-xl cursor-pointer">
                            <strong class="text-white text-base text-sm">Mua ngay</strong>
                            <span class="text-white text-base text-xs">(Giao nhanh từ 2 giờ hoặc nhận tại cửa hàng)</span>
                        </div>
                        <div
                            class="w-[60px] h-[60px] flex flex-col justify-center items-center border-[2px] border-red-500 rounded-xl cursor-pointer" @click="clickAddToCart">
                            <IconAddToCart class="w-[30px] h-[30px] fill-[#FF0000]" />
                            <span class="text-[7px] text-[red]">Thêm vào giỏ</span>
                        </div>
                    </div>
                    <div class="w-[460px] flex flex-col mt-[10px] border border-red-200 rounded-lg mt-[10px]">
                        <div class="w-[458px] h-[42px] flex flex-row items-center bg-red-100">
                            <IconGift class="w-[20px] h-[20px] ml-[10px] fill-[#FF0000]" />
                            <p class="ml-[10px] text-red-600 font-semibold">Khuyến mãi</p>
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