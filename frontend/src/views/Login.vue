<template>
  <!-- F3F4F6 -->
  <ion-app>
    <ion-content class="bg-color">
      <ion-row justify-content-center align-items-end class="h-100 ion-padding-vertical bg-color">
        <ion-col size="6" size-md="6" size-sm="12" size-lg="6" size-xs="12">
          <ion-card mode="ios" class="ion-text-left" style="--background: white;">
            <ion-text class="ion-text-left">
              <h3 class="ion-margin-start d-flex ion-align-items-center">
                <ion-icon name="ios-log-in" class="ion-margin-end" />
                Sign In
              </h3>
            </ion-text>
            <ion-card-content>
              <form>
                <ion-item>
                  <ion-input inputmode="email" placeholder="Email Address" mode="ios" data-vv-name="email" type="email"
                    v-validate.continues="'required|email'" @ionInput="formData.email = $event.target.value;" />
                </ion-item>
                <ul class="errors">
                  <li v-for="error in errors.collect('email')">{{ error }}</li>
                </ul>
                <ion-item class="ion-margin-top">
                  <ion-input type="password" placeholder="Password" data-vv-name="password"
                    v-validate.continues="'required|min:8'" @ionInput="formData.password = $event.target.value;" />
                </ion-item>
                <ul class="errors">
                  <li v-for="error in errors.collect('password')">{{ error }}</li>
                </ul>
                <ion-button class="ion-margin-top" expand="block" mode="ios" @click="send">
                  Login
                </ion-button>
              </form>
            </ion-card-content>
          </ion-card>
          <ion-text color="dark" mode="ios" class="ion-text-center">
            Didn't have an account? <router-link :to="{name: 'register'}">
              sign up here
            </router-link>
          </ion-text>
        </ion-col>
      </ion-row>
    </ion-content>
  </ion-app>
</template>

<script>
  export default {
    data() {
      return {
        formData: {
          email: '',
          password: ''
        }
      }
    },
    methods: {
      send() {
        this.$store.dispatch('login', this.formData)
          .then((response) => {
            this.$router.push({
              name: 'todo'
            })
          })
          .catch((error) => {
            this.$ionic.toastController.create({
                message: 'Something wrong',
                mode: 'ios',
                color: 'warning',
                duration: 2000
              })
              .then(t => t.present())
          })
      }
    }
  }

</script>

<style lang="scss" scoped>
  ion-content {
    --background: url('https://i.ibb.co/884cg3c/Artboard-1-4x.png') no-repeat center center / cover;
  }

</style>
