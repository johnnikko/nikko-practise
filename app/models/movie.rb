class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :total_copy, presence: true
  validates :price, presence: true
end