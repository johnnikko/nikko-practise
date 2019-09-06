class Movie < ActiveRecord::Base
  has_many :transactions

  validates :title,       presence: true, uniqueness: true, on: [:create,:update]
  validates :description, presence: true
  validates :total_copy,  presence: true
  validates :price,       presence: true

end