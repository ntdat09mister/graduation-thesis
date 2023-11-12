<template>
    <div>
      <button @click="showPopup">Hiển thị Popup</button>
  
      <div class="popup" v-show="isPopupVisible">
        <div class="popup-content">
          <p>Nội dung của Popup</p>
          <button @click="hidePopup">Đóng Popup</button>
        </div>
      </div>
    </div>
  </template>
  
  <script lang="ts">
  import { ref } from 'vue';
  
  export default {
    setup() {
      const isPopupVisible = ref(false);
  
      const showPopup = () => {
        isPopupVisible.value = true;
      };
  
      const hidePopup = () => {
        isPopupVisible.value = false;
      };
  
      return {
        isPopupVisible,
        showPopup,
        hidePopup,
      };
    },
  };
  </script>
  
  <style scoped>
  .popup {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: white;
    border: 1px solid #ccc;
    padding: 20px;
    z-index: 9999;
    display: none; /* Initially hidden */
  }
  
  .popup-content {
    text-align: center;
  }
  </style>