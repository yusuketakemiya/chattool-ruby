module Api
  class MessageController < ApplicationController
    # GET /message
    def index
      p 'index'
      p request.query_parameters
      roomid = request.query_parameters['id']
      datas = []
      Message.where(roomid: roomid).each do |message|
        p message
        datas.push(convert(message))
      end
      render :json => datas
    end

    # POST /message
    def create
      data = JSON.parse(request.body.read)
      uuid = SecureRandom.random_number(1 << 16)

      message = Message.new
      message.roomid = data['room']['id']
      message.uuid = uuid
      message.userid = data['user']['id']
      message.username = data['user']['name']
      message.message = data['message']
      message.save

      data['id'] = message.id
      data['uuid'] = message.uuid
      p 'create id'
      p data['id']
      render :json => convert(message)
    end

    def convert(message)
      { id: message.id, uuid: message.uuid, message: message.message, user: { id: message.userid, name: message.username }, room: { id: message.roomid } }
    end
  end
end
