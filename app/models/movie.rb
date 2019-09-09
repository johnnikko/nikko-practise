class Movie < ActiveRecord::Base

  validates :title,       presence: true, uniqueness: true, on: [:create,:update]
  validates :description, presence: true
  validates :total_copy,  presence: true
  validates :price,       presence: true

  has_many :transactions
  has_many :issues

end