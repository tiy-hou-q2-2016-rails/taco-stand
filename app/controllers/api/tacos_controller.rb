class Api::TacosController < ApplicationController
  before_action :doorkeeper_authorize!

  before_action do
    request.format = :json
  end

  protect_from_forgery with: :null_session

  def index
    q = Taco.all
    q = q.where("name ILIKE ?", "%#{params[:query]}%") if params[:query].present?
    q = q.where("price >= ?", params[:price_min].to_f) if params[:price_min].present?
    q = q.where("price <= ?", params[:price_max].to_f) if params[:price_max].present?
    @tacos = q
    # render json: @tacos
  end

  def show
    @taco = Taco.find_by id: params[:id]
    # render json: @taco
  end

  def create
    @taco = Taco.new
    @taco.name = params[:taco][:name]
    @taco.price = params[:taco][:price]
    @taco.photo_url = params[:taco][:photo_url]
    @taco.user = current_user
    if @taco.save
      render :show, status: 201 #created
    else
      render json: {errors: @taco.errors}, status: 422 #error
    end
  end

  def delete
    @taco = Taco.find_by id: params[:id]
    @taco.destroy
    render json: {ok: true}, status: 200
  end


  def current_user
    if doorkeeper_token
      User.find_by id: doorkeeper_token.resource_owner_id
    end
  end
end
