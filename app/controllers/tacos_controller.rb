class TacosController < ApplicationController
  def show
    @taco = Taco.find_by id: params[:id]
  end
end
