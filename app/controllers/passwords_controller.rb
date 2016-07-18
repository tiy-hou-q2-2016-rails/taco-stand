class PasswordsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by email: params[:email]
    if @user
      @user.reset_password_token = SecureRandom.hex
      @user.reset_password_token_expiration = 24.hours.from_now
      @user.save
      # send the user a link
      PasswordMailer.reset_password(@user).deliver_now
    end
    flash.now[:notice] = "Check your email (if an account was found with that email address)"
    render :new

  end

  def reset
    @user = User.where(reset_password_token: params[:token]).where("reset_password_token_expiration >= ?", Time.now).first

    if @user.nil?
      redirect_to new_password_path, notice: "The link you clicked on has expired or is invalid. Please Try Again"
    end
  end

  def update
    @user = User.where(reset_password_token: params[:token]).where("reset_password_token_expiration >= ?", Time.now).first

    if params[:user][:password].blank?
      flash.now[:alert] = "Password is required"
      render :reset
      return
    end
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save

      @user.update(reset_password_token: nil, reset_password_token_expiration: nil)

      session[:user_id] = @user.id
      redirect_to root_path, notice: "Your password has been reset"
    else
      render :reset
    end
  end
end
