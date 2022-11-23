class Brewery < ApplicationRecord
    include AverageRating
    
    has_many :beers, dependent: :destroy
    has_many :ratings, through: :beers

    #def average_rating
    #    self.ratings.sum(:score)/self.ratings.count
    #end
end
