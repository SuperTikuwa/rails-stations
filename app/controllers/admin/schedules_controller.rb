class Admin::SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
    @schedule.movie_id = params[:id]
  end

  def create
    @schedule = Schedule.new(schedule_params)
    logger.debug @schedule.start_time
    logger.debug schedule_params
    if @schedule.save
      redirect_to "/admin/movies/#{params[:id]}"
    else
      render :new, status: :ok
    end
  end

  private

  def schedule_params
    if params[:schedule].present?
      params.require(:schedule).permit(:movie_id, :start_time, :end_time)
    end
  end
end
