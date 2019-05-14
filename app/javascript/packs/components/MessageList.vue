<template>
  <div class="messagelist">
    <transition-group name="chat" tag="div" class="list content">
      <div v-for="{ id, username, message, userid } in messages" :key="id" class="item">
        <div class="item-detail">
          <div v-if="isMe(userid)">
            <v-card>
              <div class="balloon-right">
                <!-- <h3 class="headline mb-0">{{ username }}</h3> -->
                <p> {{ message }} </p>
              </div>
            </v-card>
          </div>
          <div v-else>
            <v-card>
              <div class="balloon-left">
                <!-- <h3 class="headline mb-0">{{ username }}</h3> -->
                <p> {{ message }} </p>
              </div>
            </v-card>
          </div>
        </div>
      </div>
    </transition-group>
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
    this.load()
  },
  methods: {
    load: function () {
      store.dispatch('getMessages', store.state.main.input.room).then(() => { })
    },
    isMe: function (userid) {
      return store.state.main.input.user.id == userid
    }
  },
  computed: {
      messages: {
        get () { 
            var ret = []
            store.state.main.messages.forEach(function(message) {
              ret.push({ id: message.id, username: message.user.name, message: message.message, userid: message.user.id })
            })
            return ret
          }
      },
  }
}
</script>

<style scoped>
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