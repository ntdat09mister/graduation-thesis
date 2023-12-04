import { defineStore } from 'pinia'
import axios from 'axios';
import router from '@/router'
import { toast } from 'vue3-toastify';

export const authStore = defineStore('auth', () => {
    const getIsAuthenticatedFromLocalStorage = () => {
        const value = localStorage.getItem("authenticated")
        if (value && value === 'true') return true
        return false
    }

    return {
        authenticated: getIsAuthenticatedFromLocalStorage(),
        login(username: string, password: string) {
            if (!username) {
                toast.error("Vui lòng điền tên tài khoản!");
                return;
            }

            if (!password) {
                toast.error("Vui lòng điền mật khẩu!");
                return;
            }
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
                        toast.success("Đăng nhập thành công")
                        setTimeout(() => {
                            router.push({ name: 'home' }).then(() => {
                                location.reload();
                            });
                        }, 1000);
                    }
                    console.log(response)
                })
                .catch(function (response) {
                    toast.error("Sai tên đăng nhập hoặc mật khẩu, vui lòng nhập lại")
                    setTimeout(() => {

                    }, 1000);
                    console.log(response)
                })
        },
        async register(username: string, password: string, retypePassword: string, name: string, phone: string, seletedGender: string) {
            if (!username) {
                toast.error("Vui lòng điền tên tài khoản!");
                return;
            }

            if (!password) {
                toast.error("Vui lòng điền mật khẩu!");
                return;
            }

            if (password !== retypePassword) {
                toast.error("Mật khẩu không khớp");
                return;
            }

            if (!name) {
                toast.error("Vui lòng điền tên!");
                return;
            }

            if (!phone) {
                toast.error("Vui lòng điền số điện thoại!");
                return;
            }
            const apiUrl = 'http://localhost:8080/auth/register/'
            const userInput = {
                username: username,
                password: password,
                name: name,
                phone: phone,
                gender: seletedGender
            }
            const headers = { 'Content-Type': 'application/json', };
            try {
                const response = await axios.post(apiUrl, userInput, { headers });
                console.log(response)
                if (response) {
                    toast.success('Tạo thành công tài khoản: ' + username + '.Bạn hãy đăng nhập ngay bây giờ nhé!')
                    setTimeout(() => {
                        router.push({ name: 'login' })
                    }, 2000);
                }
            } catch {
                toast.error("Tài khoản đã sử dụng hoặc tồn tại!")
                setTimeout(() => {

                }, 1000);
            }
        },
        getIsAuthenticatedFromLocalStorage
    }
})
