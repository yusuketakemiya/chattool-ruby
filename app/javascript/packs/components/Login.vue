<template>
  <div class="login">
    <v-content>
      <v-container fluid fill-height>
        <v-flex xs12 sm6 offset-sm3>
          <v-card>
            <v-card-text>
              <v-text-field
                label="User Name."
                single-line
                solo
                name="name"
                v-model="username"
              ></v-text-field>
              <v-text-field
                label="Room Id."
                single-line
                solo
                name="roomid"
                v-model="roomid"
              ></v-text-field>
            </v-card-text>
            <v-card-actions class="justify-center">
              <v-btn round color="primary" dark v-on:click="chatStart">Chat Start</v-btn>
            </v-card-actions>
          </v-card>
        </v-flex>
      </v-container>
    </v-content>
  </div>
</template>

<script>
import store from '../store'

export default {
  name: 'Login',
  data () {
    return {
    }
  },
  methods: {
    chatStart : function () {
      store.dispatch('getUserId').then(() => {
        store.dispatch('submitRoomId', store.state.main.input.room).then(() => {
          store.commit('setModeIsChat');
          this.$router.push('main');
        })
      })
    }
  },
  computed: {
    username: {
      get () { return store.state.main.input.user.name; },
      set (val) { store.commit('setInputUserName', val); },
    },
    roomid: {
      get () { return store.state.main.input.room.id; },
      set (val) { store.commit('setRoomId', val); },
    },
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
