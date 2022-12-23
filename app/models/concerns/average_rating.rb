module AverageRating
  extend ActiveSupport::Concern

  def average_rating
    if ratings.exists?
      (ratings.sum(:score) / ratings.count.to_f).round(1)
    else
      0
    end
  end
end
