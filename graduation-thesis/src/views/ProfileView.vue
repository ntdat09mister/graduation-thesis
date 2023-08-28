<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import IconHome from '@/components/icons/IconHome.vue'
import { defineComponent } from 'vue'
import { useProfileStore } from '@/stores/profile'
import { mapActions, mapState } from 'pinia'
import IconGift from '@/components/icons/IconGift.vue'
export default defineComponent({
    components: {
        Header,
        Footer,
        IconHome,
        IconGift
    },
    computed: {
        ...mapState(useProfileStore, ['listMenuProfile'])
    }
})
</script>

<template>
    <div class="flex flex-col justify-center items-center">
        <Header />
        <div class="w-[1200px] h-[650px] flex flex-row justify-between items-center mt-[10px]">
            <div class="w-[253px] h-[650px] flex flex-col items-center border border-gray-300 rounded-lg">
                <div v-for="(component, id) in listMenuProfile" :key="id">
                    <div class="w-[233px] h-[37.6px] rounded-[10px] border border-red-600 bg-yellow-100 mt-[10px]">
                        <div class="w-[211px] h-[35px] flex flex-start items-center ml-[10px]">
                            <component :is="component.component" class="w-[25px] h-[25px]" />
                            <p class="ml-[10px]">{{ component.content }}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="w-[927px] h-[650px] flex flex-col">
                <div class="w-[927px] h-[306px] flex flex-row justify-between">
                    <div class="w-[450px] h-[306px] flex flex-col justify-center items-center border border-gray-300 rounded-lg">
                        <div class="w-[70px] h-[70px]">
                            <img class="w-[70px] h-[70px] border-solid border-gray-400 rounded-full m-auto mb-10"
                                src="https://i.imgur.com/N5ERanL.jpg"
                                alt="">
                        </div>
                        <div class="w-[428px] h-[200px] flex flex-col justify-around items-center">
                            <p class="text-gray-700 text-base font-normal leading-relaxed">Xin chào</p>
                            <p class="text-red-600 uppercase font-bold text-2xl">Trần Thị Lan Anh</p>
                            <div class="w-[428px] flex flex-row justify-around">
                                <div class="flex flex-col justify-center items-center">
                                    <p>Ngày tham gia</p>
                                    <IconHome class="w-[45px] h-[45px]" />
                                </div>
                                <div class="flex flex-col justify-center items-center">
                                    <p>Hạng thành viên</p>
                                    <IconHome class="w-[45px] h-[45px]" />
                                </div>
                                <div class="flex flex-col justify-center items-center">
                                    <p>Số tiền đã tiêu</p>
                                    <IconHome class="w-[45px] h-[45px]" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="w-[452px] h-[306px] flex justify-center items-center border border-gray-300 rounded-lg">
                        <p>Chương trình khuyến mại</p>
                    </div>
                </div>

                <div class="w-[927px] h-[300px] flex flex-row justify-center items-center border border-gray-300 rounded-lg">
                    <div class="w-[3000px] h-[300px] flex flex-col justify-center items-center">
                        <div class="w-[86px] h-[86px] flex justify-center items-center">
                            <IconGift class="w-[50px] h-[50px]"/>
                        </div>
                        <p class="text-red-600 uppercase font-bold text-[20px]">Ưu đãi của bạn</p>
                        <p class="text-gray-700 text-base font-normal leading-relaxed">0 ưu đãi</p>
                    </div>
                    <div class="w-[3000px] h-[300px] flex flex-col justify-center items-center">
                        <div class="w-[86px] h-[86px] flex justify-center items-center">
                            <IconGift class="w-[50px] h-[50px]"/>
                        </div>
                        <p class="text-red-600 uppercase font-bold text-[20px]">Đơn hàng của bạn</p>
                        <p class="text-gray-700 text-base font-normal leading-relaxed">0 đơn hàng</p>
                    </div>
                    <div class="w-[3000px] h-[300px] flex flex-col justify-center items-center">
                        <div class="w-[86px] h-[86px] flex justify-center items-center">
                            <IconGift class="w-[50px] h-[50px]"/>
                        </div>
                        <p class="text-red-600 uppercase font-bold text-[20px]">Hạng thành viên</p>
                        <p class="text-gray-700 text-base font-normal leading-relaxed">Bạc rách</p>
                    </div>
                </div>
            </div>
        </div>
        <Footer />
    </div>
</template>