<script lang="ts">
import { Carousel, Slide, Pagination, Navigation } from 'vue3-carousel'
import { defineComponent, onMounted, ref } from 'vue';
import { useHomeStore } from '../stores/home'
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
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
    ...mapState(useHomeStore, {
        contentComponents: 'contentComponents',
        imageList: 'imageList',
        companyList: 'companyList',
        listIphones:'listIphones'
    })
  },
  setup() {
    const homeStore = useHomeStore();
    const listIphones = ref([]);

    onMounted(() => {
      homeStore.getListIphones().then(() => {
        listIphones.value = homeStore.listIphones;
        logScreen();
      });
    });
    function logScreen() {
      console.log("123123123");
    }
    return {
      listIphones,
    }
  }
})
</script>

<template>
    <div class="flex flex-col justify-center items-center">
      <Header />
      <div class="w-[1200px] h-[385px] flex flex-row justify-between items-center mt-[5px]">
        <div class="w-[200px] h-[376px] flex flex-col justify-around shadow-inner rounded-[15px]">
          <div v-for="(component, id) in contentComponents" :key="id">
            <div class="w-[181px] h-[29px] flex flex-row justify-between items-center">
              <component :is="component.component" width="25px" />
              <span>{{ component.content }}</span>
            </div>
          </div>
        </div>
        <div class="flex justify-center items-center shadow-inner rounded-[10px]">
          <carousel :items-to-show="1" :autoplay="1500" :wrap-around="true">
            <slide v-for="item in imageList" :key="item.id">
              <img class="w-[650px] h-[370px]" :src="item.src" alt="image_alt">
            </slide>
            <!-- <template #addons>
              <navigation />
              <pagination />
            </template> -->
          </carousel>
        </div>
        <div class="w-[258px] h-[376px] flex flex-col justify-around shadow-inner rounded-[10px]">
          <div class="w-[260px] h-[115px]">
            <img
              src="https://cdn2.cellphones.com.vn/690x300,webp,q10/https://dashboard.cellphones.com.vn/storage/right-watch6-009-new-th8.png"
              alt="">
          </div>
          <div class="w-[260px] h-[115px]">
            <img
              src="https://cdn2.cellphones.com.vn/690x300,webp,q10/https://dashboard.cellphones.com.vn/storage/ipadth7-new.png"
              alt="">
          </div>
          <div class="w-[260px] h-[115px]">
            <img
              src="https://cdn2.cellphones.com.vn/690x300,webp,q10/https://dashboard.cellphones.com.vn/storage/asus tuf.jpg"
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
          <div v-for="(company, id) in companyList" :key="id" class="text-[22px] bg-[#f3f4f6] rounded-[7px] mr-[10px]">
            <span>{{ company.name }}</span>
          </div>
        </div>
      </div>
      <div class="w-[1200px] h-[422px] flex flex-col justify-around items-center">
        <h1 class="text-[30px] font-[600]">HOT SALE CUỐI TUẦN</h1>
        <div class="flex justify-center items-center">
          <carousel class="w-[1200px] h-[350px]" :items-to-show="4" :autoplay="1000" :wrap-around="true">
            <slide v-for="item in listIphones" :key="item.id">
              <div class="w-[228px] h-[350px] flex flex-col justify-around">
                <div class="flex justify-center items-center">
                  <img class="w-[160px] h-[160px]" :src="item.src" :alt="item.id">
                </div>
                <h3 class="text-[14px] font-[600]">{{ item.name }}</h3>
  
                <div class="flex justify-center items">
                  <span class="text-[18px] font-[700] text-red-600">{{ item.price }}đ</span>
                </div>
                <div class="w-[208px] h-[48px] flex justify-center items-center text-[12px] bg-[#f3f4f6] rounded-[7px]">
                  <span>{{ item.description }}</span>
                </div>
              </div>
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
              <div class="w-[228px] h-[350px] flex flex-col justify-around">
                <div class="flex justify-center items-center">
                  <img class="w-[160px] h-[160px]" :src="item.src" :alt="item.id">
                </div>
                <h3 class="text-[14px] font-[600]">{{ item.name }}</h3>
  
                <div class="flex justify-center items">
                  <span class="text-[18px] font-[700] text-red-600">{{ item.price }}đ</span>
                </div>
                <div class="w-[208px] h-[48px] flex justify-center items-center text-[12px] bg-[#f3f4f6] rounded-[7px]">
                  <span>{{ item.description }}</span>
                </div>
              </div>
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