class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    self.user.tickets -= self.attraction.tickets
    self.user.save
    self.attraction.save
    self.save
  end
end
