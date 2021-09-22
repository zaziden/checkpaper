class AllsalesController < ApplicationController
  before_action :set_q, only: [:index, :search]
  
  def index
    @allsale = Allsale.with_deleted.where(user_id: current_user.id).sum(:allprice)
    @staff = Staff.where(user_id: current_user.id)
  end

  def new
    @allsale = Allsale.new
    @checkrooms = Checkroom.find(params[:checkroom_id])
  end

  def create
    @checkrooms = Checkroom.find(params[:checkroom_id])
    @allsale = Allsale.new(allsale_params)
    if @allsale.save
      flash[:notice] = "会計を保存しました。伝表を削除して下さい。"
      redirect_to checkroom_checks_path(@checkrooms)
    else
      @checks = @checkrooms.checks.includes(:user)
      flash[:notice] = "保存できませんでした"
      redirect_to checkroom_checks_path(@checkrooms)
    end
  end

  def search
    @results = @q.result.where(user_id: current_user.id)
  end

  private

  def set_q
    @q = Allsale.with_deleted.ransack(params[:q])
  end

  def allsale_params
    params.require(:allsale).permit(:allprice).merge(user_id: current_user.id, checkroom_id: @checkrooms.id, checkstaff: @checkrooms.staff_name)
  end
end
