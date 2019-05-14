module Api
  class RoomController < ApplicationController
    # GET /room
    def index
      datas = []
      Room.all.each do |room|
        datas.push(room.uuid)
      end
      render :json => datas
    end

    # POST /room
    def create
      data = JSON.parse(request.body.read)
      roomid = data['id']
      if roomid.blank?
        roomid = SecureRandom.random_number(1 << 16)
      end

      find = Room.find_by(uuid: roomid)
      if find != nil
        find.destroy!
      end
      room = Room.new
      room.uuid = roomid
      room.save
      ret = { room: { id: roomid } }
      render :json => ret
    end
  end
end
