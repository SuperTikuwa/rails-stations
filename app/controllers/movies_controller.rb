class MoviesController < ApplicationController
  def index
    if params[:keyword].present?
      @movies = Movie.where("name LIKE ? OR description LIKE ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    else
      @movies = Movie.all
    end

    if params[:is_showing] != "all" && params[:is_showing].present?
      @movies.where!(is_showing: params[:is_showing])
    end
  end

  def show
    @movie = Movie.find(params[:id])

    if params[:date].present?
      params[:date] = params[:date].to_date
      @date = params[:date].year.to_s + "-" + params[:date].month.to_s + "-" + params[:date].day.to_s
    else
      @date = Date.today.strftime("%Y-%m-%d")
    end
    @date = @date.to_s.split("-")
  end
end
