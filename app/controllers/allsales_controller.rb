class AllsalesController < ApplicationController
  def index
  end
  
  def new
    @allsale = Allsale.new
    @checkrooms = Checkroom.find(params[:checkroom_id])
  end

  def create
    @checkrooms = Checkroom.find(params[:checkroom_id])
    @allsale = Allsale.new(allsale_params)
    if @allsale.save
      flash[:notice] = "会計を保存しました"
      redirect_to checkroom_checks_path(@checkrooms)
    else
      @checks = @checkroom.checks.includes(:user)
      redirect_to checkroom_checks_path(@checkroom)
    end
  end

  private
  def allsale_params
    params.require(:allsale).permit(:allprice).merge(user_id: current_user.id, checkroom_id: @checkrooms.id)
  end
end
