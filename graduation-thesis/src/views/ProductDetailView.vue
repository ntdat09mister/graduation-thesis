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
            isTruncated: true,
            selectedCapacity1: true,
            selectedCapacity2: false,
            selectedCapacity3: false,
            selectedCapacity: '256GB',
            selectedColor1: true,
            selectedColor2: false,
            selectedColor3: false,
            selectedColor: 'Đen',
            classify: 'Chưa ăn',
            sellingPrice: 0
        };
    },
    methods: {
        ...mapActions(useProductDetailStore, ['getProductImgDetail', 'getProductDtoById']),
        ...mapActions(useCartStore, ['addToCart']),
        ...mapActions(useOrderStore, ['addOrderInstant']),
        changeBackground(value: string) {
            this.selected = value;
        },
        clickAddToCart(quantityProduct: number, selectedCapacity: string, selectedColor: string, productSelling: number) {
            // console.log(selectedCapacity, selectedColor)
            this.classify = 'Màu ' + selectedColor + ', Dung lượng ' + selectedCapacity
            console.log(productSelling)
            this.addToCart(Number(this.productDto?.id), 1, this.sellingPrice, quantityProduct, this.classify, productSelling)
        },
        clickAddOrderInstant(productId: number, sellingPriceInput: number, quantity: number, selectedCapacity: string, selectedColor: string) {
            this.classify = 'Màu ' + selectedColor + ', Dung lượng ' + selectedCapacity
            if (selectedCapacity === '256GB') {
                sellingPriceInput = sellingPriceInput - sellingPriceInput * 0.1
            }
            if (selectedCapacity === '1TB') {
                sellingPriceInput = sellingPriceInput + sellingPriceInput * 0.1
            }
            console.log(sellingPriceInput)
            this.addOrderInstant(productId, sellingPriceInput, quantity, this.classify)
        },
        toggleDescription() {
            this.isTruncated = !this.isTruncated;
        },
        checkQuantity(quantity: number) {
            if (quantity === 0) {
                return 'Hết hàng'
            } else {
                return 'Số lượng còn lại trong kho:' + quantity
            }
        },
        changeCapa1() {
            this.selectedCapacity1 = true
            this.selectedCapacity2 = false
            this.selectedCapacity3 = false
            this.sellingPrice = this.productDto?.sellingPrice * 0.9
            this.selectedCapacity = '256GB'
            console.log("Chọn bản 256GB")
        },
        changeCapa2() {
            this.selectedCapacity1 = false
            this.selectedCapacity2 = true
            this.selectedCapacity3 = false
            this.sellingPrice = this.productDto?.sellingPrice
            this.selectedCapacity = '512GB'
            console.log("Chọn bản 512GB")
        },
        changeCapa3() {
            this.selectedCapacity1 = false
            this.selectedCapacity2 = false
            this.selectedCapacity3 = true
            this.sellingPrice = this.productDto?.sellingPrice + this.productDto?.sellingPrice * 0.1
            this.selectedCapacity = '1TB'
            console.log("Chọn bản 1TB")
        },
        changeColor1() {
            this.selectedColor1 = true
            this.selectedColor2 = false
            this.selectedColor3 = false
            this.selectedColor = 'Đen'
            console.log("Màu đen")
        },
        changeColor2() {
            this.selectedColor1 = false
            this.selectedColor2 = true
            this.selectedColor3 = false
            this.selectedColor = 'Vàng'
            console.log("Màu vàng")
        },
        changeColor3() {
            this.selectedColor1 = false
            this.selectedColor2 = false
            this.selectedColor3 = true
            this.selectedColor = 'Trắng'
            console.log("Màu trắng")
        },
        setDefaultPrice() {
            this.sellingPrice = this.productDto?.sellingPrice * 0.9
        }
    },
    created() {
        const { id } = this.$route.params
        this.getProductImgDetail(Number(id))
        this.getProductDtoById(Number(id))
        this.checkQuantity(this.productDto?.quantity)
        this.changeCapa1()
    },
    mounted() {
        
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
                        <button @click="changeCapa1()" :class="{
                            'w-[100px] h-[51px] flex flex-col justify-center items-center bg-red-500 rounded-xl': selectedCapacity1 === true,
                            'w-[100px] h-[51px] flex flex-col justify-center items-center bg-slate-200 rounded-xl': selectedCapacity1 === false
                        }">
                            <strong>256GB</strong>
                            <span>{{ (productDto?.sellingPrice * 0.9).toLocaleString('vi-VN') }}đ</span>
                        </button>
                        <button @click="changeCapa2()" :class="{
                            'w-[100px] h-[51px] flex flex-col justify-center items-center bg-red-500 rounded-xl': selectedCapacity2 === true,
                            'w-[100px] h-[51px] flex flex-col justify-center items-center bg-slate-200 rounded-xl': selectedCapacity2 === false
                        }">
                            <strong>512GB</strong>
                            <span>{{ productDto?.sellingPrice.toLocaleString('vi-VN') }}đ</span>
                        </button>
                        <button @click="changeCapa3()" :class="{
                            'w-[100px] h-[51px] flex flex-col justify-center items-center bg-red-500 rounded-xl': selectedCapacity3 === true,
                            'w-[100px] h-[51px] flex flex-col justify-center items-center bg-slate-200 rounded-xl': selectedCapacity3 === false
                        }">
                            <strong>1TB</strong>
                            <span>{{ (productDto?.sellingPrice + productDto?.sellingPrice * 0.1).toLocaleString('vi-VN') }}đ</span>
                        </button>
                    </div>
                    <div class="mt-[10px] mb-[10px]">
                        <p>Chọn màu để xem giá và chi nhánh có hàng</p>
                    </div>
                    <div class="flex flex-row justify-around items-center">
                        <button @click="changeColor1()" :class="{
                            'w-[100px] h-[51px] flex flex-col justify-center items-center bg-red-500 rounded-xl': selectedColor1 === true,
                            'w-[100px] h-[51px] flex flex-col justify-center items-center bg-slate-200 rounded-xl': selectedColor1 === false
                        }">
                            <strong>Đen</strong>
                        </button>
                        <button @click="changeColor2()" :class="{
                            'w-[100px] h-[51px] flex flex-col justify-center items-center bg-red-500 rounded-xl': selectedColor2 === true,
                            'w-[100px] h-[51px] flex flex-col justify-center items-center bg-slate-200 rounded-xl': selectedColor2 === false
                        }">
                            <strong>Vàng</strong>
                        </button>
                        <button @click="changeColor3()" :class="{
                            'w-[100px] h-[51px] flex flex-col justify-center items-center bg-red-500 rounded-xl': selectedColor3 === true,
                            'w-[100px] h-[51px] flex flex-col justify-center items-center bg-slate-200 rounded-xl': selectedColor3 === false
                        }">
                            <strong>Trắng</strong>
                        </button>
                    </div>
                    <div class="flex flex-row mt-[20px]">
                        <img src="https://cdn2.cellphones.com.vn/x120/https://dashboard.cellphones.com.vn/storage/B2SDIENTHOAI.jpg"
                            alt="">
                    </div>
                    <div class="w-[300px] flex justify-center">
                        <p>{{ checkQuantity(Number(productDto?.quantity)) }}</p>
                    </div>
                    <div class="w-[360px] h-[70px] flex flex-row justify-around items-center mt-[10px]">
                        <div @click="clickAddOrderInstant(productDto?.id, productDto.sellingPrice, productDto?.quantity, selectedCapacity, selectedColor)"
                            class="w-[280px] h-[60px] flex flex-col justify-center items-center bg-[red] rounded-xl cursor-pointer">
                            <strong class="text-white text-base text-sm">Mua ngay</strong>
                            <span class="text-white text-base text-xs">(Giao nhanh từ 2 giờ hoặc nhận tại cửa hàng)</span>
                        </div>
                        <div class="w-[60px] h-[60px] flex flex-col justify-center items-center border-[2px] border-red-500 rounded-xl cursor-pointer"
                            @click="clickAddToCart(productDto?.quantity, selectedCapacity, selectedColor, productDto?.sellingPrice)">
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