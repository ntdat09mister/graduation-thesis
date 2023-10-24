import { defineStore } from 'pinia'
import axios from 'axios';
import router from '@/router'

export const authStore = defineStore('auth', () => {
    const getIsAuthenticatedFromLocalStorage = () => {
        const value = localStorage.getItem("authenticated")
        if (value && value === 'true') return true
        return false
    }

    return {
        authenticated: getIsAuthenticatedFromLocalStorage(),
        login(username: string, password: string) {
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
                    const { access_token } = response.data
                    if (access_token) {
                        localStorage.setItem("accessToken", access_token as string);
                        localStorage.setItem("authenticated", 'true');
                        router.push({ name: 'home' }).then(() => {
                            location.reload();
                        });
                    }
                    console.log(response)
                })
                .catch(function (response) {
                    console.log(response)
                })
        },
        async register(username: string, password: string, retypePassword: string, name: string, phone: string) {
            if (password !== retypePassword) {
                alert('Passwords do not match. Please re-enter your password.');
                return;
            }
            const apiUrl = 'http://localhost:8080/auth/register/'
            const userInput = {
                username: username,
                password: password,
                name: name,
                phone: phone
            }
            const headers = { 'Content-Type': 'application/json', };
            const response = await axios.post(apiUrl, userInput, { headers });
            console.log(response);
            alert('Create successfully new account with username' + username + '.You can login now!')
            router.push({ name: 'login' })
        },
        getIsAuthenticatedFromLocalStorage
    }
})
