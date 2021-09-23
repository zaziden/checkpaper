class ChecksController < ApplicationController

  def index
    @allsale = Allsale.new
    @check = Check.new
    @menus = Menu.where(user_id: current_user.id)
    @guest = Guest.where(user_id: current_user.id)
    @staff = Staff.where(user_id: current_user.id)
    @checkrooms = Checkroom.find(params[:checkroom_id])
    @checks = @checkrooms.checks.includes(:user)
    @allsales = Check.where(checkroom_id: params[:checkroom_id]).sum(:menuallprice)
    unless current_user.id == @checkrooms.user_id
      redirect_to root_path(current_user.id)
    end
  end

  def create
    @checkrooms = Checkroom.find(params[:checkroom_id])
    @check = @checkrooms.checks.new(check_params)
    if @check.save
      redirect_to checkroom_checks_path(@checkrooms)
    else
      flash[:notice] = "入力項目が不足しています"
      @checks = @checkrooms.checks.includes(:user)
      render :index
    end
  end

  private

  def check_params
    params.require(:check).permit(:menuname, :menuprice, :menuallprice, :cup).merge(user_id: current_user.id)
  end

end
