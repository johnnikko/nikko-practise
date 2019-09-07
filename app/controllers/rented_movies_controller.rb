class RentedMoviesController < ApplicationController
  def index
    @rented_movies = Movie.includes(:transactions).page(params[:page]).per(10)
  end
end
