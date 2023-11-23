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
                    <div class="m-b-25">
                      <template>
                        <img src="String(avatar)" class="img-radius" alt="user_profile.jpg">
                      </template>
                      <template>
                        <img
                          src="https://ss-images.saostar.vn/wp700/2018/06/10/2968571/34689401_2147325555551794_7654281988110548992_n.jpg"
                          class="img-radius" alt="user_profile.jpg">
                      </template>
                    </div>
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
                </div>
                <div class="col-sm-8">
                  <div class="card-block">
                    <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Information</h6>
                    <div class="">
                      <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">Email</p>
                        <h6 class="text-muted f-w-400">{{ user?.username }}</h6>
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
                        <h6 class="text-muted f-w-400">2000$</h6>
                      </div>
                      <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">Số giao dịch đã thành công</p>
                        <h6 class="text-muted f-w-400">Thành công: 200 / Tổng số: 300</h6>
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
}
</style>