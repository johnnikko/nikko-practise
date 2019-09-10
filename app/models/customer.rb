class Customer < ActiveRecord::Base

  validates :name,    presence: true, uniqueness: { case_sensitive: false }
  validates :gender,  presence: true
  validates :status,  presence: true
  validates :age,     presence: true
  validates :email,   presence: true
  validates :address, presence: true

  belongs_to :user
  has_many :transactions, dependent: :destroy

end