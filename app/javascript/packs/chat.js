import ActionCable from 'actioncable';

const uri = 'ws://localhost:3000/cable';
const channelName = 'ChatChannel';

export default {
    cable: null,
    channel: null,
    connect: function(roomId, callback) {
        this.disconnect();
        this.cable = ActionCable.createConsumer(uri);
        this.channel = this.cable.subscriptions.create( { channel: channelName, room: roomId },{
          received: (data) => {
              if(callback === undefined || callback === null) return;
              callback(data);
          },
        })
    },
    disconnect: function() {
        if(this.cable === undefined || this.cable === null) return;
        this.cable.disconnect();
    },
    send: function(data) {
        if(this.channel === undefined || this.channel === null) return;
        this.channel.perform('speak', { 
            message: data, 
        });
    },
}