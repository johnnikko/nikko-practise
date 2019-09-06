class Transaction < ActiveRecord::Base
  before_save :available_movie?

  belongs_to :customer
  belongs_to :user
  belongs_to :movie

  validates :user_id     ,presence: true
  validates :customer_id ,presence: true
  validates :movie_id    ,presence: true
  validates :quantity    ,presence: true

  def available_movie?
    @total_copy = Movie.find(self.movie_id)
    @total_rented = Transaction.where(movie_id: self .movie_id).sum(:quantity)
    @available_copy = @total_copy.total_copy + @total_rented
    errors.add("not enough copy") if @available_copy < self.quantity
  end

end