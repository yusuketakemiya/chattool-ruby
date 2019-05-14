export default {
  setInputUserName (state, name) {
    state.main.input.user.name = name
  },
  setInputUserId (state, id) {
    state.main.input.user.id = id
  },
  setRoomId (state, id) {
    state.main.input.room.id = id
  },
  setModeIsChat (state) {
    state.main.mode = 'chat'
  },
  setModeIsLogin (state) {
    state.main.mode = 'login'
  },
  setInput (state, input) {
    state.main.input = input
  },
  setInputMessage (state, message) {
    state.main.input.message = message
  },
  pushMessage (state, message) {
    state.main.messages.push(message)
  },
  pushMessages (state, messages) {
    state.main.messages = messages
  },
}
