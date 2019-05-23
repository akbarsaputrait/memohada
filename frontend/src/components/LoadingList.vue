<template>
  <!-- Skeleton screen -->
  <div>
    <div class="ion-padding custom-skeleton">
      <ion-row class="ion-justify-content-between ion-align-items-center" v-for="(i, index) in loop">
        <ion-col>
          <ion-skeleton-text animated style="width: 80%"></ion-skeleton-text>
          <ion-skeleton-text animated style="width: 50%"></ion-skeleton-text>
        </ion-col>
        <ion-col class="d-flex" style="justify-content: flex-end">
          <ion-skeleton-text animated style="width: 20%; margin-right: 5px;"></ion-skeleton-text>
          <ion-skeleton-text animated style="width: 20%; margin-right: 5px;"></ion-skeleton-text>
          <ion-skeleton-text animated style="width: 20%"></ion-skeleton-text>
        </ion-col>
      </ion-row>
    </div>
  </div>
</template>

<style>
  /* Custom Skeleton Line Height and Margin */
  .custom-skeleton ion-skeleton-text {
    line-height: 13px;
  }

  .custom-skeleton ion-skeleton-text:last-child {
    margin-bottom: 5px;
  }

</style>

<script>
  export default {
    name: 'LoadingVue',
    data() {
        return {
            loop: 5
        }
    }
  }

</script>
