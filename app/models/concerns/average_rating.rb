module AverageRating
    extend ActiveSupport::Concern

    def average_rating
        (ratings.sum(:score)/ratings.count).to_f
    end
end