<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import { defineComponent } from 'vue';
import { useHomeStore } from '../stores/home'
import { mapActions, mapState } from 'pinia';
export default defineComponent({
    components: {
        Header,
        Footer
    },
    computed: {
        ...mapState(useHomeStore, {
            listManufacturers: 'listManufacturers'
        })
    },
    methods: {
        ...mapActions(useHomeStore, ['getListIphones', 'getListManufacturers'])
    },
    data() {
        return {
            productType: 1,
            manufacturerId: null
        }
    },
    mounted() {
        this.getListIphones(this.productType, this.manufacturerId),
            this.getListManufacturers()
    }
})
</script>
<template>
    <div>
        <Header />
        <div class="flex flex-col justify-center items-center">
            <div class="w-[1200px] h-[21px] flex justify-center items-center">
                <h1>Tìm thấy <strong>30</strong> sản phẩm cho từ khóa 'iPhone'</h1>
            </div>
            <div class="w-[1200px] flex flex-row justify-between item-center">
                <h2 class="text-[25px] font-[600]">Kết quả tìm kiếm cho: 'iPhone'</h2>
                <div class="w-[600px] flex flex-row">
                    <div v-for="(company, id) in listManufacturers" :key="id"
                        class="text-[18px] bg-[#f3f4f6] rounded-[7px] mr-[10px] cursor-pointer"
                        @click="getListIphones(1, company.id)">
                        <span>{{ company.manufacturer }}</span>
                    </div>
                </div>
            </div>
            <div class="w-[1200px] flex flex-col">
            <h3>Sắp xếp theo</h3>
            <div class="h-[30px] flex flex-row">
                <div>
                    <span>Liên quan</span>
                </div>
                <div>
                    <span>Giá cao -> thấp</span>
                </div>
                <div>
                    <span>Giá thấp -> cao</span>
                </div>
            </div>
        </div>
        </div>


        <Footer />
    </div>
</template>