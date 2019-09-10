class Admin::IssuesController < ApplicationController
  def new
    @issue = Issue.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @issue = @movie.issues.create(params.require(:issue).permit(:description))
    if @issue.save
      flash[:success] = "Isseu added!"
      redirect_to admin_movie_path(@movie)
    end
  end
end
