class User < ApplicationRecord
  include AverageRating

  has_secure_password

  validates :username, uniqueness: true,
                       length: { minimum: 3, maximum: 30 }

  validates :password, format: { with: /\A(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{4,}\z/, message: "Please check that the password is at least 4 characters long and has an uppercase letter and a number" }

  has_many :ratings, dependent: :destroy
  has_many :beers, through: :ratings
  has_many :styles, through: :beers
  has_many :memberships, dependent: :destroy
  has_many :beer_clubs, through: :memberships

  def favorite_beer
    return nil if ratings.empty?

    ratings.max_by(&:score).beer
  end

  def favorite_style
    return nil if ratings.empty?

    Style.find(styles.group(:id).count.max_by{ |_, v| v }.first)
  end

  def favorite_brewery
    return nil if ratings.empty?

    Brewery.find(ratings.joins(beer: :brewery).group(:brewery_id).count.max_by{ |_id, votes| votes }.first)
  end

  def self.top(lim)
    sorted_by_rating_count_in_desc_order = User.all.sort_by{ |u| u.ratings.count }.reverse
    sorted_by_rating_count_in_desc_order.first(lim)
  end
end
