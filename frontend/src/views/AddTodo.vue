<template>
  <div>
    <ion-app>
      <ion-content padding>
        <ion-text mode="ios" class="ion-no-margin">
          <h1>Add new task</h1>
        </ion-text>
        <ion-item>
          <ion-input placeholder="Title" autofocus :value="task.title" @ionInput="task.title = $event.target.value;" />
        </ion-item>
        <ion-item>
          <ion-textarea placeholder="Description" :value="task.description"
            @ionInput="task.description = $event.target.value;" auto-grow />
        </ion-item>
        <ion-item lines="none">
          <ion-text>
            Deadline
          </ion-text>
        </ion-item>
        <v-date-picker v-model="task.deadline" :data="task.deadline" is-inline color="indigo" title-position="left"
          is-expanded :min-date='new Date()' locale="id"></v-date-picker>
        <div class="ion-padding-vertical">
          <ion-button color="primary" expand="block" mode="ios" @click="save">
            Save
          </ion-button>
          <router-link :to="{name: 'todo'}" style="text-decoration: none !important;">
            <ion-button color="danger" expand="block" mode="ios">
              Cancel
            </ion-button>
          </router-link>
        </div>
      </ion-content>
    </ion-app>
  </div>
</template>

<script>
  var moment = require('moment');
  export default {
    name: "AddTodo",
    data() {
      return {
        task: {
          title: "",
          description: "",
          deadline: new Date(),
        }
      }
    },
    methods: {
      save() {
        this.$store.dispatch('add', {
            title: this.task.title,
            description: this.task.description,
            deadline: moment(this.task.deadline).format("YYYY-MM-DD")
          })
          .then((response) => {
            this.$ionic.toastController.create({
              message: 'Success!',
              duration: 1000,
              mode: 'ios',
              posittion: 'bottom',
              color: 'primary'
            }).then(t => t.present())

            setTimeout(() => {
              this.$router.push({
                name: 'todo'
              })
            }, 1000)
          })
          .catch((error) => {
            if (error.response.status === 400) {
              this.$ionic.toastController.create({
                message: 'Something wrong!',
                duration: 2000,
                mode: 'ios',
                posittion: 'bottom',
                color: 'warning'
              }).then(t => t.present())
            }
          })
      }
    }
  };

</script>
