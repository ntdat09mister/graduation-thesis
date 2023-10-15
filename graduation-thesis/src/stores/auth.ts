import { defineStore } from 'pinia'
import { ACCESS_TOKEN, AUTHENTICATED, CURRENT_USER } from '@/constants'
import { login, getCurrentUser } from '@/apis/auth'
import type { LoginRequest } from '@/types/request'
import type { CurrentUser } from '@/types/state'
import { PROVIDER_TYPE } from '@/constants'
import axios from 'axios';
import router from '@/router'

export const uathStore = defineStore('uath', () => {
    function login(loginRequest: LoginRequest) {
        const formData = new FormData();
        formData.append('username', loginRequest.username);
        formData.append('password', loginRequest.password);
        formData.append('grant_type', 'password');

        axios.post("http://localhost:8080/oauth/token", formData, {
            headers: {
                "Authorization": "Basic Y2xpZW50OmNsaWVudEAyMDIy",
                "Content-Type": "multipart/form-data"
            }
        })
            .then(response => {
                const { access_token } = response.data;
                if (access_token) {
                    localStorage.setItem(ACCESS_TOKEN, access_token);
                    localStorage.setItem(AUTHENTICATED, 'true');
                    router.push({ name: 'home' });
                }
            })
            .catch(error => console.error(error.response));
    }

    function getToken(loginRequest: LoginRequest) {
        const url = 'http://localhost:8080/oauth/token';
        const clientId = 'Y2xpZW50OmNsaWVudEAyMDIy';
        const username = loginRequest.username;
        const password = loginRequest.password;
        const grantType = 'password';

        const headers = new Headers();
        headers.append('Authorization', 'Basic ' + btoa(clientId));

        const formData = new FormData();
        formData.append('username', username);
        formData.append('password', password);
        formData.append('grant_type', grantType);

        const requestOptions = {
            method: 'POST',
            headers: headers,
            body: formData,
            mode: 'cors' as RequestMode, // Chỉnh sửa ở đây
            credentials: 'include' as RequestCredentials
        };

        return fetch(url, requestOptions)
            .then(response => response.json())
            .then(data => {
                // Xử lý dữ liệu phản hồi từ API
                console.log(data);
                localStorage.setItem(ACCESS_TOKEN, data.access_token);
                localStorage.setItem(AUTHENTICATED, 'true');
                return data;
            })
            .catch(error => {
                // Xử lý lỗi trong quá trình gửi yêu cầu
                console.error('Error:', error);
            });
    }


    return {
        login,
        getToken
    }
})
