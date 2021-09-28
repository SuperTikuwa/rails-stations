class SchedulesController < ApplicationController
  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to admin_movies_path
    end
  end

  def destroy
    schedule = Schedule.find(params[:id])

    if schedule.nil?
      render :edit, status: :bad_request
    else
      schedule.destroy
      redirect_to admin_movies_path
    end
  end

  private

  def schedule_params
    if params[:schedule].present?
      params.require(:schedule).permit(:movie_id, :start_time, :end_time)
    end
  end
end
