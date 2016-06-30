class SessionsController < ApplicationController

  def new
  end

  def create

    user = User.find_by username: params[:username]
    if user && user.authenticate(params[:password])
      # make session[:username] present
      session[:user_id] = user.id
      redirect_to root_path, notice: "Signed in!"
    else
      flash.now[:alert] = "Something is wrong with your username and/or password"
      render :new
    end
  end

  def delete
    # we should sign out
    # make future tests if we are signed in fail
    session.delete :user_id
    redirect_to root_path, notice: "Signed Out!"
  end
end
