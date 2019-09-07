class Task < ApplicationRecord
  belongs_to :schedule
  belongs_to :company

  def schedule_name=(name)
    self.schedule = Schedule.find_or_create_by(name: name)
  end 

  def schedule_name
    self.schedule ? self.schedule.name : nil
  end

  def company_company_name=(name)
    self.company = company.find_or_create_by(company_name: name)
  end 

  def company_company_name
    self.company ? self.company.company_name : nil
  end 

end


