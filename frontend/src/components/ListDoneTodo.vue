<template>
  <div>
    <ion-header mode="ios">
      <ion-toolbar color="primary" mode="ios">
          <ion-button slot="start" mode="ios" @click="back">
              <ion-icon name="arrow-round-back"></ion-icon>
          </ion-button>
        <ion-title>Completed Tasks</ion-title>
      </ion-toolbar>
    </ion-header>
    <div v-if="doneTodos === undefined || doneTodos.length == 0" class="ion-padding custom-skeleton">
      <ion-row align-items-center v-for="item in 3">
        <ion-col>
          <ion-skeleton-text style="width: 40%"></ion-skeleton-text>
          <ion-skeleton-text style="width: 100%"></ion-skeleton-text>
          <ion-skeleton-text style="width: 70%"></ion-skeleton-text>
        </ion-col>
        <ion-col size="4">
          <ion-row align-items-center>
            <ion-col>
              <ion-skeleton-text style="width: 100%"></ion-skeleton-text>
            </ion-col>
            <ion-col>
              <ion-skeleton-text style="width: 100%"></ion-skeleton-text>
            </ion-col>
            <ion-col>
              <ion-skeleton-text style="width: 100%"></ion-skeleton-text>
            </ion-col>
          </ion-row>
        </ion-col>
      </ion-row>
      <ion-row justify-content-center>
        <ion-col>
          <ion-badge color="light">
            <ion-icon name="ios-alert"></ion-icon> You have no completed task
          </ion-badge>
        </ion-col>
      </ion-row>
    </div>
    <ion-content v-else :scrollEvents="true" scrollY="true" class="full-scroll">
      <ion-list mode="ios" class="ion-padding">
        <ion-item v-for="(item, index) in doneTodos" class="d-flex ion-justify-content-between ion-align-items-center">
          <ion-label>
            <ion-badge color="medium" mode="ios">
              <ion-icon name="ios-calendar" /> {{ item.deadline | moment("dddd, MMMM Do YYYY") }}
            </ion-badge>
            <h3>{{ item.title }}</h3>
            <small>{{ item.description }}</small>
          </ion-label>
          <ion-button mode="ios" fill="solid" size="small" color="danger" @click="confirmDelete(item.id)">
            <ion-icon name="ios-trash" />
          </ion-button>
        </ion-item>
      </ion-list>
    </ion-content>
  </div>
</template>

<script>
  import {
    mapGetters
  } from 'vuex'
  export default {
    name: 'ListDoneTodo',
    created() {
      this.$store.dispatch('getDone')
    },
    computed: {
      ...mapGetters([
        'doneTodos'
      ])
    },
    methods: {
        back() {
            this.$router.push({name: 'todo'})
        },
        confirmDelete(id) {
        return this.$ionic.alertController
          .create({
            mode: 'ios',
            message: 'Are you sure want to delete this task?',
            buttons: [{
                text: 'No',
                role: 'cancel',
                cssClass: 'secondary',
                handler: blah => {
                  console.log('Confirm Cancel:', id)
                },
              },
              {
                text: 'Yes',
                handler: () => {
                  this.$store.dispatch('delete', id)
                    .then((response) => {
                      this.$ionic.toastController.create({
                          message: 'Succes',
                          duration: 1000,
                          mode: 'ios',
                          color: 'primary'
                        })
                        .then(t => t.present())

                      setTimeout(() => {
                        this.$router.go(this.$router.currentRoute)
                      }, 500)
                    })
                    .catch((error) => {
                      this.$ionic.toastController.create({
                          message: 'Something wrong',
                          duration: 1000,
                          mode: 'ios',
                          color: 'warning'
                        })
                        .then(t => t.present())
                    })
                },
              },
            ],
          })
          .then(a => a.present())
      }
    }
  }

</script>

<style>
  .full-scroll {
    white-space: nowrap;
    height: 40em;
  }

</style>
