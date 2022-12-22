class MembershipsController < ApplicationController
  def index
    @memberships = Membership.all
  end

  def new
    @membership = Membership.new
    @beer_clubs = BeerClub.where('id NOT IN (SELECT beer_club_id FROM memberships WHERE user_id = ?)', current_user.id)
  end

  def create
    @membership = Membership.new params.require(:membership).permit(:beer_club_id, :user_id)
    @membership.user = current_user

    if @membership.save
      redirect_to beer_club_path(@membership.beer_club), notice: "#{current_user.username} welcome to the club."
    else
      @beer_clubs = BeerClubs.all
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    search = params.require(:membership).permit(:beer_club_id, :user_id)
    membership = Membership.where("user_id = ? AND beer_club_id = ?", search[:beer_club_id], search[:user_id])[0]
    membership.destroy
    if membership.destroyed?
      redirect_to current_user, notice: "Club left succesfully"
    else
      redirect_to current_user, notice: "Leaving club failed"
    end
  end
end
