<template>
  <div class="messageinput">
    <div>
      <v-card-text style="position: relative">
        <v-textarea
          outline
          label="Input Message.　SendMessage is ctrl+enter"
          name="message"
          v-model="inputText"
          v-on:keydown.ctrl.enter="submit"
        ></v-textarea>
        <v-btn
          absolute
          dark
          fab
          top
          right
          color="info"
          v-on:click="submit"
        >
          <v-icon>chat</v-icon>
        </v-btn>
      </v-card-text>
    </div>
  </div>
</template>

<script>
import store from '../store'

export default {
  name: 'MessageInput',
  data () {
    return {
    }
  },
  created () {
    this.$chat.connect(store.state.main.input.room.id, 
    (data) => {
      store.commit('pushMessage', data.message);
    })
  },
  methods: {
    submit: function () {
      if (store.state.main.input.data.value.length === 0) return;
      store.dispatch('submitMessage', store.state.main.input).then(() => {
        this.send();
        store.commit('setInputText', '');
      })
    },
    send() {
      this.$chat.send(store.state.main.message);
    },
  },
  computed: {
      inputText: {
        get () { return store.state.main.input.data.value; },
        set (val) { store.commit('setInputText', val); },
      },
  }
}
</script>

<style scoped>
</style>
