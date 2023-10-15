import request from '@/util/request'
import type { LoginRequest } from '@/types/request'

export function getCurrentUser() {
    return request({
        url: '/users/me',
        method: 'GET',
    })
}

export function login(data: LoginRequest) {
    return request({
        url: '/auth/login',
        method: 'POST',
        data,
    })
}