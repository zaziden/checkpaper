class ShiftListsController < ApplicationController
  before_action :set_q2, only: [:index, :search]

  def index
    @staff = Staff.where(user_id: current_user.id)
  end

  def search
    @results = @q.result.where(user_id: current_user.id)
  end

  private

  def set_q2
    @q = Shift.ransack(params[:q])
  end
end
