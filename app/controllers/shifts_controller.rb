class ShiftsController < ApplicationController
  def index
    @shift = Shift.new
    @staff = Staff.where(user_id: current_user.id)
  end

  def create
    @staff = Staff.where(user_id: current_user.id)
    @shift = Shift.new(shift_params)
    if @shift.save
      redirect_to shifts_path(current_user)
    else
      flash[:notice] = "スタッフを選択してください"
      render :index
    end
  end

  def edit
    @shift = current_user.shifts.find(params[:id])
    @staff = Staff.where(user_id: current_user.id)
  end

  def update
    @shift = current_user.shifts.find(params[:id])
    if params['update']
      @staff = Staff.where(user_id: current_user.id)
      @shift.update(shift_params)
      flash[:notice] = "修正内容を登録しました"
      redirect_to edit_shift_path(@shift.id)
    else params['退勤']
      @shift.update(stop_time: Time.now)
      flash[:notice] = "退勤時間#{Time.now.strftime('%H:%M')}登録完了"
      redirect_to shifts_path(current_user)
    end
  end

  def destroy
    shift = current_user.shifts.find(params[:id])
    shift.destroy
    flash[:notice] = "出勤を取り消しました"
    redirect_to shifts_path(current_user.id)
  end
 

  private
  def shift_params
    params.require(:shift).permit(:shift_staff, :start_time, :stop_time).merge(user_id: current_user.id)
  end
end