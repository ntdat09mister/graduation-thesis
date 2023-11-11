import axios from 'axios'
import { ref } from 'vue'
import { defineStore } from 'pinia'
export const useAdminStore = defineStore('admin', () => {
    interface User {
        id: number,
        username: string,
        name: string,
        gender: string,
        address: string,
        phone: string,
        role: string,
        avatar: string,
        createdAt: string,
        modifiedAt: string
    }
    const user = ref<User | null>(null);
    async function getInforUser() {
        try {
            const token = localStorage.getItem("accessToken");
            if (!token) {
                console.error('Access token not found in localStorage');
                return;
            }
            const config = {
                headers: {
                    Authorization: `Bearer ${token}`
                },
            };
            const response = await axios.get(`http://localhost:8080/user/info`, config);
            const responseData = response.data;
            if (responseData && responseData.data) {
                const data = responseData.data;
                if (data) { user.value = data; console.log(user.value); } else {
                    console.error('Invalid data received from the API:', data);
                }
            } else {
                console.error('No data received from the API');
            }
        } catch (error) {
            console.error('Error fetching data:', error);
        }
    }
    listProducts: [
        {   url: 'https://www.shutterstock.com/image-photo/varna-bulgaria-november-03-2013-260nw-272580014.jpg',
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
            url:'https://thumbs.dreamstime.com/b/laptop-computer-displaying-logo-dell-poznan-pol-jan-american-multinational-technology-company-develops-sells-repairs-172271225.jpg',
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
            url:'https://5.imimg.com/data5/SELLER/Default/2021/10/EA/PI/BG/110323540/mac-pro-13-book-250x250.jpg',
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
            url:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQhJCcII26FkX6H7SC_EiZycyLp4W2hdEdHfoGD9GlJMmlQBDVBnMmGX2J_BzmKnSKw8M&usqp=CAU',
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
            url:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5Slpsmuk18E4k1Wkp81d1uxj1BrT0PVMLpOTL_gmZ6A&s',
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
            url:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3hLZaTn2MnY2jAJUL1Ek-zQZl3IQG0lzEyNA0PZTBZQ1CbvC7LDQ15Ev1csCAWFBVmQo&usqp=CAU',
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
            url:'https://www.01net.com/app/uploads/2008/10/apple-macbook-pro-15-pouces-2.4-ghz-modele-octobre-2008-1.jpg',
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
    return {
        getInforUser,
        user
    }
})