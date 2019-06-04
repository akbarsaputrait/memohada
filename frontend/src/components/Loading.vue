<template>
  <div class="vld-parent">
    <loading
      :active.sync="isLoading" 
      :can-cancel="true" 
      :on-cancel="onCancel"
      :is-full-page="fullPage"
    />
  </div>
</template>

<script>


export default {
  components: {
    Loading
  },
  data() {
    return {
      isLoading: true,
      fullPage: true
    };
  },
  methods: {
    doAjax() {
      this.isLoading = true;
      // simulate AJAX
      setTimeout(() => {
        this.isLoading = false;
      }, 5000);
    },
    onCancel() {
      console.log("User cancelled the loader.");
    }
  }
};
</script>
