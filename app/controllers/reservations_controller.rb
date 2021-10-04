class ReservationsController < ApplicationController
  def new
    if !params["date"].present? || !params["sheet_id"].present?
      render :new, status: :bad_request
      return
    end

    @schedule = Schedule.find(params[:schedule_id])
    @sheets = Sheet.where(id: params[:sheet_id])
    @movie = Movie.find(params[:movie_id])
    @reservation = Reservation.new
  end

  def create
    if reservation_params.present?
      @sheets = Sheet.where(id: reservation_params[:sheet_id])
      @schedule = Schedule.find(reservation_params[:schedule_id])
    else
      redirect_to movies_path, status: :bad_request
      return
    end

    for sheet_id in reservation_params[:sheet_id].split
      reservation = Reservation.new(reservation_params)
      reservation.sheet_id = sheet_id

      if !Reservation.where(schedule_id: reservation.schedule_id, sheet_id: reservation.sheet_id).present?
        reservation.save!
      else
        redirect_to "/movies/" + reservation.schedule.movie_id.to_s + "/schedules/" + reservation.schedule_id.to_s + "/sheets?date=" + params[:reservation][:date]
        return
      end
    end

    # reservation.schedule = @schedule
    redirect_to movies_path
  end

  private

  def reservation_params
    if params[:reservation].present?
      params.require(:reservation).permit(:schedule_id, :sheet_id, :name, :email, :date)
    end
  end
end
