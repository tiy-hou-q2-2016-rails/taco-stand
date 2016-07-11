class TacosController < ApplicationController

  before_action except: :show do
    if @current_user.nil?
      redirect_to sign_in_path, alert: "Please Sign In"
    end
  end

  def feed
    @tacos = @current_user.timeline
  end

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
    @taco.user = @current_user

    if @taco.save
      redirect_to root_path, notice: "Taco Created!"
    else
      render :new
    end
  end

  def edit
    @taco = Taco.find_by id: params[:id]
  end

  def update
    @taco = Taco.find_by id: params[:id]
    @taco.name = params[:taco][:name]
    @taco.price = params[:taco][:price]
    @taco.photo_url = params[:taco][:photo_url]
    if @taco.save
      redirect_to root_path, notice: "Taco Updated!"
    else
      render :edit
    end

  end

  def destroy
    @taco = Taco.find_by id: params[:id]
    @taco.destroy
    redirect_to root_path, notice: "Taco Obliterated!"
  end
end
