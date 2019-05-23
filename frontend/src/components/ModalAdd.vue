<template>
  <div>
    <ion-content padding>
      <ion-text mode="ios">
        <h1>{{ header }}</h1>
      </ion-text>
      <ion-item>
        <ion-input placeholder="Title" autofocus :value="task.title" @ionInput="task.title = $event.target.value;">
        </ion-input>
      </ion-item>
      <ion-item>
        <ion-label>Deadline</ion-label>
        <ion-datetime mode="ios" :min="new Date().toISOString()" :value="task.deadline" max="2030-12-31"
          display-format="MMM DD, YYYY HH:mm" @ionInput="task.deadline = $event.target.value;"></ion-datetime>
      </ion-item>
      <ion-item>
        <ion-textarea placeholder="Description" :value="task.description"
          @ionInput="task.description = $event.target.value;"></ion-textarea>
      </ion-item>
      <div class="ion-padding-vertical">
        <ion-button color="primary" expand="block" mode="ios" @click="saveTask">Save</ion-button>
        <ion-button color="danger" expand="block" @click="closeModal" mode="ios">Cancel</ion-button>
      </div>
    </ion-content>
  </div>
</template>

<script>
  export default {
    name: "Modal",
    data() {
      return {
        header: '',
        task: {
          title: '',
          description: '',
          deadline: ''
        }
      };
    },
    methods: {
      closeModal() {
        this.$ionic.modalController.dismiss()
      },
      saveTask() {
        console.log(this.task)
      }
    }
  };

</script>
