class Admin::MoviesController < ApplicationController
  before_action :set_movie, only: [:edit,:show,:update,:delete]
  helper_method :movie_exits?

  def index
    @movies = Movie.includes(:issues).page(params[:page]).per(10)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    if @movie.save
      flash[:success] = "Movie successfuly save!"
      redirect_to admin_movies_path
    else
      render :new
    end
  end

  def edit
    #set_movie
  end

  def update
    if @movie.update(movie_params)
      flash[:success] = "Movie successfuly update!"
      redirect_to admin_movies_path(page: params[:page])
    else
      render :edit
    end
  end

  def destroy
    if @movie.destroy
      flash['success'] = "Movie successfuly deleted!"
      redirect_to admin_movies_path
    end
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title,:description,:total_copy,:price)
  end

  def movie_exist?
    Movie.where(title: params(:title)).exists?
  end
end
