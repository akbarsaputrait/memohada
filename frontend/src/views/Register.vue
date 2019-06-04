<template>
  <ion-app>
    <ion-content>
      <ion-row
        justify-content-center
        align-items-end
        class="h-100 ion-padding-vertical"
      >
        <ion-col
          size="6"
          size-md="6"
          size-sm="12"
          size-lg="6"
          size-xs="12"
        >
          <ion-card
            mode="ios"
            class="ion-text-left"
            style="--background: white;"
          >
            <ion-text class="ion-text-left">
              <h3 class="ion-margin-start d-flex ion-align-items-center">
                <ion-icon
                  name="ios-person"
                  class="ion-margin-end"
                />
                Sign Up
              </h3>
            </ion-text>
            <ion-card-content>
              <form>
                <ion-item>
                  <ion-input
                    type="text"
                    placeholder="First name"
                    @ionInput="formData.first_name = $event.target.value;"
                  />
                </ion-item>
                <ion-item class="ion-margin-top">
                  <ion-input
                    type="text"
                    placeholder="Last name"
                    @ionInput="formData.last_name = $event.target.value;"
                  />
                </ion-item>
                <ion-item class="ion-margin-top">
                  <ion-input
                    type="email"
                    placeholder="Email Address"
                    @ionInput="formData.email = $event.target.value;"
                  />
                </ion-item>
                <ion-item class="ion-margin-top">
                  <ion-input
                    type="password"
                    placeholder="Password"
                    @ionInput="formData.password = $event.target.value;"
                  />
                </ion-item>
                <ion-item class="ion-margin-top">
                  <ion-input
                    type="password"
                    placeholder="Confirmation Password"
                    @ionInput="formData.password_confirmation = $event.target.value;"
                  />
                </ion-item>
                <ion-button
                  class="ion-margin-top"
                  expand="block"
                  mode="ios"
                  @click="send"
                >
                  Register
                </ion-button>
              </form>
            </ion-card-content>
          </ion-card>
          <ion-text
            color="dark"
            mode="ios"
            class="ion-text-center"
          >
            Already have an account? <router-link :to="{name: 'login'}">
              sign in here
            </router-link>
          </ion-text>
        </ion-col>
      </ion-row>
    </ion-content>
  </ion-app>
</template>

<script>
  export default {
    name: 'Register',
    data() {
      return {
        formData: {
          first_name: '',
          last_name: '',
          email: '',
          password: '',
          password_confirmation: ''
        }
      }
    },
    methods: {
      send() {
        this.$store.dispatch('register', this.formData)
        .then((response) => {
          this.$router.push({
            name: 'login'
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
  --background: url("https://i.ibb.co/MBLP8Y2/Artboard-2-4x.png") no-repeat
    center center / cover;
}
</style>
