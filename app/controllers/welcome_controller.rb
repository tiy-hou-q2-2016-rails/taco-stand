class WelcomeController < ApplicationController
  def homepage
    q = Taco.all
    q = q.where("name ILIKE ?", "%#{params[:query]}%") if params[:query].present?
    q = q.where("price >= ?", params[:price_min].to_f) if params[:price_min].present?
    q = q.where("price <= ?", params[:price_max].to_f) if params[:price_max].present?
    @tacos = q
  end
end
