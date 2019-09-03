class Task < ApplicationRecord
  belongs_to :schedule
  belongs_to :client

  def schedule_name=(name)
    self.schedule = Schedule.find_or_create_by(name: name)
  end 

  def schedule_name
    self.schedule ? self.schedule.name : nil
  end

end


