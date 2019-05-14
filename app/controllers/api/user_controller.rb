module Api
  class UserController < ApplicationController
    # GET /user
    def index
      userid = SecureRandom.random_number(1 << 16)
      ret = { user: { id: userid } }
      render :json => ret
    end
  end
end
