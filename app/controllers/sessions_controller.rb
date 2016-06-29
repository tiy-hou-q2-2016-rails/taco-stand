class SessionsController < ApplicationController

  def new
  end

  def create

    username = params[:username]
    password = params[:password]

    user = User.find_by username: params[:username]
    if user && user.password == params[:password]
      # make session[:username] present
      session[:username] = username
      redirect_to root_path, notice: "Signed in!"
    else
      flash.now[:notice] = "Something is wrong with your username and/or password"
      render :new
    end
  end

  def delete
    # we should sign out
    # make future tests if we are signed in fail
    # session[:username] = nil
    session.delete :username
    redirect_to root_path, notice: "Signed Out!"
  end
end
