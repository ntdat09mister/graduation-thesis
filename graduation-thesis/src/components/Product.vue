<script lang="ts">
import router from '@/router';
import { defineComponent } from 'vue';
export default defineComponent({
    props: {
        src: { type: String, require: true },
        description: { type: String, require: true },
        name: { type: String, require: true },
        price: { type: Number, require: true },
    },
    methods: {
        handleClick(id: number) {
            router.push({ name: 'detail', params: { id: Number(id) } })
        }
    }
})
</script>

<template>
    <div class="w-[228px] h-[350px] flex flex-col justify-around">
        <div class="flex justify-center items-center">
            <img class="w-[160px] h-[160px]" :src="src" :alt="name">
        </div>
        <h3 class="text-[14px] font-[600]">{{ name }}</h3>
        <div class="flex justify-center items">
            <span class="text-[18px] font-[700] text-red-600">{{ price }}đ</span>
        </div>
        <div class="w-[208px] h-[48px] flex justify-center items-center text-[12px] bg-[#f3f4f6] rounded-[7px]">
            <span>{{ description }}</span>
        </div>
    </div>
</template>