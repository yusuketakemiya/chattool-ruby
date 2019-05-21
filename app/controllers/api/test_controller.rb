require 'securerandom'

class Api::TestController < ApplicationController
  # GET /test
  def index
    p 'index'
    datas = []
    datas.push({
      'id': SecureRandom.hex(8),
      'name': 'taro',
      'message': '縺薙ｓ縺ｫ縺｡縺ｯ'
    },
    {
      'id': SecureRandom.hex(8),
      'name': 'jio',
      'message': '縺薙ｓ縺ｫ縺｡縺ｯ'
    },
    {
      'id': SecureRandom.hex(8),
      'name': 'taro',
      'message': '縺雁・豌励〒縺吶°・・
    },
    {
      'id': SecureRandom.hex(8),
      'name': 'jio',
      'message': '蜈・ｰ励〒縺吶・
    },
    {
      'id': SecureRandom.hex(8),
      'name': 'taro',
      'message': '縺昴ｌ縺ｯ縺ｪ縺ｫ繧医ｊ'
    },
    {
      'id': SecureRandom.hex(8),
      'name': 'jio',
      'message': '縺昴■繧峨・縺雁・豌励〒縺吶°・・
    })
    render :json => datas
  end

  # POST /test
  def create
    p 'create'
    data = JSON.parse(request.body.read)
    p data
    p '-----------------'
    data['id'] = SecureRandom.hex(8)
    p data
    p '-----------------'
    render :json => data
  end

  # PATCH/PUT /test/1
  def update
    # test = @tests.find(params[:id])
    # test_param = test_params
    # test.name = test_param.name
    # test.is_bool = test_param.is_bool
    # @tests.replace(test)
    render :show, status: :ok
  end

  # private

  #   def input_params
  #     params.fetch(:input, {}).permit(
  #         :name, :messege
  #     )
  #   end
end
