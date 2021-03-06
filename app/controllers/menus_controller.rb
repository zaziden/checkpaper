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
      flash[:notice] = "メニューを登録しました"
      redirect_to menus_path(current_user.id)
    else
      flash[:notice] = "入力項目の誤り、またはすでに登録されています"
      render :index
    end
  end

  def destroy
    menu = current_user.menus.find(params[:id])
    menu.destroy
    flash[:notice] = "メニューを削除しました"
    redirect_to menus_path(current_user.id)
  end

  private

  def menu_params
    params.require(:menu).permit(:menu_name, :price).merge(user_id: current_user.id)
  end
end
