import axios from 'axios'
import { computed, ref } from 'vue'
import { defineStore } from 'pinia'
import { toast } from 'vue3-toastify'
export const useUserStore = defineStore('user', () => {
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
        modifiedAt: string,
        quantityOrders: string,
        quantityOrdersSuccess: string,
        totalAmount: string
    }
    const defaultUser: User = { id: 0, username: '', name: '', gender: '', address: '', phone: '', role: '', avatar: '', createdAt: '', modifiedAt: '', quantityOrders: '', quantityOrdersSuccess: '', totalAmount: '' };
    const user = ref<User>(defaultUser);
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
    interface UserForAdmin {
        id: number,
        username: string,
        name: string,
        gender: string,
        address: string,
        phone: string,
        role: string,
        createdAt: string
    }
    const listUsersAdmin = ref<UserForAdmin[]>([]);
    async function getUsersAdmin() {
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
            const response = await axios.get(`http://localhost:8080/user/admin/all`, config);
            const responseData = response.data;
            if (responseData && responseData.data) {
                const data = responseData.data;
                if (data && Array.isArray(data)) {
                    const transformedData: UserForAdmin[] = data.map((item: any) => ({
                        id: item.id,
                        username: item.username,
                        name: item.name,
                        gender: item.gender,
                        address: item.address,
                        phone: item.phone,
                        role: item.role,
                        createdAt: item.createdAt
                    }));
                    listUsersAdmin.value = transformedData;
                } else {
                    toast.error('Không tìm được sản phẩm!')
                    setTimeout(() => {
                    }, 1000);
                    console.error('Invalid data received from the API:', data);
                }
            } else {
                console.error('No data received from the API');
            }
        } catch (error) {
            console.error('Error fetching data:', error);
        }
    }
    async function updateUserAdmin(idInput: number, usernameInput: string, nameInput: string, genderInput: string, addressInput: string, phoneInput: string, roleInput: string) {
        try {
            if (!idInput || !usernameInput || !nameInput || !genderInput || !addressInput || !phoneInput || !roleInput) {
                toast.error("Vui lòng không bỏ trống bất cứ trường thông tin nào!");
                return;
            }
            if (phoneInput.length > 12 || phoneInput.length < 10) {
                toast.error("Số điện thoại phải là 10 hoặc 11 số");
                return;
            }
            const token = localStorage.getItem("accessToken");
            if (!token) {
                console.error('Access token not found in localStorage');
                return;
            }
            const apiUrl = 'http://localhost:8080/user/admin/updateUserAdmin';
            const requestData = {
                id: idInput,
                username: usernameInput,
                name: nameInput,
                gender: genderInput,
                address: addressInput,
                phone: phoneInput,
                role: roleInput
            }
            const headers = { Authorization: `Bearer ${token}` };
            const response = await axios.put(apiUrl, requestData, { headers });
            console.log(response)
            toast.success('Cập nhật thành công!')
            setTimeout(() => {
            }, 1000);
            const scrollPosition = window.scrollY;
            location.reload();
            window.scrollTo(0, scrollPosition);
        } catch (error) {
            console.error('Error fetching data:', error);
        }
    }

    async function updateUser(idInput: number, addressInput: string, phoneInput: string) {
        try {
            if (!idInput || !addressInput || !phoneInput) {
                toast.error("Vui lòng không bỏ trống bất cứ trường thông tin nào!");
                return;
            }
            if (phoneInput.length > 11 || phoneInput.length < 10) {
                toast.error("Số điện thoại phải là 10 hoặc 11 số");
                return;
            }
            const token = localStorage.getItem("accessToken");
            if (!token) {
                console.error('Access token not found in localStorage');
                return;
            }
            const apiUrl = 'http://localhost:8080/user/updateUser';
            const requestData = {
                userId: idInput,
                address: addressInput,
                phone: phoneInput,
            }
            const headers = { Authorization: `Bearer ${token}` };
            const response = await axios.put(apiUrl, requestData, { headers });
            console.log(response)
            toast.success('Cập nhật thành công!')
            setTimeout(() => {
            }, 2000);
            const scrollPosition = window.scrollY;
            location.reload();
            window.scrollTo(0, scrollPosition);
        } catch (error) {
            toast.error('Cập nhật khống thành công!')
            console.error('Error fetching data:', error);
        }
    }
    const page = ref(1)
    function setPage(value: number) { page.value = value }
    const limit = ref(8)
    const listDisplayUsersAdmin = computed(() => {
        const fromUser = (page.value - 1) * limit.value
        const toUser = page.value * limit.value - 1
        return listUsersAdmin.value.filter((baby, index) => {
            return index >= fromUser && index <= toUser
        })
    })
    return {
        getInforUser,
        user,
        setPage,
        listDisplayUsersAdmin,
        getUsersAdmin,
        listUsersAdmin,
        updateUserAdmin,
        updateUser
    }
})