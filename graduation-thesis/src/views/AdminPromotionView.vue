<script lang="ts">
import Header from '@/components/Header.vue';
import Footer from '@/components/Footer.vue';
import { usePromotionStore } from '@/stores/promotion';
import { defineComponent } from 'vue';
import { mapActions, mapState } from 'pinia';
import IconShowNaviDB from '@/components/icons/IconShowNaviDB.vue';
export default defineComponent({
    components: {
        Header,
        Footer,
        IconShowNaviDB
    },
    data() {
        return {
            id: 1,
            namePromotion: '',
            percentValue: 0,
            descriptionPromotion: '',
            startDayPromotion: '',
            endDayPromotion: '',
            showModify: false,
            showCreate: false,
            showButtonAdd: true
        }
    },
    computed: {
        ...mapState(usePromotionStore, {
            listPromotions: 'listPromotions'
        })
    },
    methods: {
        ...mapActions(usePromotionStore, ['getListPromotions', 'updatePromotion', 'createPromotion']),
        modifyPromotion(id: number, namePromotion: string, percentValue: number, descriptionPromotion: string, startDayPromotion: string, endDayPromotion: string) {
            this.id = id
            this.namePromotion = namePromotion
            this.percentValue = percentValue
            this.descriptionPromotion = descriptionPromotion
            this.startDayPromotion = startDayPromotion
            this.endDayPromotion = endDayPromotion
            this.showModify = true
            this.showCreate = false
        },
        addNewPromotion() {
            this.showCreate = true
            this.showButtonAdd = false
            this.showModify = false
        },
        cancel() {
            this.showModify = false
            this.showCreate = false
        }
    },
    mounted() {
        this.getListPromotions()
    }
})
</script>
<template>
    <div class="flex flex-col justify-center items-center">
        <Header />
        <div class="w-[1438px] h-[1020] bg-[#F2F2F2] flex flex-col justify-center items-center">
            <div class="w-[1200px] h-[50px] flex flex-row items-center rounded-[12px]">
                <div class="flex flex-row items-center">
                    <div
                        class="w-[36px] h-[36px] flex justify-center items-center rounded-[6px] ml-[28px] bg-[#5E81F41A] cursor-pointer">
                        <IconShowNaviDB />
                    </div>
                    <span class=" ml-[20px]"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 27px;color: #1C1D21;">Quản
                        lý khuyến mại</span>
                </div>
            </div>
            <div class="w-[1200px] h-[48px] flex flex-row justify-between items-center">
                <div class="w-[160px] h-[80px] flex justify-center items-center">
                    <span class="w-[160px] h-[80px] flex justify-center items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 18px;color: #1B51E5;">Mã
                        khuyến mại</span>
                </div>
                <div class="w-[160px] h-[80px] flex items-center">
                    <span class="w-[160px] h-[80px] flex items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 18px;color: #1B51E5;">Tên
                        khuyến mại</span>
                </div>
                <div class="w-[160px] h-[80px] flex justify-center items-center">
                    <span class="w-[160px] h-[80px] flex justify-center items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 18px;color: #1B51E5;">Giá
                        trị</span>
                </div>
                <div class="w-[160px] h-[80px] flex items-center">
                    <span class="w-[160px] h-[80px] flex items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 18px;color: #1B51E5;">Mô
                        tả</span>
                </div>
                <div class="w-[160px] h-[80px] flex justify-center items-center">
                    <span class="w-[160px] h-[80px] flex justify-center items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 18px;color: #1B51E5;">Thời
                        gian bắt đầu</span>
                </div>
                <div class="w-[160px] h-[80px] flex justify-center items-center">
                    <span class="w-[160px] h-[80px] flex justify-center items-center"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 18px;color: #1B51E5;">Thời
                        gian kết thúc</span>
                </div>
                <div class="w-[50px] h-[80px] flex justify-center items-center">
                </div>
            </div>
            <div v-if="showModify" class="w-[1200px] flex flex-col justify-between items-center">
                <div class="w-[1200px] h-[80px] flex flex-row justify-between items-center">
                    <div class="w-[160px] h-[80px] flex items-center">
                        <span class="w-[160px] h-[80px] flex justify-center items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ id }}
                        </span>
                    </div>
                    <div class="w-[160px] h-[80px] flex items-center">
                        <input v-model="namePromotion"
                            class="w-[160px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-300"
                            type="text" :placeholder="`${namePromotion}`">
                    </div>
                    <div class="w-[160px] h-[80px] flex items-center">
                        <input v-model="percentValue"
                            class="w-[160px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-300"
                            type="text" :placeholder="`${percentValue}`">
                    </div>
                    <div class="w-[160px] h-[80px] flex items-center">
                        <input v-model="descriptionPromotion"
                            class="w-[160px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-300"
                            type="text" :placeholder="`${descriptionPromotion}`">
                    </div>
                    <div class="w-[160px] h-[80px] flex items-center">
                        <input v-model="startDayPromotion"
                            class="w-[160px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-300"
                            type="text" :placeholder="`${startDayPromotion}`">
                    </div>
                    <div class="w-[160px] h-[80px] flex items-center">
                        <input v-model="endDayPromotion"
                            class="w-[160px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-300"
                            type="text" :placeholder="`${endDayPromotion}`">
                    </div>
                    <div class="w-[50px] h-[38px] flex justify-center items-center ">
                        <button
                            @click="updatePromotion(id, namePromotion, percentValue, descriptionPromotion, startDayPromotion, endDayPromotion)"
                            class="w-[50px] h-[30px] text-[12px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none">Save</button>
                    </div>
                    <div class="w-[50px] h-[30px] flex justify-center items-center ">
                        <button @click="cancel()"
                            class="w-[50px] h-[30px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Cancel</button>
                    </div>
                </div>
            </div>
            <div class="w-[1200px] flex flex-col justify-between items-center">
                <div v-for="(item, index ) in listPromotions" :key="index"
                    class="w-[1200px] h-[80px] flex flex-row justify-between items-center">
                    <div class="w-[160px] h-[80px] flex items-center">
                        <span class="w-[160px] h-[80px] flex justify-center items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.id }}
                        </span>
                    </div>
                    <div class="w-[160px] h-[80px] flex items-center">
                        <span class="w-[160px] h-[80px] flex items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.namePromotion }}
                        </span>
                    </div>
                    <div class="w-[160px] h-[80px] flex items-center">
                        <span class="w-[160px] h-[80px] flex justify-center items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.percentValue }}
                        </span>
                    </div>
                    <div class="w-[160px] h-[80px] flex items-center">
                        <span class="w-[160px] h-[80px] flex items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.descriptionPromotion }}
                        </span>
                    </div>
                    <div class="w-[160px] h-[80px] flex items-center">
                        <span class="w-[160px] h-[80px] flex justify-center items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.startDayPromotion }}
                        </span>
                    </div>
                    <div class="w-[160px] h-[80px] flex items-center">
                        <span class="w-[160px] h-[80px] flex justify-center items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.endDayPromotion }}
                        </span>
                    </div>
                    <div class="w-[50px] h-[38px] flex justify-center items-center ">
                        <button
                            @click="modifyPromotion(item.id, item.namePromotion, item.percentValue, item.descriptionPromotion, item.startDayPromotion, item.endDayPromotion)"
                            class="w-[50px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Modifiy</button>
                    </div>
                </div>
            </div>
            <div v-if="showButtonAdd" class="w-[1200px] flex justify-between items-center ml-[100px]">
                <div class="w-[100px] h-[38px] flex justify-center items-center ">
                    <button @click="addNewPromotion()"
                        class="w-[100px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Add new
                        Promotion</button>
                </div>
            </div>
            <div v-if="showCreate" class="w-[1200px] flex flex-col justify-between items-center">
                <span>___________________________Tạo mới một khuyến mại___________________________</span>
                <div class="w-[1200px] h-[80px] flex flex-row justify-between items-center">
                    <div class="w-[160px] h-[80px] flex items-center">
                        <span class="w-[160px] h-[80px] flex justify-center items-center"
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ listPromotions.length + 1 }}
                        </span>
                    </div>
                    <div class="w-[160px] h-[80px] flex items-center">
                        <input v-model="namePromotion"
                            class="w-[160px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-300"
                            type="text" :placeholder="`${namePromotion}`">
                    </div>
                    <div class="w-[160px] h-[80px] flex items-center">
                        <input v-model="percentValue"
                            class="w-[160px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-300"
                            type="text" :placeholder="`${percentValue}`">
                    </div>
                    <div class="w-[160px] h-[80px] flex items-center">
                        <input v-model="descriptionPromotion"
                            class="w-[160px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-300"
                            type="text" :placeholder="`${descriptionPromotion}`">
                    </div>
                    <div class="w-[160px] h-[80px] flex items-center">
                        <input v-model="startDayPromotion"
                            class="w-[160px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-300"
                            type="text" :placeholder="`${startDayPromotion}`">
                    </div>
                    <div class="w-[160px] h-[80px] flex items-center">
                        <input v-model="endDayPromotion"
                            class="w-[160px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-300"
                            type="text" :placeholder="`${endDayPromotion}`">
                    </div>
                    <div class="w-[50px] h-[38px] flex justify-center items-center ">
                        <button
                            @click="createPromotion(id, namePromotion, percentValue, descriptionPromotion, startDayPromotion, endDayPromotion)"
                            class="w-[50px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Save</button>
                    </div>
                    <div class="w-[50px] h-[38px] flex justify-center items-center ">
                        <button @click="cancel()"
                            class="w-[50px] h-[38px] text-[12px] rounded-xl focus:outline-none border border-gray-500">Cancel</button>
                    </div>
                </div>
            </div>
            <Footer />
        </div>
    </div>
</template>