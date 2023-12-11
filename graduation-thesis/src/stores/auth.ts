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
        async login(username: string, password: string) {
            if (username.length > 50) {
                toast.error("Nhập quá số kí tự cho phép");
                return;
            }
            if (password.length < 6 || password.length > 50) {
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
            const apiUrl = 'http://localhost:8080/auth/login'
            const userInput = {
                username: username,
                password: password,
            }
            const headers = { 'Content-Type': 'application/json', };
            try {
                const response = await axios.post(apiUrl, userInput, { headers });
                const { access_token } = response.data
                console.log(response)
                if (access_token && access_token.length > 50) {
                    localStorage.setItem("accessToken", access_token as string);
                    localStorage.setItem("authenticated", 'true');
                    toast.success("Đăng nhập thành công")
                    setTimeout(() => {
                        router.push({ name: 'home' }).then(() => {
                            location.reload();
                        });
                    }, 1000);
                }
                if (access_token === 'block') {
                    toast.error("Tài khoản đã bị khóa!")
                }
            } catch {
                toast.error("Sai tên đăng nhập hoặc mật khẩu, vui lòng nhập lại")
            }
        },
        async changePassword(userName: string, oldPassword: string, newPassword: string, retypeNewPassword: string) {
            try {
                if (!oldPassword || !newPassword || !retypeNewPassword) {
                    toast.error("Vui lòng không bỏ trống bất cứ trường thông tin nào!");
                    return;
                }
                if (oldPassword.length < 7 || oldPassword.length > 50 || newPassword.length < 6 || newPassword.length > 50 || retypeNewPassword.length < 6 || retypeNewPassword.length > 50) {
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
        async register(username: string, password: string, retypePassword: string, name: string, phone: string, adressSelected: string, seletedGender: string) {
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
            console.log('value' + adressSelected)
            const apiUrl = 'http://localhost:8080/auth/register/'
            const userInput = {
                username: username,
                password: password,
                name: name,
                gender: seletedGender,
                address: adressSelected,
                phone: phone             
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
        async forgotPassword(userName: string, phoneNumber: string) {
            try {
                if (!userName || !phoneNumber) {
                    toast.error("Vui lòng không bỏ trống bất cứ trường thông tin nào!");
                    return;
                }
                const apiUrl = 'http://localhost:8080/auth/forgotPassword';
                const requestData = {
                    username: userName,
                    phoneNumber: phoneNumber,
                }
                const response = await axios.post(apiUrl, requestData, {});
                console.log(response)
                if (response.status === 200) {
                    toast.success('Mật khẩu mới là: ' + response.data + '\nHãy lưu lại thông tin này để đăng nhập trong lần đăng nhập tiếp theo')
                    setTimeout(() => {
                        router.push({ name: 'login' })
                    }, 1000);
                }
            } catch (error) {
                toast.error('Sai tên tài khoản hoặc số điện thoại!')
                console.error('Error fetching data:', error);
            }
        },
        getIsAuthenticatedFromLocalStorage,
    }
})
