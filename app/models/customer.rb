class Customer < ActiveRecord::Base
  belongs_to :user
  has_many :transactions

  validates :name,    presence: true
  validates :gender,  presence: true
  validates :status,  presence: true
  validates :age,     presence: true
  validates :email,   presence: true
  validates :address, presence: true
end