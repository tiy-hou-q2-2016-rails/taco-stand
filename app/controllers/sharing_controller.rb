class SharingController < ApplicationController
  def new
    @taco = Taco.find_by id: params[:taco_id]
  end

  def create
    @taco = Taco.find_by id: params[:taco_id]
    email = params[:email]

    if email.present?
      ShareMailer.share_taco(email, @taco).deliver_now
      redirect_to thanks_for_sharing_path, notice: "Thanks for sharing!"
    else
      flash.now[:alert] = "Please enter a valid email"
      render :new
    end
  end

  def thanks
  end
end
