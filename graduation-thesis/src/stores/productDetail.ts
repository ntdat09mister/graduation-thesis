import { defineStore } from "pinia";
export const useProductDetailStore = defineStore('productDetail', () => {
    let imageList = [
        { id: 1, src: 'https://hanoicomputercdn.com/media/banner/10_Jul294bd0f9ecb07b3e6c234e02459a1063.jpg' },
        { id: 2, src: 'https://hanoicomputercdn.com/media/banner/25_Jul881704812919b35faec78a46dee5a555.png' },
        { id: 3, src: 'https://hanoicomputercdn.com/media/banner/28_Julbf16a308bf06183c64581b5a763da365.jpg' },
        { id: 4, src: 'https://hanoicomputercdn.com/media/banner/31_Julf855258be0815e2eb82e233d3f2954d0.jpg' }
    ]
    return {
        imageList
    }
})