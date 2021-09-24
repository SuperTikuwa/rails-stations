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
    if movie_params.present?
      m = Movie.new
      m.name = "hoge" + rand(100).to_s
      m.year = 2000
      m.description = "This is the description"
      m.image_url = "https://placehold.jp/150x150.png"
      m.is_showing = true

      m.save

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
