<template>
  <div class="messageinput">
    <div>
      <v-card-text style="position: relative">
        <v-textarea
          outline
          label="Input Message."
          name="message"
          v-model="message"
          v-on:keydown.meta.enter="submit"
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
      this.scrollToBottom();
    })
  },
  methods: {
    submit: function () {
      store.dispatch('submitMessage', store.state.main.input).then(() => {
        this.send();
        store.commit('setInputMessage', '');
      })
    },
    scrollToTop: function () {
      window.scrollTo(0,0);
    },
    scrollToBottom: function () {
      var obj = document.getElementById('app');
      if(!obj) return;
      window.scrollTo(0,obj.scrollHeight);
    },
    send() {
      this.$chat.send(store.state.main.input);
    },
  },
  computed: {
      message: {
        get () { return store.state.main.input.message; },
        set (val) { store.commit('setInputMessage', val); },
      },
  }
}
</script>

<style scoped>
</style>