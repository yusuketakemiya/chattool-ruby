export default {
  // setInput (state, input) {
  //   state.main.input = input;
  // },
  setInputUserName (state, name) {
    state.main.input.user.name = name;
  },
  setInputUserId (state, id) {
    state.main.input.user.id = id;
  },
  setInputText (state, text) {
    state.main.input.data.value = text;
    state.main.input.data.type = 'string';
  },
  setInputImage (state, image) {
    state.main.input.data.value = image;
    state.main.input.data.type = 'image';
  },
  setRoomId (state, id) {
    state.main.input.room.id = id;
  },
  setModeIsChat (state) {
    state.main.mode = 'chat';
  },
  setModeIsLogin (state) {
    state.main.mode = 'login';
  },
  pushMessage (state, message) {
    state.main.messages.push(message);
  },
  setMessages (state, messages) {
    state.main.messages = messages;
  },
  setMessage (state, message) {
    state.main.message = message;
  },
}
