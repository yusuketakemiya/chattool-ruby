import axios from 'axios'
const token = document.getElementsByName("csrf-token")[0].getAttribute("content");
axios.defaults.headers.common["X-CSRF-Token"] = token;

export default {
  async getMessages ({ commit }, room) {
    await axios.get('/api/message', {
      params: {
        id: room.id
      }})
    .then((res) => {
      commit('pushMessages', res.data);
    }).catch(error => {
      console.log(error);
    });
  },
  async submitMessage ({ commit }, input) {
    await axios.post('/api/message', input)
    .then((res) => {
      commit('setInput', res.data);
    }).catch(error => {
      console.log(error);
    });
  },
  async submitRoomId ({ commit }, roomid) {
    await axios.post('/api/room', roomid)
    .then((res) => {
      commit('setRoomId', res.data.room.id);
    }).catch(error => {
      console.log(error);
    });
  },
  async getUserId ({ commit }) {
    await axios.get('/api/user')
    .then((res) => {
      commit('setInputUserId', res.data.user.id);
    }).catch(error => {
      console.log(error);
    });
  },
}
