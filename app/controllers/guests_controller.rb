class GuestsController < ApplicationController
  def index
    @guest = Guest.new
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      flash[:notice] = "ゲストを登録しました"
      redirect_to guests_path(current_user.id)
    else
      render :index
    end
  end

  private

  def guest_params
    params.require(:guest).permit(:guest_name, :gender).merge(user_id: current_user.id)
  end
end
