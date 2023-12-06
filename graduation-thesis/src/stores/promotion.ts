import axios from 'axios'
import { ref } from 'vue'
import { defineStore } from 'pinia'
export const usePromotionStore = defineStore('promotion', () => {
    interface Promotion {
        id: number
        percentValue: number
        namePromotion: string
        descriptionPromotion: string
        startDayPromotion: string
        endDayPromotion: string
    }
    const listPromotions = ref<Promotion[]>([])
    async function getListPromotions() {
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
            const response = await axios.get(`http://localhost:8080/promotion/`, config);
            const responseData = response.data;
            if (responseData && responseData.data) {
                const data = responseData.data;
                if (data && Array.isArray(data)) {
                    listPromotions.value = data;
                    console.log(listPromotions);
                } else {
                    console.error('Invalid data received from the API:', data);
                }
            } else {
                console.error('No data received from the API');
            }
        } catch (error) {
            console.error('Error fetching data:', error);
        }
    }
    async function updatePromotion(id: number, namePromotion: string, percentValue: number, descriptionPromotion: string, startDayPromotion: string, endDayPromotion: string) {
        try {
            const token = localStorage.getItem("accessToken");
            if (!token) {
                console.error('Access token not found in localStorage');
                return;
            }
            const apiUrl = 'http://localhost:8080/promotion/';
            const requestData = {
                id: id,
                namePromotion: namePromotion,
                percentValue: percentValue,
                descriptionPromotion: descriptionPromotion,
                startDayPromotion: startDayPromotion,
                endDayPromotion: endDayPromotion,
            }
            const headers = { Authorization: `Bearer ${token}` };
            const response = await axios.put(apiUrl, requestData, { headers });
            console.log(response)
            const scrollPosition = window.scrollY;
            location.reload();
            window.scrollTo(0, scrollPosition);
        } catch (error) {
            console.error('Error fetching data:', error);
        }
    }
    async function createPromotion(id: number, namePromotion: string, percentValue: number, descriptionPromotion: string, startDayPromotion: string, endDayPromotion: string) {
        try {
            const token = localStorage.getItem("accessToken");
            if (!token) {
                console.error('Access token not found in localStorage');
                return;
            }
            const apiUrl = 'http://localhost:8080/promotion/';
            const requestData = {
                id: id,
                namePromotion: namePromotion,
                percentValue: percentValue,
                descriptionPromotion: descriptionPromotion,
                startDayPromotion: startDayPromotion,
                endDayPromotion: endDayPromotion,
            }
            const headers = { Authorization: `Bearer ${token}` };
            const response = await axios.post(apiUrl, requestData, { headers });
            console.log(response)
            const scrollPosition = window.scrollY;
            location.reload();
            window.scrollTo(0, scrollPosition);
        } catch (error) {
            console.error('Error fetching data:', error);
        }
    }
    async function deletePromotion(promotionId:number) {
        try {
            const token = localStorage.getItem("accessToken");
            if (!token) {
              console.error('Access token not found in localStorage');
              return;
            }
            const apiUrl = 'http://localhost:8080/promotionId';
            const params = { promotionId: promotionId };
            const headers = { Authorization: `Bearer ${token}` };
            const response = await axios.delete(apiUrl, { headers, params });
          } catch (error) {
            console.error('Error fetching data:', error);
          }
    }
    return {
        getListPromotions,
        listPromotions,
        updatePromotion,
        createPromotion,
        deletePromotion
    }
})