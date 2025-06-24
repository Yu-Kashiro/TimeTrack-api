class WorkTimesController < ApplicationController
  before_action :authenticate_user!

  def index
    work_times = current_user.work_times.order(:work_date)
    render json: work_times, status: :ok
  end

  def create
    work_times = current_user.work_times.build(work_time_params)

    if params[:work_time][:break_duration].present?
      work_times.break_duration_minute = params[:work_time][:break_duration]
        .split(':').map(&:to_i).then { |h, m| h * 60 + m }
    else
      work_times.break_duration_minute = 0
    end

    if params[:work_time][:clock_in].present? && params[:work_time][:clock_out].present?
      work_times.clock_in = Time.parse(params[:work_time][:clock_in])
      work_times.clock_out = Time.parse(params[:work_time][:clock_out])
      work_times.work_minute = ((work_times.clock_out - work_times.clock_in) / 60).to_i - work_times.break_duration_minute
    else
      work_times.clock_in = nil
      work_times.clock_out = nil
      work_times.work_minute = 0
    end

    if work_times.save
      render json: work_times, status: :created
    else
      render json: { errors: work_times.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    work_times = current_user.work_times.find_by(id: params[:id])

    if params[:work_time][:break_duration].present?
      work_times.break_duration_minute = params[:work_time][:break_duration]
        .split(':').map(&:to_i).then { |h, m| h * 60 + m }
    else
      work_times.break_duration_minute = 0
    end

    if params[:work_time][:clock_in].present? && params[:work_time][:clock_out].present?
      work_times.clock_in = Time.parse(params[:work_time][:clock_in])
      work_times.clock_out = Time.parse(params[:work_time][:clock_out])
      work_times.work_minute = ((work_times.clock_out - work_times.clock_in) / 60).to_i - work_times.break_duration_minute
    else
      work_times.clock_in = nil
      work_times.clock_out = nil
      work_times.work_minute = 0
    end

    if work_times.update(work_time_params)
      render json: work_times, status: :ok
    else
      render json: { errors: work_times.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    work_times = current_user.work_times.find_by(id: params[:id])
    if work_times
      render json: work_times, status: :ok
    else
      render json: { error: 'Work times not found' }, status: :not_found
    end
  end

  def destroy
    work_times = current_user.work_times.find_by(id: params[:id])
    if work_times
      work_times.destroy
      head :no_content
    else
      render json: { error: 'Work times not found' }, status: :not_found
    end
  end

  private
  def work_time_params
    params.require(:work_time).permit(
      :work_date,
      :note,
      :is_paid_holiday
    )
  end
end
