class Api::RegistrationController < ApplicationController

  before_action do
    request.format = :json
  end

  protect_from_forgery with: :null_session
  
  def create
    @user = User.new
    @user.username = params[:user][:username]
    @user.password = params[:user][:password]
    if @user.save
      render json: @user, status: 201
    else
      render json: {errors: @user.errors}, status: 422
    end
  end
end
