class ReturnMovie < ActiveRecord::Base
  validates :user_id, presence: true
  validates :trasaction_id, presence: true
  validates :quantity, presence: true

  belongs_to :trasaction
  belongs_to :user
end