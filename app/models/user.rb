class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  # validates :name, :height, :happiness, :nausea, :tickets, :password, presence: true
  # validates :name, uniqueness: true



  def mood
    if self.nausea > self.happiness
      return 'sad'
    else
      return 'happy'
    end
  end


end
