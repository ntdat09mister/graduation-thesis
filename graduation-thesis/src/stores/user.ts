import axios from 'axios'
import { defineStore } from 'pinia'
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
export const useUserStore = defineStore('user', () => {
    let userInfo: User = {
        id: 1,
        username: "username",
        name: "string",
        gender: "string",
        address: "string",
        phone: "string",
        role: "string",
        avatar: "string",
        createdAt: "string",
        modifiedAt: "string"
    };
    async function getInforUser() {
        try {
            const token = localStorage.getItem("accessToken");
            if (!token) {
                console.error('Access token not found in localStorage');
                return;
            }
            const config = {
                headers: {
                    Authorization: `Bearer ${token}`,
                },
            };
            const response = await axios.get(`http://localhost:8080/user/info`, config);
            const responseData = response.data;
            const user: User = {
                id: responseData.data.id,
                username: responseData.data.username,
                name: responseData.data.name,
                gender: responseData.data.gender,
                address: responseData.data.address,
                phone: responseData.data.phone,
                role: responseData.data.role,
                avatar: responseData.data.avatar,
                createdAt: responseData.data.createdAt,
                modifiedAt: responseData.data.modifiedAt
            };
            userInfo = user;
            console.log(userInfo)
        } catch (error) {
            console.error('Error fetching data:', error);
        }
    }
    return {
        getInforUser,
        userInfo
    }
})