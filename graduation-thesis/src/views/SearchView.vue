<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import { defineComponent, ref } from 'vue';
import { useHomeStore } from '../stores/home'
import { mapActions, mapState } from 'pinia';
import { useSearchStore } from '@/stores/search';
import { ElPagination } from 'element-plus';
import Product from '@/components/Product.vue';
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
        ...mapActions(useSearchStore, ['getListSearch'])
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
            this.getListSearch(String(sessionStorage.getItem("searchKeyword"))).then(() => {
            this.nameSearch = String(sessionStorage.getItem("searchKeyword"));
            console.log(this.listDisplayProducts)
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
                <!-- <div class="w-[600px] flex flex-row justify-between item-center">
                    <div v-for="(company, id) in listManufacturers" :key="id"
                        class="text-[18px] bg-[#f3f4f6] rounded-[7px] mr-[10px] cursor-pointer"
                        @click="getListIphones(1, company.id)">
                        <span>{{ company.manufacturer }}</span>
                    </div>
                </div> -->
            </div>
            <div class="w-[1200px] flex flex-col">
                <h3>Sắp xếp theo</h3>
                <div class="h-[30px] flex flex-row">
                    <div class="w-[74px] h-[29px] flex justify-center items-center cursor-pointer">
                        <span>Tất cả</span>
                    </div>
                    <div class="w-[74px] h-[29px] flex justify-center items-center cursor-pointer">
                        <span>Giá cao</span>
                    </div>
                    <div class="w-[74px] h-[29px] flex justify-center items-center cursor-pointer">
                        <span>Giá thấp</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="flex flex-row justify-center">
            <div v-for="item in listDisplayProducts" :key="item.id">
                <Product :src="item.src" :alt="item.name" :name="item.name" :original-price="item.originalPrice" :sellingPrice="item.sellingPrice" 
                    :description="item.description" :id="item.id" />
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