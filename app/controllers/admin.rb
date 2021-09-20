class Admin < ApplicationController
  def index
    @movies = Movie.where(is_showing: true)
  end
end
