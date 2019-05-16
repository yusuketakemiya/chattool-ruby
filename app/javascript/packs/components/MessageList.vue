<template>
  <div class="messagelist" id="list">
    <v-container ref="scrollContainer" grid-list-md text-xs-center 
    style="max-height: 70vh; overflow-x: hidden"
    class="scroll-y">
      <v-layout row wrap>
        <div ref="scrollstart" class="scroll-start" />
        <v-flex v-for="{ id, username, data, userid } in messages" :key="id" xs12>
          <div v-if="isMe(userid)">
            <v-layout align-center justify-end row fill-height>
              <div class="balloon-right">
                <p id="message-right">{{ data.value }}</p>
              </div>
            </v-layout>
          </div>
          <div v-else>
            <v-layout align-center justify-start row fill-height>
              <div class="balloon-left">
                <p id="message-left">{{ data.value }}</p>
              </div>
            </v-layout>
          </div>
        </v-flex>
        <div ref="scrollend" class="scroll-end" />
      </v-layout>
    </v-container>
  </div>
</template>

<script>
import store from '../store'

export default {
  name: 'MessageList',
  data () {
    return {
      messages: []
    }
  },
  created () {
    store.dispatch('getMessages', store.state.main.input.room).then(() => { });
    
    const unwatch = store.watch(
      state => store.state.main.messages,
      messages => {
        this.messages = store.state.main.messages;
        this.$nextTick(this.scrollToBottom);
      }
    )
  },
  methods: {
    isMe: function (userid) {
      return store.state.main.input.user.id == userid;
    },
    scrollToTop: function () {
      var el = document.querySelector('.scroll-y');
      if (el === undefined || el === null) return;
      el.scrollTop = 0;
    },
    scrollToBottom: function () {
      var el = document.querySelector('.scroll-y');
      if (el === undefined || el === null) return;
      el.scrollTop = el.scrollHeight;
    },
  },
}
</script>

<style scoped>
#message-left {
  text-align: right;
  white-space:pre-wrap;
  word-wrap:break-word;
}
.balloon-left {
  position: relative;
  display: inline-block;
  margin: 1.5em 0 1.5em 15px;
  padding: 7px 10px;
  min-width: 120px;
  max-width: 100%;
  color: #555;
  font-size: 16px;
  background: #e0edff;
}

.balloon-left:before {
  content: "";
  position: absolute;
  top: 50%;
  left: -30px;
  margin-top: -15px;
  border: 15px solid transparent;
  border-right: 15px solid #e0edff;
}

.balloon-left p {
  margin: 0;
  padding: 0;
}

#message-right {
  text-align: left;
  white-space:pre-wrap;
  word-wrap:break-word;
}
.balloon-right {
  position: relative;
  display: inline-block;
  margin: 1.5em 15px 1.5em 0;
  padding: 7px 10px;
  min-width: 120px;
  max-width: 100%;
  color: #555;
  font-size: 16px;
  background: #e0ffe7;
}

.balloon-right:before {
  content: "";
  position: absolute;
  top: 50%;
  left: 100%;
  margin-top: -15px;
  border: 15px solid transparent;
  border-left: 15px solid #e0ffe7;
}

.balloon-right p {
  margin: 0;
  padding: 0;
}
</style>