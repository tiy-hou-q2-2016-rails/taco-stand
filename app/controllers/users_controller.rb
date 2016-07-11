class UsersController < ApplicationController

  def index
    @users = User.where("id != ?", @current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      # we should also sign them in
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Signed in! Welcome!"
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

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
