class Brewery < ApplicationRecord
  include AverageRating
  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  validates :name, presence: true
  validates :year, numericality: { greater_than_or_equal_to: 1040,
                                   only_integer: true }
  validate :founding_year_cannot_be_in_the_future

  scope :active, -> { where active: true }
  scope :retired, -> { where active: [nil, false] }

  def self.top(lim)
    sorted_by_rating_in_desc_order = Brewery.all.sort_by(&:average_rating).reverse
    sorted_by_rating_in_desc_order.first(lim)
  end

  def founding_year_cannot_be_in_the_future
    return unless year > Time.now.year

    errors.add(:year, "can't be in the future")
  end
end
