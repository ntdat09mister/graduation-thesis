import axios from 'axios'
import { API_BASE_URL, ACCESS_TOKEN } from '@/constants'

const service = axios.create({
  baseURL: API_BASE_URL, // url = base url + request url
  // withCredentials: true, // send cookies when cross-domain requests
  timeout: 5000, // request timeout
})

service.interceptors.request.use(
  (config) => {
    if (localStorage.getItem(ACCESS_TOKEN)) {
      config.headers['Authorization'] =
        'Bearer ' + localStorage.getItem(ACCESS_TOKEN)
    }
    return config
  },
  (error) => {
    console.log(error)
    return Promise.reject(error)
  }
)

export default service
