<template>
  <div id="app">
    <transition name="router-anim">
      <router-view />
    </transition>
  </div>
</template>

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

</style>
