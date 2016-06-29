class SessionsController < ApplicationController

  def new
  end

  def create

    username = params[:username]
    password = params[:password]

    # if username is jwo and password is 12345678
    if (username == "jwo") && (password == "12345678")
      # make session[:username] present
      session[:username] = username
      redirect_to root_path, notice: "Signed in!"
    else
      render :new
    end
  end
end
