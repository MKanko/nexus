class Schedule < ApplicationRecord
  belongs_to :user
  has_many :tasks

  def user_username=(name)
    self.user = User.find_or_create_by(username: name)
  end 

  def user_username
    self.user ? self.user.username : nil
  end  
end
