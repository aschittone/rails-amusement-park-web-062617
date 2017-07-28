class RidesController < ApplicationController
  def new
    @ride = Ride.create
    binding.pry
    redirect_to user_path(session[:user_id])
  end

end
