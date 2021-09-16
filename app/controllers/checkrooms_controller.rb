class CheckroomsController < ApplicationController
  def index
    @checkroom = Checkroom.new
    @guest = Guest.where(user_id: current_user.id)
    @staff = Staff.where(user_id: current_user.id)
  end

  def new
    @checkroom = Checkroom.new
  end

  def create
    @checkroom = Checkroom.new(checkroom_params)
    if @checkroom.save
      flash[:notice] = "伝票を作成しました"
      redirect_to checkrooms_path(current_user.id)
    else
      render :index
    end
  end

  def destroy
    checkroom = Checkroom.find(params[:id])
    checkroom.destroy
    flash[:notice] = "伝票を削除しました"
    redirect_to checkrooms_path(current_user.id)
  end

  private

  def checkroom_params
    params.require(:checkroom).permit(:room_name, :how_many, :staff_name).merge(user_id: current_user.id)
  end
end
