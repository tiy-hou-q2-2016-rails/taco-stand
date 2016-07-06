class Api::TacosController < ApplicationController

  before_action do
    request.format = :json
  end

  def index
    @tacos = Taco.all
    # render json: @tacos
  end

  def show
    @taco = Taco.find_by id: params[:id]
    # render json: @taco
  end
end
