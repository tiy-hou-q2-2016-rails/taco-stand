class UsersController < ApplicationController

  def index
    @users = User.where("id != ?", @current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.username = params[:user][:username]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      # we should also sign them in
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome!"
    else
      render :new
    end
  end

  def following
    @users = @current_user.following_users
  end

  def follow
    # do the thing
    user = User.find_by! id: params[:user_id]
    @current_user.follow(user)
    redirect_to users_path, notice: "✅✅"
  end

  def unfollow
    user = User.find_by! id: params[:user_id]
    @current_user.stop_following(user)
    redirect_to users_path, notice: "👻👻"
  end
end
