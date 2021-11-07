class AllsalesController < ApplicationController
  before_action :set_q, only: [:index, :search]
  before_action :checkrooms_find, only: [:new, :create]
  
  def index
    @allsale = Allsale.with_deleted.where(user_id: current_user.id)
    @staff = Staff.where(user_id: current_user.id)
    @guest = Guest.where(user_id: current_user.id)
  end

  def new
    @allsale = Allsale.new
  end

  def create
    @allsale = Allsale.new(allsale_params)
    if @allsale.save
      flash[:notice] = "会計を保存しました。伝表を削除して下さい。"
      redirect_to checkroom_checks_path(@checkrooms)
    else
      @checks = @checkrooms.checks.includes(:user)
      flash[:notice] = "保存済、もしくは保存できませんでした"
      redirect_to checkroom_checks_path(@checkrooms)
    end
  end

  def search
    @results = @q.result.where(user_id: current_user.id)
  end

  private

  def checkrooms_find
    @checkrooms = Checkroom.find(params[:checkroom_id])
  end

  def set_q
    @q = Allsale.with_deleted.ransack(params[:q])
  end

  def allsale_params
    params.require(:allsale).permit(:allprice, :payment).merge(user_id: current_user.id, checkroom_id: @checkrooms.id, checkstaff: @checkrooms.staff_name, checkguest: @checkrooms.room_name, howmany: @checkrooms.how_many)
  end
end
