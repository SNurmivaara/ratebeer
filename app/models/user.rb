class User < ApplicationRecord
  include AverageRating

  has_secure_password

  validates :username, uniqueness: true,
                       length: { minimum: 3, maximum: 30 }

  validates :password, format: { with: /\A(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{4,}\z/, message: "Please check that the password is at least 4 characters long and has an uppercase letter and a number" }

  has_many :ratings
  has_many :beers, through: :ratings
  has_many :memberships
  has_many :beer_clubs, through: :memberships
end
