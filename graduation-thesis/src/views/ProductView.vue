<script lang="ts">
import { useProductStore } from '@/stores/product'
import { mapActions, mapState } from 'pinia';
import { defineComponent } from 'vue'

export default defineComponent({
    computed: {
        ...mapState(useProductStore, {
            listProducts: 'listProducts'
        })
    },
    methods: {
        ...mapActions(useProductStore, ['changeProduct', 'getProducts']),

    },
    data() {
        return {
            id: 1,
            name: '',
            description: '',
            qty: 0,
            price: 0,
            unitCount: ''
        }
    },
    mounted() {
        this.getProducts()
    }
})
</script>

<template>
    <div class="flex flex-col">
        <h1>Show full Products</h1>
        <div v-for="item in listProducts" class="flex flex-row justify-around">
        <div class="flex flex-col">
            <span>ID</span>
            <span>{{ item.id }}</span>
        </div>
        <div class="flex flex-col">
            <span>Tên</span>
            <span>{{ item.name }}</span>
        </div>
        <div class="flex flex-col">
            <span>Mô ta</span>
            <span>{{ item.description }}</span>
        </div>
        <div class="flex flex-col">
            <span>So luong ton kho</span>
            <span>{{ item.qty }}</span>
        </div>
        <div class="flex flex-col">
            <span>Gia</span>
            <span>{{ item.price }}</span>
        </div>
        <div class="flex flex-col">
            <span>Don vi tinh</span>
            <span>{{ item.unitCount }}</span>
        </div>
    </div>
    <div>
        <h1>Thay doi gia tri</h1>
    </div>
    <div class="flex flex-row justify-around">
        <h1>Change Product</h1>
        <div class="flex flex-col">
            <span>ID</span>
            <input type="text" v-model="id">
        </div>
        <div class="flex flex-col">
            <span>Tên</span>
            <input type="text" v-model="name">
        </div>
        <div class="flex flex-col">
            <span>Mô ta</span>
            <input type="text" v-model="description">
        </div>
        <div class="flex flex-col">
            <span>So luong ton kho</span>
            <input type="text" v-model="qty">
        </div>
        <div class="flex flex-col">
            <span>Gia</span>
            <input type="text" v-model="price">
        </div>
        <div class="flex flex-col">
            <span>Don vi tinh</span>
            <input type="text" v-model="unitCount">
        </div>
        <div class="cangiua2">
            <button @click="changeProduct(id, name, description, qty, price, unitCount)">Save</button>
        </div>
    </div>
    </div>
</template>