module Api
  class MessageController < ApplicationController
    # GET /message
    def index
      roomid = request.query_parameters['id']
      datas = []
      Message.where(roomid: roomid).each do |message|
        datas.push(convert(message, Content.find(message.contentid)))
      end
      render :json => datas
    end

    # POST /message
    def create
      data = JSON.parse(request.body.read)


      content = Content.new
      content.ctype = data['data']['type']
      content.content = data['data']['value']
      content.save

      message = Message.new
      message.roomid = data['room']['id']
      message.contentid = content.id
      message.userid = data['user']['id']
      message.username = data['user']['name']
      message.save

      render :json => convert(message, content)
    end

    def convert(message, content)
      {
        id: message.id,
        userid: message.userid,
        username: message.username,
        data: { type: content.ctype, value: content.content }
      }
    end
  end
end
