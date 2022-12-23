class Beer < ApplicationRecord
  include AverageRating

  belongs_to :brewery
  belongs_to :style
  has_many :ratings, dependent: :destroy
  has_many :raters, through: :ratings, source: :user

  validates :name, presence: true

  def self.top(lim)
    sorted_by_rating_in_desc_order = Beer.all.sort_by(&:average_rating).reverse
    sorted_by_rating_in_desc_order.first(lim)
  end

  def to_s
    "#{name}, Brewery: #{brewery.name}"
  end
end
