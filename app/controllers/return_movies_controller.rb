class ReturnMoviesController < ApplicationController
  def index
    @return_movies = ReturnMovie.includes(:transaction,:movie).page(params[:page]).per(10)
  end

  def new
    @return_movie = ReturnMovie.new
  end

  def create

  end
end
