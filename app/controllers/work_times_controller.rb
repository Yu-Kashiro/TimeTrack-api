class WorkTimesController < ApplicationController
  before_action :authenticate_user!

  def index
    work_times = current_user.work_times
    render json: work_times
  end

  def create
    work_time = current_user.work_times.create!(work_time_params)
    render json: work_time
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors }, status: :unprocessable_entity
  end

  def update
    work_time = current_user.work_times.find_by(id: params[:id])

    if work_time.update(work_time_params)
      render json: work_time
    else
      render json: { errors: work_time.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def work_time_params
    params.require(:work_time).permit(
      :work_date,
      :clock_in,
      :clock_out,
      :work_minute,
      :break_duration_minute,
      :note,
      :approved,
      :approved_by_id
    )
  end
end
