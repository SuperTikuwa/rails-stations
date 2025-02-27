class Admin::MoviesController < ApplicationController
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
      if @movie.update(movie_params)
        redirect_to admin_movies_path
      else
        render :edit, status: :ok
      end
    else
      render :edit, status: :ok
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    if movie.nil?
      render :edit, status: :bad_request
    else
      movie.destroy
      redirect_to admin_movies_path
    end
  end

  private

  def movie_params
    if params[:movie].present?
      params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
    end
  end
end
