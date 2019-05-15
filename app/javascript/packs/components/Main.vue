<template>
  <div class="main">
    <message-list />
    <message-input id="input" />
  </div>
</template>

<script>
export default {
  name: 'Main',
  data () {
    return {
    }
  },
  created () {
    if (this.isChat) return;
    this.$store.commit('setModeIsLogin');
    this.$router.push('/');
  },
  computed: {
      isChat: {
        get () { return this.$store.state.main.mode === 'chat'; }
        //get () { return true }
      },
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
