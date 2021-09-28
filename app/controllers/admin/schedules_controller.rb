class Admin::SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def edit
    @schedule = Schedule.find(params[:schedule_id])
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
