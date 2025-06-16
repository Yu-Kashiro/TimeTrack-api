class WorkTimesController < ApplicationController
  before_action :authenticate_user!

  def index
    work_times = current_user.work_times
    render json: work_times, status: :ok
  end

  def create
    work_times = current_user.work_times.build(work_time_params)
    work_times.break_duration_minute = params[:break_duration_minute].split(':').map(&:to_i).then { |hours, minutes| hours * 60 + minutes }

    if params[:clock_in].present? && params[:clock_out].present?
      clock_in = Time.parse(params[:clock_in])
      clock_out = Time.parse(params[:clock_out])
      work_times.work_minute = ((clock_out - clock_in) / 60).to_i - work_times.break_duration_minute
    end

    if work_times.save
      render json: work_times, status: :created
    else
      render json: { errors: work_times.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    work_time = current_user.work_times.find_by(id: params[:id])

    if work_time.update(work_time_params)
      render json: work_time
    else
      render json: { errors: work_time.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    work_time = current_user.work_times.find_by(id: params[:id])
    if work_time
      render json: work_time
    else
      render json: { error: 'Work times not found' }, status: :not_found
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
      :approved_by_id,
      :overtime_work_minute,
      :id_paid_holiday
    )
  end
end
