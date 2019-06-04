<template>
  <div>
    <ion-app>
      <ion-content padding>
        <ion-text mode="ios">
          <h1>Edit task</h1>
        </ion-text>
        <ion-item>
          <ion-input placeholder="Title" autofocus :value="task.title" @ionInput="task.title = $event.target.value;" />
        </ion-item>
        <ion-item>
          <ion-label>Deadline</ion-label>
          <ion-datetime mode="ios" :min="new Date().toISOString()" :value="task.deadline" max="2030-12-31"
            display-format="MMM DD, YYYY HH:mm" @ionInput="task.deadline = this.$moment($event.target.value, 'YYYY-MM-DD HH:mm:ss');" />
        </ion-item>
        <ion-item>
          <ion-textarea placeholder="Description" :value="task.description"
            @ionInput="task.description = $event.target.value;" />
        </ion-item>
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
  export default {
    name: "EditTodo",
    data() {
      return {
        task: {
          title: "",
          description: "",
          deadline: "",
          id: ""
        }
      };
    },
    created() {
        const id = this.$route.params.id
        this.$store.dispatch('show', id)
        .then((response) => {
            const data = response.data.data
            this.task.title = data.title
            this.task.deadline = data.deadline
            this.task.description = data.description
            this.task.id = id
        })
        .catch((error) => {
            console.log(error.response)
        })
    },
    methods: {
      save() {
        this.$store.dispatch('update', this.task)
          .then((response) => {
            this.$ionic.toastController.create({
              message: 'Success!',
              duration: 1000,
              mode: 'ios',
              posittion: 'bottom',
              color: 'primary'
            }).then(t => t.present())

            setTimeout(() => {
                this.$router.push({name: 'todo'})
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
  }

</script>
