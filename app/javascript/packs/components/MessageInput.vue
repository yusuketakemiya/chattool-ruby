<template>
  <div class="messageinput">
    <div>
      <!-- name：<input type="text" name="name" v-model="username"> -->
      <v-text-field
        label="Input Message."
        single-line
        solo
        name="message"
        v-model="message"
        v-on:keyup.enter="submit"
      ></v-text-field>
    </div>
  </div>
</template>

<script>
import store from '../store'

export default {
  name: 'MessageInput',
  data () {
    return {
      channel: null,
    }
  },
  created () {
    this.channel = this.$cable.subscriptions.create( "ChatChannel",{
      received: (data) => {
        store.commit('pushMessage', data.message)
        this.scrollToBottom()
      },
    })
  },
  methods: {
    submit: function () {
      store.dispatch('submitMessage', store.state.main.input).then(() => {
        this.speak()
        store.commit('setInputMessage', '')
      })
    },
    scrollToTop: function () {
      window.scrollTo(0,0);
    },
    scrollToBottom: function () {
      var obj = document.getElementById('app')
      if(!obj) return;
      window.scrollTo(0,obj.scrollHeight);
    },
    speak() {
      this.channel.perform('speak', { 
        message: store.state.main.input, 
      });
    },
  },
  computed: {
      message: {
        get () { return store.state.main.input.message },
        set (val) { store.commit('setInputMessage', val) },
      },
  }
}
</script>

<style scoped>
</style>