class Issue < ActiveRecord::Base
  validates :movie_id, presence: true
  validates :description, presence:true

  belongs_to :movie
end