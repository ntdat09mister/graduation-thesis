<template>
    <div>
      <button @click="openPopup()">Mở popup</button>
      <div v-show="isPopupOpen" class="popup">
        Đây là nội dung của popup
        <button>click đi</button>
      </div>
    </div>
  </template>
  
  <script lang="ts">
  import { defineComponent, ref } from "vue";
  
  export default defineComponent({
    name: "App",
    data() {
      return {
        isPopupOpen: false,
      };
    },
    methods: {
      openPopup() {
        this.isPopupOpen = !this.isPopupOpen;
      },
    },
  });
  </script>
