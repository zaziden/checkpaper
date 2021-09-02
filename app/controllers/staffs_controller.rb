class StaffsController < ApplicationController
  def index
    @staff = Staff.new
  end

  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      flash[:notice] = "スタッフを登録しました"
      redirect_to staffs_path(current_user.id)
    else
      render :index
    end
  end

  private

  def staff_params
    params.require(:staff).permit(:nickname).merge(user_id: current_user.id)
  end
end
