import { defineStore } from 'pinia'
import axios from 'axios';
import router from '@/router'

export const uathStore = defineStore('uath', () => {
    function login(username: string, password: string) {
        const formData = new FormData();
        formData.append('username', username);
        formData.append('password', password);
        formData.append('grant_type', 'password');
        axios({
            method: 'post',
            url: 'http://localhost:8080/oauth/token',
            data: formData,
            headers: {
                'Content-Type': 'multipart/form-data',
                "Authorization": "Basic Y2xpZW50OmNsaWVudEAyMDIy"
            },
        })
            .then(function (response) {
                const { access_token } = response.data;
                if (access_token) {
                    localStorage.setItem("ACCESS_TOKEN", access_token);
                    localStorage.setItem("AUTHENTICATED", 'true');
                    router.push({ name: 'home' });
                }
                console.log(response)
            })
            .catch(function (response) {
                console.log(response)
            })
    }
    return {
        login
    }
})
