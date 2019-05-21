require 'securerandom'

class Api::TestController < ApplicationController
  # GET /test
  def index
    p 'index'
    datas = []
    datas.push({
      'id': SecureRandom.hex(8),
      'name': 'taro',
      'message': 'こんにちは'
    },
    {
      'id': SecureRandom.hex(8),
      'name': 'jio',
      'message': 'こんにちは'
    },
    {
      'id': SecureRandom.hex(8),
      'name': 'taro',
      'message': 'お�E気ですか�E�E
    },
    {
      'id': SecureRandom.hex(8),
      'name': 'jio',
      'message': '允E��です、E
    },
    {
      'id': SecureRandom.hex(8),
      'name': 'taro',
      'message': 'それはなにより'
    },
    {
      'id': SecureRandom.hex(8),
      'name': 'jio',
      'message': 'そちら�Eお�E気ですか�E�E
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
