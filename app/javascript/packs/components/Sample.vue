<template>
  <div class="sample">
    <v-layout column justify-center align-center>
      <v-subheader>Offset Top</v-subheader>
      {{ offsetTop }}
    </v-layout>
    <v-container
      id="scroll-target"
      style="max-height: 400px"
      class="scroll-y"
    >
      <v-layout
        v-scroll:#scroll-target="onScroll"
        column
        align-center
        justify-center
        
      >
        <v-flex v-for="i in 12" :key="`1${i}`" xs1>
          <v-layout align-center justify-end row fill-height>
            <div class="balloon-right">
              <p id="message-right"> test </p>
            </div>
          </v-layout>
        </v-flex>
      </v-layout>
    </v-container>
    <message-input id="input" />
  </div>
</template>

<script>
  export default {
  name: 'Sample',
  data () {
    return {
      offsetTop: 0
    }
  },
    methods: {
      onScroll (e) {
        this.offsetTop = e.target.scrollTop
      }
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
