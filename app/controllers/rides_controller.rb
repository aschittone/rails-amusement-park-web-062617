class RidesController < ApplicationController

  # def new
  #   @ride = Ride.new()
  # end


  def create
    @attraction = Attraction.find_by(id: session[:attraction_id])
      @ride = Ride.new(user_id: session[:user_id], attraction_id: @attraction.id)
      flash[:message] = @ride.take_ride
      redirect_to user_path(@ride.user)
  end


end
