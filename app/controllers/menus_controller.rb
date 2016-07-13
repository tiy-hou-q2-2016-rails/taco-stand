class MenusController < ApplicationController

  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find_by id: params[:id]
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new menu_params
    if @menu.save
      redirect_to menu_path(id: @menu.id)
    else
      render :new
    end
  end

  def menu_params
    params.require(:menu).permit(:name, :pdf_file)
  end
end
