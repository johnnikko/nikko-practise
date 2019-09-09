class Transaction < ActiveRecord::Base

  belongs_to :customer
  belongs_to :user
  belongs_to :movie

  validates :user_id     ,presence: true
  validates :customer_id ,presence: true
  validates :movie_id    ,presence: true
  validates :quantity    ,presence: true

  validate :is_available

  private
  def is_available
    movie = Movie.find(self.movie_id)
    total_rented = Transaction.where(movie_id: self.movie_id).sum(:quantity)
    available_copy = movie.total_copy - total_rented
    errors.add(:quantity,"Cannot be provided!") if !self.quantity.nil? && available_copy < self.quantity
  end
end