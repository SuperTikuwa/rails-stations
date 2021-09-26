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
end
