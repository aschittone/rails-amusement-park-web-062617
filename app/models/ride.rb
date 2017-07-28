class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if too_short && !enough_tickets
      return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif too_short
      return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif !enough_tickets
      return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    else
      self.update_tickets
      self.update_mood
      return "Thanks for riding the #{self.attraction.name}!"
    end
  end

  def too_short
    self.user.height <= self.attraction.min_height
  end

  def enough_tickets
    self.user.tickets >= self.attraction.tickets
  end

  def update_tickets
    current_tickets = self.user.tickets - self.attraction.tickets
    self.user.update(tickets: current_tickets)
  end

  def update_mood
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    self.user.update(nausea: new_nausea, happiness: new_happiness)
  end
end
