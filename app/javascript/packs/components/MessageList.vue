<template>
  <div class="messagelist">
    <v-container grid-list-md text-xs-center>
      <v-layout row wrap>
        <v-flex v-for="{ id, username, message, userid } in messages" :key="id" class="item" xs12>
          <div v-if="isMe(userid)">
            <v-layout align-center justify-end row fill-height>
              <div class="balloon-right">
                <p id="message-right"> {{ message }} </p>
              </div>
            </v-layout>
          </div>
          <div v-else>
            <v-layout align-center justify-start row fill-height>
              <div class="balloon-left">
                <p id="message-left"> {{ message }} </p>
              </div>
            </v-layout>
          </div>
        </v-flex>
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
    }
  },
  created () {
    this.load();
  },
  methods: {
    load: function () {
      store.dispatch('getMessages', store.state.main.input.room).then(() => { });
    },
    isMe: function (userid) {
      return store.state.main.input.user.id == userid;
    }
  },
  computed: {
      messages: {
        get () { 
            var ret = [];
            store.state.main.messages.forEach(function(message) {
              ret.push({ id: message.id, username: message.user.name, message: message.message, userid: message.user.id });
            })
            return ret;
          }
      },
  }
}
</script>

<style scoped>
#message-right {
  text-align: left;
  white-space:pre-wrap;
  word-wrap:break-word;
}
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