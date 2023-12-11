<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import { defineComponent, ref } from 'vue';
import { useHomeStore } from '../stores/home'
import { mapActions, mapState } from 'pinia';
import { useSearchStore } from '@/stores/search';
import { ElPagination } from 'element-plus';
import Product from '@/components/Product.vue';
import router from '@/router';
export default defineComponent({
    components: {
        Header,
        Footer,
        ElPagination,
        Product
    },
    computed: {
        ...mapState(useHomeStore, {
            listManufacturers: 'listManufacturers'
        }),
        ...mapState(useSearchStore, {
            totalProducts: 'totalProducts',
            setPage: 'setPage',
            listDisplayProducts: 'listDisplayProducts',
            limit: 'limit'
        })
    },
    setup() {
        const currentPage = ref(1);
        const handlePageChange = (newPage: number) => {
            currentPage.value = newPage;
        };
        return {
            currentPage,
            handlePageChange,
        };
    },
    methods: {
        ...mapActions(useHomeStore, ['getListIphones', 'getListManufacturers']),
        ...mapActions(useSearchStore, ['getListSearch']),
        filterResult(filterResult: string) {
            sessionStorage.setItem("filterId", filterResult)
            this.getListSearch(String(sessionStorage.getItem("searchKeyword")), String(sessionStorage.getItem("filterId")))
        }
    },
    data() {
        return {
            productType: 1,
            manufacturerId: null,
            name: "",
            nameSearch: String(sessionStorage.getItem("searchKeyword"))
        }
    },
    mounted() {
        this.getListIphones(this.productType, this.manufacturerId),
            this.getListManufacturers(),
            this.getListSearch(String(sessionStorage.getItem("searchKeyword")), String(sessionStorage.getItem("filterId"))).then(() => {
                this.nameSearch = String(sessionStorage.getItem("searchKeyword"))
                router.push({ name: 'search' })
            });
    }
})
</script>
<template>
    <div>
        <Header />
        <div class="flex flex-col justify-center items-center">
            <div class="w-[1200px] h-[21px] flex justify-center items-center">
                <h1>Tìm thấy <strong>{{ totalProducts }}</strong> sản phẩm cho từ khóa '{{ nameSearch }}'</h1>
            </div>
            <div class="w-[1200px] flex flex-row justify-between items-center">
                <h2 class="text-[25px] font-[600]">Kết quả tìm kiếm cho: '{{ nameSearch }}'</h2>
            </div>
            <div class="w-[1200px] flex flex-col">
                <h3>Sắp xếp theo</h3>
                <div class="w-[280px] h-[30px] flex flex-row justify-between">
                    <div @click="filterResult('1')"
                        class="w-[130px] h-[29px] flex justify-center items-center rounded-[10px] bg-[#F2F2F2] cursor-pointer">
                        <button><span>Giá cao -> thấp</span></button>
                    </div>
                    <div @click="filterResult('0')"
                        class="w-[130px] h-[29px] flex justify-center items-center rounded-[10px] bg-[#F2F2F2] cursor-pointer">
                        <button><span>Giá thấp -> cao</span></button>
                    </div>
                </div>
            </div>
        </div>
        <div class="flex flex-row justify-center">
            <div v-for="item in listDisplayProducts" :key="item.id">
                <Product :src="item.src" :alt="item.name" :name="item.name" :original-price="item.originalPrice.toLocaleString('vi-VN')"
                    :sellingPrice="item.sellingPrice.toLocaleString('vi-VN')" :description="item.description" :id="item.id" />
            </div>
        </div>
        <div class="flex flex-row justify-center items-center">
            <div class="w-[212px] flex flex-row justify-between">
                <div class="comment-group scroll-comment-list">
                    <div class="comment-pagination">
                        <el-pagination background layout="prev, pager, next" :page-size="4" :total="totalProducts"
                            :current-page.sync="currentPage" @current-change="handlePageChange"
                            @click="setPage(currentPage)" />
                    </div>
                </div>
            </div>
        </div>
        <Footer />
    </div>
</template>