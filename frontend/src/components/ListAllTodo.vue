<template>
  <div class="h-100">
    <div v-if="todos === undefined || todos.length == 0" class="ion-padding custom-skeleton">
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
            <ion-icon name="ios-alert"></ion-icon> You have no task at all
          </ion-badge>
        </ion-col>
      </ion-row>
    </div>
    <ion-scroll v-else>
      <ion-list mode="ios" class="ion-padding">
        <ion-item v-for="(item, index) in todos" class="d-flex ion-justify-content-between ion-align-items-center">
          <ion-label>
            <ion-badge color="medium" mode="ios">
              <ion-icon name="ios-calendar" /> {{ item.deadline | moment("dddd, MMMM Do YYYY") }}
            </ion-badge>
            <h3>{{ item.title }}</h3>
            <small>{{ item.description }}</small>
          </ion-label>
          <ion-button mode="ios" fill="solid" size="small" color="primary"
            @click="$router.push({name: 'editTodo', params: {id: item.id}})">
            <ion-icon name="ios-create" />
          </ion-button>
          <ion-button mode="ios" fill="solid" size="small" color="danger" @click="confirmDelete(item.id)">
            <ion-icon name="ios-trash" />
          </ion-button>
          <ion-button mode="ios" fill="solid" size="small" color="success" @click="confirmDone(item.id)">
            <ion-icon name="ios-checkmark" />
          </ion-button>
        </ion-item>
      </ion-list>
    </ion-scroll>
    <ion-footer mode="ios" class="h-100">
      <div class="footer">

        <ion-searchbar search-icon="ios-search" mode="ios" class="no-padding-horizontal" />

        <div class="ion-padding-vertical">
          <router-link :to="{name: 'addTodo'}" style="text-decoration: none !important;">
            <ion-button mode="ios" expand="block" size="medium" color="warning">
              <ion-icon slot="start" name="ios-add" />New Task
            </ion-button>
          </router-link>
          <router-link :to="{name: 'addTodo'}" style="text-decoration: none !important;">
            <ion-button mode="ios" fill="clear" size="small" color="success">
              Show completed task
            </ion-button>
          </router-link>
        </div>

        <ion-item lines="none" class="ion-no-padding"
          style="padding-bottom: 16px !important; border-bottom: none !important;">
          <ion-avatar slot="start">
            <img src="https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y">
          </ion-avatar>
          <ion-text>
            <h6 class="ion-no-margin">
              {{ user.first_name + ' ' + user.last_name }}
            </h6>
            <small>{{ user.email }}</small>
          </ion-text>
          <ion-button slot="end" fill="clear" color="danger" @click="logout">
            Logout
          </ion-button>
        </ion-item>
      </div>
    </ion-footer>
  </div>
</template>

<script>
  import Modal from './ModalAdd.vue'
  import LoadingList from './LoadingList'
  import {
    mapGetters
  } from 'vuex'
  export default {
    components: {
      LoadingList
    },
    data() {
      return {
        user: {}
      }
    },
    created() {
      this.$store.dispatch('user')
        .then((response) => {
          this.user = response.data
          this.$store.dispatch('todos')
        })
        .catch((error) => {
          console.log(error)
        })
    },
    computed: {
      ...mapGetters([
        'todos'
      ])
    },
    methods: {
      modalAdd() {
        this.$ionic.modalController
          .create({
            component: Modal,
            mode: 'ios',
            showBackdrop: true,
            keyboardClose: true,
            componentProps: {
              data: {
                header: 'Add Task',
              }
            },
          })
          .then(m => m.present())
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
      },
      confirmDone(id) {
        return this.$ionic.alertController
          .create({
            mode: 'ios',
            message: 'Is this task complete?',
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
                  console.log('Confirm Okay')
                },
              },
            ],
          })
          .then(a => a.present())
      },
      logout() {
        return this.$ionic.alertController
          .create({
            mode: 'ios',
            message: 'Are you sure want to logout?',
            buttons: [{
                text: 'No',
                role: 'cancel',
                cssClass: 'secondary',
                handler: blah => {
                  console.log('Confirm Cancel')
                },
              },
              {
                text: 'Yes',
                handler: () => {
                  this.$store.dispatch('logout')
                    .then((response) => {
                      this.$router.push({
                        name: 'login'
                      })
                    })
                    .catch((error) => {
                      this.$router.push({
                        name: 'todo'
                      })
                    })
                },
              },
            ],
          })
          .then(a => a.present())
      }
    },
  }

</script>

<style>
  .footer {
    background: white;
    position: fixed;
    bottom: 0px;
    right: 0px;
    padding: 0px 16px;
    -webkit-box-shadow: 0px 2px 36px -10px rgba(0, 0, 0, 0.19);
    box-shadow: 0px 2px 36px -10px rgba(0, 0, 0, 0.19);
    left: 0px;
  }

  .no-padding-horizontal {
    padding-left: 0px !important;
    padding-right: 0px !important;
    padding-bottom: 0px !important;
  }

</style>
