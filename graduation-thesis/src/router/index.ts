import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import SearchView from '../views/SearchView.vue'
import ProductDetailView from '../views/ProductDetailView.vue'
import ProfileView from '../views/ProfileView.vue'
import ProductView from '../views/ProductView.vue'
import CartView from '../views/CartView.vue'
import LoginView from '../views/LoginView.vue'
import RegisterView from '../views/RegisterView.vue'
import OrderView from '../views/OrderView.vue'
import OrderDetailView from '../views/OrderDetailView.vue'
import AdminOrderView from '../views/AdminOrderView.vue'
import AdminProductView from '../views/AdminProductView.vue'
import AdminUserView from '../views/AdminUserView.vue'
import PaymentView from '../views/PaymentView.vue'
import AdminPromotionView from '../views/AdminPromotionView.vue'
import BillOrderView from '../views/BillOrderView.vue'
import ReceiptView from '../views/ReceiptView.vue'
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
      path: '/order',
      name: 'order',
      component: OrderView
    },
    {
      path: '/orderDetail/:id',
      name: 'orderDetail',
      component: OrderDetailView
    },
    {
      path: '/adminOrderView',
      name: 'adminOrderView',
      component: AdminOrderView
    },
    {
      path: '/adminProductView',
      name: 'adminProductView',
      component: AdminProductView
    },
    {
      path: '/adminUserView',
      name: 'adminUserView',
      component: AdminUserView
    },
    {
      path: '/payment/:id',
      name: 'payment',
      component: PaymentView
    },
    {
      path: '/adminPromotionView',
      name: 'adminPromotionView',
      component: AdminPromotionView
    },
    {
      path: '/billOrder/:id',
      name: 'billOrder',
      component: BillOrderView
    },
    {
      path: '/receipt',
      name: '/ReceiptView',
      component: ReceiptView
    }
  ]
})

export default router
