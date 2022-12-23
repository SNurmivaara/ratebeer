class Style < ApplicationRecord
  include AverageRating

  has_many :beers
  has_many :ratings, through: :beers

  def self.top(lim)
    sorted_by_rating_in_desc_order = Style.all.sort_by(&:average_rating).reverse
    sorted_by_rating_in_desc_order.first(lim)
  end
end
