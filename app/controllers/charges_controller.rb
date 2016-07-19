require "stripe"

class ChargesController < ApplicationController

  rescue_from Stripe::CardError, with: :card_error

  def new
    @taco = Taco.find_by id: params[:taco_id]
  end

  def card_error
    @taco = Taco.find_by id: params[:taco_id]
    flash.now[:alert] = "Problem with Your Credit Card. Please try again or contact your bank"
    render :new
  end

  def create
    @taco = Taco.find_by id: params[:taco_id]

    # create a token

    Stripe.api_key = "sk_test_dERynGJcSVTYeR4jBuNK3rwC"


    result = Stripe::Token.create(
      :card => {
        :number => params[:credit_card],
        :exp_month => params[:credit_card_expiration_month],
        :exp_year => params[:credit_card_expiration_year],
        :cvc => params[:credit_card_cvc]
      },
    )

    token = result[:id]

    if token.present?
      # use token to charge the charge
      charge = Stripe::Charge.create(
        :amount => @taco.price_in_cents,
        :currency => "usd",
        :source => token,
        :description => "TacoStand: #{@taco.name}"
      )

      render json: charge

    else
      render :new
    end
  end
end
