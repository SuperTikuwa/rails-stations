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
    if @movie.update(edit_movie_params)
      redirect_to admin_movies_path
    else
      render "/admin/movies/#{params[:id]}/edit"
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
  end

  private

  def edit_movie_params
    params.permit(:name, :year, :description, :image_url, :is_showing)
  end
end
