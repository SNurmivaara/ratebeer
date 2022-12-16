class BeerClub < ApplicationRecord
  has_many :memberships
  has_many :members, through: :memberships, source: :user 

  def to_s
    name = beer_club.find(params[:beer_club_id])
    "#{name}"
  end
end
