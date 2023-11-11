<script lang="ts">
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import IconShowNaviDB from '@/components/icons/IconShowNaviDB.vue';
import { defineComponent } from 'vue'
import { mapActions, mapState } from 'pinia';
import { useOrderStore } from '@/stores/order';
export default defineComponent({
    components: {
        Header,
        Footer,
        IconShowNaviDB
    },
    computed: {
        ...mapState(useOrderStore, {
            listOrders: 'listOrders'
        })
    },
    methods: {
        ...mapActions(useOrderStore, ['getAllOrders'])
    },
    data() {
        return {
            listUnderDashBoard: [
                { name: 'New Sales', value: '1.345', icon: '<IconShowNaviDB />' },
                { name: 'New leads', value: '2.890' },
                { name: 'Income per lead', value: '$1.870' },
                { name: 'Conversion rate', value: '5.10%' }
            ],
            listStatistical: [
                { name: 'Day' },
                { name: 'Week' },
                { name: 'Month' },
            ],
            pages: [
                { number: 1 }, { number: 2 }, { number: 3 }, { number: 4 }, { number: 5 }
            ],
            listProducts: [
                {
                    url: 'https://www.shutterstock.com/image-photo/varna-bulgaria-november-03-2013-260nw-272580014.jpg',
                    nameProd: 'Macbook Pro',
                    id: 'ID 10-3290-08',
                    nameCus: 'Rodney Cannon',
                    mail: 'rodney.cannon@gmail.com',
                    nationality: 'United Kingdom',
                    address: '193 Cole Plains Suite 649, 891203',
                    status: 'Shipped',
                    price: '$100.00',
                    shipCos: '$18.00',
                    totalCos: '$118.00'
                },
                {
                    url: 'https://thumbs.dreamstime.com/b/laptop-computer-displaying-logo-dell-poznan-pol-jan-american-multinational-technology-company-develops-sells-repairs-172271225.jpg',
                    nameProd: 'Dell Laptop',
                    id: 'ID 10-3456-18',
                    nameCus: 'Mike Franklin',
                    mail: 'mike.franklin@gmail.com',
                    nationality: 'United States',
                    address: '619 Jeffrey Freeway Apt. 273',
                    status: 'Processing',
                    price: '$180.00',
                    shipCos: '$28.00',
                    totalCos: '$208.00'
                },
                {
                    url: 'https://5.imimg.com/data5/SELLER/Default/2021/10/EA/PI/BG/110323540/mac-pro-13-book-250x250.jpg',
                    nameProd: 'Macbook Air',
                    id: 'ID 10-3786-23',
                    nameCus: 'Louis Franklin',
                    mail: 'louis.franklin@gmail.com',
                    nationality: 'Germany',
                    address: '200 Davis Estates Suite 621',
                    status: 'Processing',
                    price: '$100.00',
                    shipCos: '$18.00',
                    totalCos: '$118.00'
                },
                {
                    url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQhJCcII26FkX6H7SC_EiZycyLp4W2hdEdHfoGD9GlJMmlQBDVBnMmGX2J_BzmKnSKw8M&usqp=CAU',
                    nameProd: 'Macbook',
                    id: 'ID 10-4570-15',
                    nameCus: 'Dominic Love',
                    mail: 'dominic.love@gmail.com',
                    nationality: 'Spain',
                    address: '742 Rau Summit Suite 407',
                    status: 'Shipped',
                    price: '$560.00',
                    shipCos: '$18.00',
                    totalCos: '$578.00'
                },
                {
                    url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5Slpsmuk18E4k1Wkp81d1uxj1BrT0PVMLpOTL_gmZ6A&s',
                    nameProd: 'LG Laptop',
                    id: 'ID 10-5468-19',
                    nameCus: 'ID 10-5468-19',
                    mail: 'adrian.drake@gmail.com',
                    nationality: 'United Kingdom',
                    address: '166 Corkery Vista Apt. 293',
                    status: 'Cancelled',
                    price: '$340.00',
                    shipCos: '$34.00',
                    totalCos: '$374.00'
                },
                {
                    url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3hLZaTn2MnY2jAJUL1Ek-zQZl3IQG0lzEyNA0PZTBZQ1CbvC7LDQ15Ev1csCAWFBVmQo&usqp=CAU',
                    nameProd: 'Macbook  Pro',
                    id: 'ID 10-4890-14',
                    nameCus: 'Walter Quinn',
                    mail: 'walter.quinn@gmail.com',
                    nationality: 'United States',
                    address: '7613 Wilfredo Rapids Apt. 715',
                    status: 'Shipped',
                    price: '$180.00',
                    shipCos: '$40.00',
                    totalCos: '$220.00'
                },
                {
                    url: 'https://www.01net.com/app/uploads/2008/10/apple-macbook-pro-15-pouces-2.4-ghz-modele-octobre-2008-1.jpg',
                    nameProd: 'Macbook  Pro',
                    id: 'ID 10-3290-08',
                    nameCus: 'Victor Roberson',
                    mail: 'victor.roberson@gmail.com',
                    nationality: 'Germany',
                    address: '357 Hoeger Bypass Apt. 593',
                    status: 'Shipped',
                    price: '$680.00',
                    shipCos: '$18.00',
                    totalCos: '$698.00'
                }
            ]
        }
    },
    mounted() {
        this.getAllOrders()
    }
})
</script>
<template>
    <div class="flex flex-col justify-center items-center">
        <Header />
        <div class="w-[1438px] h-[1020] bg-[#F2F2F2]">
            <div class="w-[1438px] h-[84px] flex flex-row justify-between items-center">
                <div class="flex flex-row">
                    <div
                        class="w-[36px] h-[36px] flex justify-center items-center rounded-[6px] ml-[28px] bg-[#5E81F41A] cursor-pointer">
                        <IconShowNaviDB />
                    </div>
                    <span class="ml-[20px]"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 20px;line-height: 32px;color: #1C1D21;">
                        Admin
                    </span>
                </div>
            </div>
            <div class="w-[1438px] h-[98px] flex flex-row justify-around">
                <div v-for="item in listUnderDashBoard"
                    class="w-[324px] h-[98px] flex flex-row justify-between rounded-[10px] bg-[#FFFFFF]">
                    <div class="flex flex-col justify-center ml-[18px]">
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 14px;line-height: 21px;color: #8181A5;">{{
                                item.name }}</span>
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 20px;line-height: 32px;color: #1C1D21;">{{
                                item.value }}</span>
                    </div>
                    <div class="flex items-center mr-[24px]">
                        <IconNewSales />
                    </div>
                </div>
            </div>
            <div class="w-[1152px] h-[86px] flex flex-row rounded-[12px]">
                <div class="w-[1381px] h-[66px] flex flex-row justify-between items-center ml-[24px]">
                    <span
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 18px;line-height: 27px;color: #1C1D21;">Latest
                        sales</span>
                    <div class="flex flex-row">
                        <div class="w-[62px] h-[40px]" v-for="item in listStatistical">
                            <span
                                style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 17px;text-align: center;color: #1C1D21;">
                                {{ item.name }}
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="w-[1381px] h-[48px] flex flex-row justify-between items-center">
                <span class="ml-[26px]"
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #8181A5;">Product</span>
                <span class="ml-[189px]"
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #8181A5;">Customer</span>
                <span class="ml-[176px]"
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #8181A5;">Delivery</span>
                <span class="ml-[372px]"
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #8181A5;">Subtotal</span>
                <span class="ml-[40px]"
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #8181A5;">Shipping</span>
                <span class="ml-[61px]"
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 12px;line-height: 18px;color: #8181A5;">Total</span>
            </div>
            <div class="w-[1381px] h-[649px]">
                <div v-for="item in listProducts" class="w-[1381px] h-[80px] flex flex-row justify-between items-center">
                    <img class="w-[52px] h-[52px] ml-[25px]" :src="item.url" alt="product-img">
                    <div class="flex flex-col ml-[16px]">
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.nameProd }}
                        </span>
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.id }}
                        </span>
                    </div>
                    <div class="flex flex-col ml-[72px]">
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.nameCus }}
                        </span>
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.mail }}
                        </span>
                    </div>
                    <div class="flex flex-col ml-[73px]">
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.nationality }}
                        </span>
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 400;font-size: 14px;line-height: 21px;color: #1C1D21;">
                            {{ item.address }}
                        </span>
                    </div>
                    <div class="w-[98px] h-[36px] flex justify-center items-center ml-[53px]">
                        <span
                            style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 17px;text-align: center;color: #1B51E5;">
                            {{ item.status }}
                        </span>
                    </div>
                    <span class="ml-[50px]"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                        {{ item.price }}
                    </span>
                    <span class="mr-[39px]"
                        style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                        {{ item.shipCos }}
                    </span>
                <span class="mr-[23px]"
                    style="font-family: 'Lato';font-style: normal;font-weight: 700;font-size: 14px;line-height: 21px;color: #1C1D21;">
                    {{ item.totalCos }}
                </span>
            </div>
            <div class="flex flex-row justify-between items-center">
                <IconPrevPage class="cursor-pointer" />
                <div class="w-[212px] flex flex-row justify-between">
                    <div v-for="item in pages" class="flex flex-row">
                        <div
                            class="w-[50px] h-[50px] flex justify-center items-center hover:border-b-[2px] border-[#5E81F4]">
                            <div
                                class="w-[36px] h-[36px] flex justify-center items-center cursor-pointer bg-[#5E81F41A] hover:bg-[#3648831a]">
                                <span>
                                    {{ item.number }}
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <IconNextPage class="cursor-pointer" />
            </div>
        </div>
    </div>
    <Footer />
</div></template>