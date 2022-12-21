class MembershipsController < ApplicationController
  def index
    @memberships = Membership.all
  end

  def new
    @membership = Membership.new
    @beer_clubs = BeerClub.where('id NOT IN (SELECT beer_club_id FROM memberships WHERE user_id = ?)', current_user.id)
  end

  def create
    @membership = Membership.new params.require(:membership).permit(:beer_club_id)
    @membership.user = current_user

    if @membership.save
      redirect_to beer_club_path(@membership.beer_club), notice: "#{current_user.username} welcome to the club."
    else
      @beer_clubs = BeerClubs.all
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    membership = membership.find(params[:id])
    membership.delete
    redirect_to current_user
  end
end
