class TacosController < ApplicationController

  before_action except: :show do
    if session[:username].nil?
      redirect_to sign_in_path, notice: "SIGN IN YO"
    end
  end

  def show
    @taco = Taco.find_by id: params[:id]
  end

  def new
    @taco = Taco.new
  end

  def create
    user = User.find_by username: session[:username]
    @taco = Taco.new
    @taco.name = params[:taco][:name]
    @taco.price = params[:taco][:price]
    @taco.photo_url = params[:taco][:photo_url]
    @taco.user = user

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

  def delete
    @taco = Taco.find_by id: params[:id]
    @taco.destroy
    redirect_to root_path, notice: "Taco Obliterated!"
  end
end
