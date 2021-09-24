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
    logger.debug movie_params.present?
    logger.debug movie_params
    logger.debug params
    logger.debug params[:movie]
    if movie_params.present?
      movie_params[:name] = movie_params[:name] + "_" + @movie.year.to_s
      movie_params[:year] = @movie.year
      movie_params[:description] = @movie.description
      movie_params[:image_url] = @movie.image_url
      Movie.create!(movie_params)
      if @movie.update(movie_params)
        redirect_to admin_movies_path
      else
        render :edit, status: :ok
      end
    else
      render :edit, status: :ok
    end
  end

  private

  def movie_params
    if params[:movie].present?
      params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
    end
  end
end
