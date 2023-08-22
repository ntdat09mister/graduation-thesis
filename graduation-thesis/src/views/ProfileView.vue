<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import IconHome from '@/components/icons/IconHome.vue'
import { defineComponent } from 'vue'
export default defineComponent({
    components: {
        Header,
        Footer,
        IconHome
    }
})
</script>
<template>
    <Header />
    <div class="w-[1200px] h-[930px] flex flex-row">
        <div class="w-[253px] h-[930px] flex flex-col items-center">
            <div class="w-[233px] h-[37.6px] rounded-[10px] border border-red-600 bg-yellow-100">
                <div class="w-[211px] h-[35px] flex flex-start items-center ml-[10px]">
                    <IconHome class="w-[25px] h-[25px]" />
                    <p class="ml-[10px]">Trang chủ</p>
                </div>
            </div>
        </div>
        <div class="w-[927px] h-[930px]">
            <div>
                <div class="w-[450px] h-[306px]">

                </div>
                <div class="w-[452px] h-[306px]">

                </div>
            </div>
            <div>
                <div class="w-[3000px] h-[300px]">

                </div>
                <div class="w-[3000px] h-[300px]">

                </div>
                <div class="w-[3000px] h-[300px]">

                </div>
            </div>
        </div>
    </div>
    <Footer />
</template>