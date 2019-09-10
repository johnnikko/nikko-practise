module RentedMoviesHelper
  def available_movies(total_copy, rented_movies)
    available_copy = total_copy - rented_movies
  end
end
