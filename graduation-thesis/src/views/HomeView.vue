<script lang="ts">
import 'vue3-carousel/dist/carousel.css'
import { Carousel, Slide, Pagination, Navigation } from 'vue3-carousel'
import { defineComponent } from 'vue';
import { useHomeStore } from '../stores/home'
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import { mapActions, mapState } from 'pinia';
import Product from '@/components/Product.vue';
export default defineComponent({
  components: {
    Carousel,
    Slide,
    Pagination,
    Navigation,
    Header,
    Footer,
    Product
  },
  computed: {
    ...mapState(useHomeStore, {
      contentComponents: 'contentComponents',
      imageList: 'imageList',
      listIphones: 'listIphones',
      listManufacturers: 'listManufacturers'
    })
  },
  data() {
    return {
      productType: 1,
      manufacturerId: null
    }
  },
  methods: {
    ...mapActions(useHomeStore, ['getListIphones', 'getListManufacturers'])
  },
  mounted() {
    this.getListIphones(this.productType, this.manufacturerId),
      this.getListManufacturers()
  }
})
</script>

<template>
  <div class="flex flex-col justify-center items-center">
    <Header />
    <div class="w-[1200px] h-[385px] flex flex-row justify-between items-center mt-[5px]">
      <div class="w-[260px] h-[376px] flex flex-col justify-around shadow-inner rounded-[15px] mb-[17px]">
        <!-- <div v-for="(component, id) in contentComponents" :key="id">
          <div class="w-[181px] h-[29px] flex flex-row justify-between items-center">
            <component :is="component.component" width="25px" />
            <span>{{ component.content }}</span>
          </div>
        </div> -->
        <img class="w-[260px] h-[376px]" src="https://cdn.editorji.com/6540db44c36a8_web-story-5-.jpg" alt="">
      </div>
      <div class="w-[650px] flex justify-center items-center shadow-inner rounded-[10px]">
        <carousel :items-to-show="1" :autoplay="2000" :wrap-around="true">
          <slide v-for="item in imageList" :key="item.id">
            <img class="w-[650px] h-[370px]" :src="item.src" alt="image_alt">
          </slide>
          <template #addons>
            <navigation />
            <pagination />
          </template>
        </carousel>
      </div>
      <div class="w-[260px] h-[376px] flex flex-col justify-around shadow-inner rounded-[10px]  mb-[17px]">
        <div class="w-[260px] h-[115px]">
          <img
            src="https://cdn2.cellphones.com.vn/insecure/rs:fill:690:300/q:10/plain/https://dashboard.cellphones.com.vn/storage/m14.png"
            alt="">
        </div>
        <div class="w-[260px] h-[115px]">
          <img
            src="https://cdn2.cellphones.com.vn/insecure/rs:fill:690:300/q:10/plain/https://dashboard.cellphones.com.vn/storage/gen%209.jpg"
            alt="">
        </div>
        <div class="w-[260px] h-[115px]">
          <img
            src="https://cdn2.cellphones.com.vn/insecure/rs:fill:690:300/q:10/plain/https://dashboard.cellphones.com.vn/storage/%C6%B0u-dai-sinhvien-chung-right-banner.png"
            alt="">
        </div>
      </div>
    </div>
    <div class="w-[1200px] h-[75px] mt-[15px]">
      <img
        src="https://cdn2.cellphones.com.vn/1200x75,webp,q100/https://dashboard.cellphones.com.vn/storage/b2s-special-desktop-dday-p1.png"
        alt="">
    </div>
    <div class="w-[1200px] flex flex-row justify-between items-center mt-[10px]">
      <h2 class="text-[30px] font-[600]">Hàng mới về</h2>
      <div class="flex flex-row justify-between">
        <div v-for="(company, id) in listManufacturers" :key="id"
          class="text-[22px] bg-[#f3f4f6] rounded-[7px] mr-[10px] cursor-pointer" @click="getListIphones(1, company.id)">
          <span>{{ company.manufacturer }}</span>
        </div>
      </div>
    </div>
    <div class="w-[1200px] h-[422px] flex flex-col justify-around items-center">
      <h1 class="text-[30px] font-[600]">HOT SALE CUỐI TUẦN</h1>
      <div class="flex justify-center items-center">
        <carousel class="w-[1200px] h-[350px]" :items-to-show="4" :autoplay="2500" :wrap-around="true">
          <slide v-for="item in listIphones" :key="item.id">
            <Product :src="item.src" :alt="item.name" :name="item.name" :selling-price="item.sellingPrice.toLocaleString('vi-VN')" :original-price="item.originalPrice.toLocaleString('vi-VN')"
              :description="item.description" :id="item.id" />
          </slide>
          <template #addons>
            <navigation />
            <!-- <pagination /> -->
          </template>
        </carousel>
      </div>
    </div>
    <div class="w-[1200px] h-[422px] flex flex-col justify-around items-center">
      <h1 class="text-[30px] font-[600]">Điện thoại</h1>
      <div class="flex justify-center items-center">
        <carousel class="w-[1200px] h-[350px]" :items-to-show="4" :autoplay="1000" :wrap-around="true">
          <slide v-for="item in listIphones" :key="item.id">
            <Product :src="item.src" :alt="item.name" :name="item.name" :selling-price="item.sellingPrice.toLocaleString('vi-VN')" :original-price="item.originalPrice.toLocaleString('vi-VN')"
              :description="item.description" :id="item.id" />
          </slide>
          <template #addons>
            <navigation />
            <!-- <pagination /> -->
          </template>
        </carousel>
      </div>
    </div>
    <Footer />
  </div>
</template>