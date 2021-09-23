class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to admin_movies_path
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to admin_movies_path
    else
      logger.debug "FUGAFUGA"
      render :edit
    end
  end

  private

  def movie_params
    params.require("movie").permit(:name, :year, :description, :image_url, :is_showing)
    # params.permit(:movie)
  end
end
