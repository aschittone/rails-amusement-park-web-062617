class RidesController < ApplicationController
  def create
    @ride = Ride.create(user_id: session[:user_id], attraction_id: session[:attraction_id])
    @ride.take_ride
    redirect_to user_path(session[:user_id])
  end

end
