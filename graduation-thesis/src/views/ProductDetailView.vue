<script lang="ts">
import { Carousel, Slide, Pagination, Navigation } from 'vue3-carousel'
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import { defineComponent } from 'vue';
import { useProductDetailStore } from '@/stores/productDetail';
import { useOrderStore } from '@/stores/order';
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
            selectedVar: 1.1,
            isTruncated: true,
            capacity: '',
            color: ''
        };
    },
    methods: {
        ...mapActions(useProductDetailStore, ['getProductImgDetail', 'getProductDtoById']),
        ...mapActions(useCartStore, ['addToCart']),
        ...mapActions(useOrderStore, ['addOrderInstant']),
        changeVariant(variant: number) {
            this.selectedVar = variant;
        },
        changeBackground(value: string) {
            this.selected = value;
        },
        clickAddToCart(quantityProduct: number) {
            this.addToCart(Number(this.productDto?.id), 1, this.selectedVar,quantityProduct)
        },
        toggleDescription() {
            this.isTruncated = !this.isTruncated;
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
        <div class="w-[1400px] flex flex-col justify-between mt-[10px]">
            <div class="w-[1400px] h-[60px] flex flex-row justify-between items-center rounded-lg shadow-lg">
                <h2 class="text-[25px] font-[600]">{{ productDto?.name }}</h2>
            </div>
            <div class="w-[1400px] flex flex-row justify-between mt-[20px]">
                <div class="w-[520px] mt-[40px]">
                    <carousel :items-to-show="1" :autoplay="2000" :wrap-around="true">
                        <slide v-for="item in listImagesDetailProducts" :key="item.id">
                            <img class="w-[350px] h-[350px]" :src="item.imageSrc" alt="image_alt">
                        </slide>
                        <template #addons>
                            <navigation />
                            <pagination />
                        </template>
                    </carousel>
                </div>
                <div class="w-[400px] flex flex-col">
                    <span class="text-[20px]">Thông số kỹ thuật, mô tả sản phẩm</span>
                    <span ref="productDescription" class="w-[400px] whitespace-pre-line text-[16px]"
                        :class="{ 'truncated': isTruncated }">{{ productDto?.description }}</span>
                    <button @click="toggleDescription">{{ isTruncated ? 'Xem thêm' : 'Ẩn bớt' }}</button>
                </div>
                <div class="w-[365px]">
                    <div class="mb-[10px]">
                        <p>Chọn dung lượng mong muốn</p>
                    </div>
                    <div class="flex flex-row justify-around items-center">
                        <template v-model="capacity" v-for="variant in [1.1, 1, 0.9]">
                            <button :class="{
                                'w-[100px] h-[51px] flex flex-col justify-around items-center bg-slate-200 rounded-xl cursor-pointer': selectedVar !== variant,
                                'w-[100px] h-[51px] flex flex-col justify-around items-center bg-red-500 rounded-xl cursor-pointer': selectedVar === variant
                            }" @click="changeVariant(variant)">
                                <strong>{{ variant === 1.1 ? '1TBB' : variant === 1 ? '512GB' : '256GB' }}</strong>
                                <span>{{ (productDto?.sellingPrice || 0) * variant }}đ</span>
                        </button>
                        </template>
                    </div>
                    <div class="mt-[10px] mb-[10px]">
                        <p>Chọn màu để xem giá và chi nhánh có hàng</p>
                    </div>
                    <div class="flex flex-row justify-around items-center cursor-pointer">
                        <template v-model="color" v-for="value in ['Đen', 'Vàng', 'Trắng']">
                            <button :class="{ 'w-[100px] h-[51px] flex flex-col justify-center items-center bg-slate-200 rounded-xl': selected !== value, 'w-[100px] h-[51px] flex flex-col justify-center items-center bg-red-500 rounded-xl': selected === value }"
                                @click="changeBackground(value)">
                                <strong>{{ value }}</strong>
                            </button>
                        </template>
                    </div>
                    <div class="flex flex-row mt-[20px]">
                        <img src="https://cdn2.cellphones.com.vn/x120/https://dashboard.cellphones.com.vn/storage/B2SDIENTHOAI.jpg"
                            alt="">
                    </div>
                    <p>Số lượng còn lại trong kho: {{ productDto?.quantity }}</p>
                    <div class="w-[360px] h-[70px] flex flex-row justify-around items-center mt-[10px]">
                        <div @click="addOrderInstant(productDto?.id, productDto.sellingPrice, productDto?.quantity)"
                            class="w-[280px] h-[60px] flex flex-col justify-center items-center bg-[red] rounded-xl cursor-pointer">
                            <strong class="text-white text-base text-sm">Mua ngay</strong>
                            <span class="text-white text-base text-xs">(Giao nhanh từ 2 giờ hoặc nhận tại cửa hàng)</span>
                        </div>
                        <div class="w-[60px] h-[60px] flex flex-col justify-center items-center border-[2px] border-red-500 rounded-xl cursor-pointer"
                            @click="clickAddToCart(productDto?.quantity)">
                            <IconAddToCart class="w-[30px] h-[30px] fill-[#FF0000]" />
                            <span class="text-[7px] text-[red]">Thêm vào giỏ</span>
                        </div>
                    </div>
                    <div class="w-[360px] flex flex-col mt-[10px] border border-red-200 rounded-lg mt-[10px]">
                        <div class="w-[360px] h-[42px] flex flex-row items-center bg-red-100">
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
<style scoped>
.truncated {
    max-height: 400px;
    /* Số chiều cao tối đa ban đầu */
    overflow: hidden;
}

.truncated.expanded {
    max-height: none;
    /* Khi được mở rộng, không có giới hạn chiều cao */
}
</style>