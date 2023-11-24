<script lang="ts">
import Header from '../components/Header.vue'
import Footer from '../components/Footer.vue'
import { defineComponent } from 'vue';
import { useUserStore } from '@/stores/user';
import { mapActions, mapState } from 'pinia';
import router from '@/router';
export default defineComponent({
  name: 'profile',
  components: {
    Header,
    Footer
  },
  computed: {
    ...mapState(useUserStore, {
      user: 'user'
    })
  },
  created() {
  },
  data() {
    return {
      checkRoleAdmin: false
    };
  },
  methods: {
    ...mapActions(useUserStore, ['getInforUser']),
    routerPage(routerName: string) {
      router.push({ name: routerName })
    }
  },
  mounted() {
  }
})
</script>

<template>
  <div>
    <div class="flex flex-col justify-center items-center">
      <Header />
      <div class="w-[1300px]">
        <div class="container d-flex justify-content-center">
          <div class="">
            <div class="card">
              <div class="m-l-0 m-r-0">
                <div class="col-sm-4 bg-c-lite-green user-profile">
                  <div class="card-block text-center text-white">
                    <template v-if="user?.role === 'admin'">
                      <div class="m-b-25">
                        <img class="rounded-full w-[100px] h-[100px]"
                          src="data:image/jpeg;base64,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"
                          alt="">
                      </div>
                    </template>
                    <template v-if="user?.role === 'sales' || user?.role === 'warehouse'">
                      <div class="m-b-25">
                        <img class="rounded-full w-[100px] h-[100px]"
                          src="data:image/jpeg;base64,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"
                          alt="">
                      </div>
                    </template>
                    <template v-if="user?.role === 'customer'">
                      <div class="m-b-25">
                        <img class="rounded-full w-[100px] h-[100px]"
                          src="https://cempartner.com/FileUpload/Images/quanlytrainghiemkhachhanglakhauquantrong_copy.jpg"
                          alt="">
                      </div>
                    </template>
                    <div class="flex content-start">
                      <h6 class="f-w-600" id="h6txt">{{ user?.name }}</h6>
                    </div>
                    <div class="flex content-start">
                      <p>Rank: {{ user?.role }}</p>
                    </div>
                    <i class=" mdi mdi-square-edit-outline feather icon-edit m-t-10 f-16"></i>
                  </div>
                  <template v-if="user?.role === 'admin'">
                    <button
                      class="w-[200px] h-[50px] text-[12px] ml-[10px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none"
                      @click="routerPage('adminUserView')">Di chuyển tới trang Admin</button>
                  </template>
                  <template v-if="user?.role === 'sales'">
                    <button
                      class="w-[200px] h-[50px] text-[12px] ml-[10px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none"
                      @click="routerPage('adminOrderView')">Di chuyển tới trang Admin</button>
                  </template>
                  <template v-if="user?.role === 'warehouse'">
                    <button
                      class="w-[200px] h-[50px] text-[12px] ml-[10px] rounded-xl bg-red-500 hover:bg-red-600 text-white focus:outline-none"
                      @click="routerPage('adminProductView')">Di chuyển tới trang Admin</button>
                  </template>
                </div>
                <div class="col-sm-8">
                  <div class="card-block">
                    <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Thông tin</h6>
                    <div class="">
                      <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">Email</p>
                        <h6 class="text-muted f-w-400">{{ user?.username }}</h6>
                      </div>
                      <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">Giới tính</p>
                        <h6 class="text-muted f-w-400">{{ user?.gender === '1' ? 'Nam' : user?.gender === '0' ? 'Nữ' :
                          'NA' }}</h6>
                      </div>
                      <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">Số điện thoại</p>
                        <h6 class="text-muted f-w-400">{{ user?.phone }}</h6>
                      </div>
                      <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">Địa chỉ</p>
                        <h6 class="text-muted f-w-400">{{ user?.address }}</h6>
                      </div>
                    </div>
                    <h6 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600">Tổng quan</h6>
                    <div class="">
                      <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">Total</p>
                        <h6 class="text-muted f-w-400">{{ user?.totalAmount }}</h6>
                      </div>
                      <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">Số giao dịch đã thành công</p>
                        <h6 class="text-muted f-w-400">Thành công: {{ user?.quantityOrdersSuccess }} / Tổng số: {{
                          user?.quantityOrders }}</h6>
                      </div>
                    </div>
                    <ul class="social-link list-unstyled m-t-40 m-b-10">
                      <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title=""
                          data-original-title="facebook" data-abc="true"><i
                            class="mdi mdi-facebook feather icon-facebook facebook" aria-hidden="true"></i></a></li>
                      <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title=""
                          data-original-title="twitter" data-abc="true"><i
                            class="mdi mdi-twitter feather icon-twitter twitter" aria-hidden="true"></i></a></li>
                      <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title=""
                          data-original-title="instagram" data-abc="true"><i
                            class="mdi mdi-instagram feather icon-instagram instagram" aria-hidden="true"></i></a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <Footer />
    </div>
  </div>
</template>

<style>
.card {
  border-radius: 5px;
  -webkit-box-shadow: 0 1px 20px 0 rgba(69, 90, 100, 0.08);
  box-shadow: 0 1px 20px 0 rgba(69, 90, 100, 0.08);
  border: none;
  margin-bottom: 30px;
}

.m-r-0 {
  margin-right: 0px;
}

.m-l-0 {
  margin-left: 0px;
}


.bg-c-lite-green {
  background: -webkit-gradient(linear, left top, right top, from(#817fe0), to(#5f92d4));
  background: linear-gradient(to right, #61b3e2, #555bad);
}

.user-profile {
  padding: 20px 0;
}

.card-block {
  padding: 1.25rem;
}

.m-b-25 {
  margin-bottom: 25px;
}

.img-radius {
  border-radius: 50%;
  width: 100px;
  height: 100px;
}

h6 {
  font-size: 14px;
}

.card .card-block p {
  line-height: 25px;
}

@media only screen and (min-width: 1400px) {
  p {
    font-size: 14px;
  }
}

.card-block {
  padding: 1.25rem;
}

.b-b-default {
  border-bottom: 1px solid #e0e0e0;
}

.m-b-20 {
  margin-bottom: 20px;
}

.p-b-5 {
  padding-bottom: 5px !important;
}

.card .card-block p {
  line-height: 25px;
}

.m-b-10 {
  margin-bottom: 10px;
}

.text-muted {
  color: #919aa3 !important;
}

.b-b-default {
  border-bottom: 1px solid #e0e0e0;
}

.f-w-600 {
  font-weight: 600;
}

.m-b-20 {
  margin-bottom: 20px;
}

.m-t-40 {
  margin-top: 20px;
}

.p-b-5 {
  padding-bottom: 5px !important;
}

.m-b-10 {
  margin-bottom: 10px;
}

.m-t-40 {
  margin-top: 20px;
}

.user-card-full .social-link li {
  display: inline-block;
}

.user-card-full .social-link li a {
  font-size: 20px;
  margin: 0 10px 0 0;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}</style>