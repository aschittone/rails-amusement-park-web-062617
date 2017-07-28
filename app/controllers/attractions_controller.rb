class AttractionsController < ApplicationController
  before_action :authorize_user, :current_user

  def new
    @new_attraction = Attraction.new
  end

  def create
    @new_attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@new_attraction)
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    session[:attraction_id] = params[:id]
  end

private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets, :admin, :password)
  end

end
