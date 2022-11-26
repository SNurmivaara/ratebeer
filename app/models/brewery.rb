class Brewery < ApplicationRecord
  include AverageRating

  validates :name, presence: true

  validates :year, numericality: { greater_than_or_equal_to: 1040,
    only_integer: true }

  validate :founding_year_cannot_be_in_the_future

  def founding_year_cannot_be_in_the_future
    if year > Time.now.year
      errors.add(:year, "can't be in the future")
    end
  end

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers
end
