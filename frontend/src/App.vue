<template>
  <div id="app">
    <loading :active.sync="loading" :can-cancel="false" :is-full-page="true" />
    <transition name="router-anim">
      <router-view />
    </transition>
  </div>
</template>

<script>
  // Import component
  import Loading from "vue-loading-overlay"
  // Import stylesheet
  import "vue-loading-overlay/dist/vue-loading.css"
  import {
    mapGetters
  } from 'vuex'

  export default {
    created: function () {
      this.$http.interceptors.response.use(undefined, function (err) {
        return new Promise(function (resolve, reject) {
          if (err.status === 401 && err.config && !err.config.__isRetryRequest) {
            this.$store.dispatch('logout')
            .then((response) => {
              this.$router.push({name: 'login'})
            })
            .catch((error) => {
              this.$router.push({name: 'login'})
            })
          }
          throw err;
        });
      });
    },
    computed: {
      ...mapGetters([
        'loading'
      ])
    },
    components: {
      Loading
    }
  }

</script>


<style>
  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
  }


  .d-flex {
    display: flex !important;
  }

  .vertical-align-content>* {
    display: flex !important;
    align-content: center !important;
    align-items: center !important;
  }

  .h-100 {
    height: 100% !important;
  }

  .w-80 {
    width: 80% !important;
  }

  .router-anim-enter-active {
    animation: coming .5s;
    animation-delay: .5s;
    opacity: 0;
  }

  .router-anim-leave-active {
    animation: going .5s;
  }

  @keyframes going {
    from {
      transform: translateX(0);
    }

    to {
      transform: translateX(-50px);
      opacity: 0;
    }
  }

  @keyframes coming {
    from {
      transform: translateX(-50px);
      opacity: 0;
    }

    to {
      transform: translateX(0);
      opacity: 1;
    }
  }

  @media (min-width: 1281px) {

    img {
      max-width: 80%;
    }

  }

  @media (min-width: 1025px) and (max-width: 1280px) {

    img {
      max-width: 80%;
    }

  }

  @media (min-width: 768px) and (max-width: 1024px) {

    img {
      max-width: 80%;
    }

  }

  @media (min-width: 768px) and (max-width: 1024px) and (orientation: landscape) {

    img {
      max-width: 50%;
    }

  }

  @media (min-width: 481px) and (max-width: 767px) {

    img {
      max-width: 50%;
    }

  }

  @media (min-width: 320px) and (max-width: 480px) {

    img {
      max-width: 50%;
    }

  }

  ul.errors {
    list-style-type: none;
    background: red;
    color: white;
    border-radius: 8px;
  }

</style>
