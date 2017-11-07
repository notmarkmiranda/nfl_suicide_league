class User < ApplicationRecord
  has_secure_password

  validates :email_address, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, uniqueness: true

  has_many :user_leagues
  has_many :leagues, through: :user_leagues
end
