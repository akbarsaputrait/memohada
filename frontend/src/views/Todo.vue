<template>
  <ion-app>
    <ion-content>
      <ListAllTodo />
    </ion-content>
  </ion-app>
</template>

<script>
  import ListAllTodo from '../components/ListAllTodo.vue'
  import {
    mapActions
  } from 'vuex'
  export default {
    components: {
      ListAllTodo,
    },
  }

</script>
