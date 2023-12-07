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
            if (username.length > 50) {
                toast.error("Nhập quá số kí tự cho phép");
                return;
            }
            if (password.length < 7 || password.length > 50) {
                toast.error("Nhập sai số kí tự cho phép");
                return;
            }
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
        async changePassword(userName: string, oldPassword: string, newPassword: string, retypeNewPassword: string) {
            try {
                if (!oldPassword || !newPassword || !retypeNewPassword) {
                    toast.error("Vui lòng không bỏ trống bất cứ trường thông tin nào!");
                    return;
                }
                if (oldPassword.length < 7 || oldPassword.length > 50 || newPassword.length < 7 || newPassword.length > 50 || retypeNewPassword.length < 7 || retypeNewPassword.length > 50) {
                    toast.error("Nhập sai số kí tự cho phép");
                    return;
                }
                if (newPassword != retypeNewPassword) {
                    toast.error("Mật khẩu nhập không khớp");
                    return;
                }
                const token = localStorage.getItem("accessToken");
                if (!token) {
                    console.error('Access token not found in localStorage');
                    return;
                }
                const apiUrl = 'http://localhost:8080/auth/changePassword';
                const requestData = {
                    userName: userName,
                    oldPassword: oldPassword,
                    newPassword: newPassword,
                    retypeNewPassword: retypeNewPassword
                }
                const headers = { Authorization: `Bearer ${token}` };
                const response = await axios.put(apiUrl, requestData, { headers });
                console.log(response)
                if (response.status === 200) {
                    toast.success('Đổi mật khẩu thành công')
                    setTimeout(() => {
                        router.push({ name: 'login' })
                    }, 2000);
                }
            } catch (error) {
                toast.error('Đổi mật khẩu thất bại!')
                console.error('Error fetching data:', error);
            }
        },
        async register(username: string, password: string, retypePassword: string, name: string, phone: string, seletedGender: string) {
            if (!username) {
                toast.error("Vui lòng điền tên tài khoản!");
                return;
            }
            if (username.length > 50) {
                toast.error("Nhập quá số kí tự cho phép");
                return;
            }

            if (!password) {
                toast.error("Vui lòng điền mật khẩu!");
                return;
            }
            if (password.length < 6 || password.length > 50) {
                toast.error("Nhập sai số kí tự cho phép");
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
            if (!/^[0-9]+$/.test(phone.replace(/\s/g, ""))) {
                toast.error("Số điện thoại sai định dạng");
                return;
            }
            if (phone.length > 12 || phone.length < 10) {
                toast.error("Số điện thoại phải là 10 hoặc 11 số");
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
        getIsAuthenticatedFromLocalStorage,
    }
})
