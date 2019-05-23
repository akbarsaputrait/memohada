<template>
<ion-app>
  <ion-content>
    <ion-row justify-content-center align-items-end class="h-100 ion-padding-vertical">
      <ion-col size="6" size-md="6" size-sm="12" size-lg="6" size-xs="12">
        <ion-card mode="ios" class="ion-text-left">
          <ion-text class="ion-text-left">
            <h3 class="ion-margin-start d-flex ion-align-items-center">
              <ion-icon name="ios-person" class="ion-margin-end" />
              Sign Up
            </h3>
          </ion-text>
          <ion-card-content>
            <form>
              <ion-item>
                <ion-input type="text" placeholder="First name" />
              </ion-item>
              <ion-item class="ion-margin-top">
                <ion-input type="text" placeholder="Last name" />
              </ion-item>
              <ion-item class="ion-margin-top">
                <ion-input type="email" placeholder="Email Address" />
              </ion-item>
              <ion-item class="ion-margin-top">
                <ion-input type="password" placeholder="Password" />
              </ion-item>
              <ion-button class="ion-margin-top" expand="block" mode="ios">
                Register
              </ion-button>
            </form>
          </ion-card-content>
        </ion-card>
        <ion-text color="dark" mode="ios" class="ion-text-center">
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

  }

</script>
