class AttractionsController < ApplicationController
  before_action :authorize_user, :current_user


  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    session[:attraction_id] = params[:id]
  end


end
