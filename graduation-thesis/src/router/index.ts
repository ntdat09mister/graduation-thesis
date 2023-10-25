import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import SearchView from '../views/SearchView.vue'
import ProductDetailView from '../views/ProductDetailView.vue'
import ProfileView from '../views/ProfileView.vue'
import ProductView from '../views/ProductView.vue'
import CartView from '../views/CartView.vue'
import LoginView from '../views/LoginView.vue'
import RegisterView from '../views/RegisterView.vue'
import UserInforView from '../views/UserInformation.vue'
import OrderView from '../views/OrderView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/product/:id',
      name: 'productDetail',
      component: ProductDetailView
    },
    {
      path: '/search',
      name:'search',
      component: SearchView
    },
    {
      path: '/profile',
      name: 'profile',
      component: ProfileView
    },
    {
      path: '/product',
      name: 'product',
      component: ProductView
    },
    {
      path: '/cart',
      name: 'cart',
      component: CartView
    },
    {
      path: '/login',
      name: 'login',
      component: LoginView
    },
    {
      path: '/register',
      name: 'register',
      component: RegisterView
    },
    {
      path: '/userInfor',
      name: 'userInfor',
      component: UserInforView
    },
    {
      path: '/order',
      name: 'order',
      component: OrderView
    }
  ]
})

export default router
