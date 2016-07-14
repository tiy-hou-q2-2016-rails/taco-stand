class TacosController < ApplicationController

  before_action except: :show do
    if @current_user.nil?
      redirect_to sign_in_path, alert: "Please Sign In"
    end
  end

  def feed
    @tacos = @current_user.timeline
  end

  def show
    @taco = Taco.find_by id: params[:id]
  end

  def new
    @taco = Taco.new
    @taco.country = "USA"
  end



  def create
    @taco = Taco.new
    @taco.name = params[:taco][:name]
    @taco.price = params[:taco][:price]
    @taco.photo_url = params[:taco][:photo_url]
    @taco.address_line_1 = params[:taco][:address_line_1]
    @taco.city = params[:taco][:city]
    @taco.state = params[:taco][:state]
    @taco.zip = params[:taco][:zip]
    @taco.country = params[:taco][:country]
    @taco.user = @current_user
    @taco = geocode_taco(@taco)

    if @taco.save
      redirect_to root_path, notice: "Taco Created!"
    else
      render :new
    end
  end

  def edit
    @taco = Taco.find_by id: params[:id]
  end

  def update
    @taco = Taco.find_by id: params[:id]
    @taco.name = params[:taco][:name]
    @taco.price = params[:taco][:price]
    @taco.photo_url = params[:taco][:photo_url]
    @taco.address_line_1 = params[:taco][:address_line_1]
    @taco.city = params[:taco][:city]
    @taco.state = params[:taco][:state]
    @taco.zip = params[:taco][:zip]
    @taco.country = params[:taco][:country]
    @taco = geocode_taco(@taco)


    if @taco.save
      redirect_to root_path, notice: "Taco Updated!"
    else
      render :edit
    end

  end

  def delete
    @taco = Taco.find_by id: params[:id]
    @taco.destroy
    redirect_to root_path, notice: "Taco Obliterated!"
  end

  def geocode_taco(taco)

    response = Http.get("http://locationiq.org/v1/search.php?key=0b4689b45e47c896480d&format=json&q=#{@taco.full_address}")
    results = JSON.parse(response.body)


    taco.latitude = results.first["lat"]
    taco.longitude = results.first["lon"]
    taco
  end
end
