<template>
  <div id="app">
    <v-app id="appMain">
      <v-toolbar id="header">
        <v-toolbar-title>Chat</v-toolbar-title>
        <v-spacer></v-spacer>
        <v-toolbar-items class="hidden-sm-and-down">
          <v-btn flat v-if="isChat" v-on:click="back">Back</v-btn>
        </v-toolbar-items>
      </v-toolbar>
      <main>
        <router-view/>
      </main>
      <v-footer
        white
        height="auto"
        app
      >
        <v-card class="flex">
          <!-- <v-card-text v-if=isChat>
            <message-input id="input" />
          </v-card-text> -->
          <v-card-actions class="grey justify-center">
            &copy;2019 — <strong>Upstairs</strong>
          </v-card-actions>
         </v-card>
      </v-footer>
    </v-app>
  </div>
</template>

<script>
export default {
  name: 'App',
  data () {
    return {
    }
  },
  methods: {
    back: function() {
        this.$store.commit('setModeIsLogin');
        this.$router.push('/');
    }
  },
  computed: {
    isChat: {
      get () { return this.$store.state.main.mode === 'chat'; }
      //get () { return true }
    },
  }
}
</script>

<style scoped>
#header {
  position: sticky;
  top: 0;
  left: 0;
  z-index: 999;
}	
</style>
