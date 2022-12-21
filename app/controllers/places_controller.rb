class PlacesController < ApplicationController
  before_action :set_place, only: %i[show]

  def index
  end

  def show
  end

  def search
    @places = BeermappingApi.places_in(params[:city])
    session[:last_city] = params[:city]
    if @places.empty?
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      render :index, status: 418
    end
  end

  def set_place
    @place = Rails.cache.read(session[:last_city]).select{ |p| p.id == params[:id] }
  end
end
