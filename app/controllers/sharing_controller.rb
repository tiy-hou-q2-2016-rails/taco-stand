class SharingController < ApplicationController
  def new
    @taco = Taco.find_by id: params[:taco_id]
  end

  def create
    @taco = Taco.find_by id: params[:taco_id]
    email = params[:email]

    if email.present?
      ShareMailer.share_taco(email, @taco).deliver_now
      render :new
    else
      flash.now[:alert] = "Please enter a valid email"
      render :new
    end
  end
end
