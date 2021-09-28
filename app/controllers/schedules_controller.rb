class SchedulesController < ApplicationController
  private

  def schedule_params
    # if params[:schedule].present?
    params.require(:schedule).permit(:movie_id, :start_time, :end_time)
    # end
  end
end
