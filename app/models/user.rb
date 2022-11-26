class User < ApplicationRecord
  include AverageRating

  validates :username, uniqueness: true,
                       length: { minimum: 3, maximum: 30 }

  has_many :ratings
  has_many :beers, through: :ratings
end
