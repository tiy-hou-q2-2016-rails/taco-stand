class TacosController < ApplicationController
  def show
    @taco = Taco.find_by id: params[:id]
  end

  def new
    @taco = Taco.new
  end

  def create
    @taco = Taco.new
    @taco.name = params[:taco][:name]
    @taco.price = params[:taco][:price]
    @taco.photo_url = params[:taco][:photo_url]
    if @taco.save
      redirect_to root_path, notice: "Taco Created!"
    else
      render :new
    end
  end

  def delete
    @taco = Taco.find_by id: params[:id]
    @taco.destroy
    redirect_to root_path, notice: "Taco Obliterated!"
  end
end
