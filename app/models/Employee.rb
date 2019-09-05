class Employee < ActiveRecord::Base

  has_one :account

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :middle_name, presence: true
  validates :status, presence: true
  validates :position, presence: true
  validates :contact_number, presence: true
  validates :address, presence:true
end