class MenusController < ApplicationController
  def index
    @menu = Menu.new
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to menus_path(current_user.id)
    else
      render :index
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:menu_name, :price).merge(user_id: current_user.id)
  end
end
